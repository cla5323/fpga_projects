library ieee;
    use ieee.std_logic_1164.all;

entity matrix_control is
    port (
        -- Clock and reset
        i_clk :    in std_logic;
        i_rst :    in std_logic;

        -- FPGA data and control
        i_r1    :    in std_logic_vector(31 downto 0);
        i_g1    :    in std_logic_vector(31 downto 0);
        i_b1    :    in std_logic_vector(31 downto 0);
        i_r2    :    in std_logic_vector(31 downto 0);
        i_g2    :    in std_logic_vector(31 downto 0);
        i_b2    :    in std_logic_vector(31 downto 0);
        i_row   :    in std_logic_vector(3 downto 0);
        i_start :    in std_logic;
        o_busy  :   out std_logic;

        -- Matrix control
        o_r1  :   out std_logic;
        o_g1  :   out std_logic;
        o_b1  :   out std_logic;
        o_r2  :   out std_logic;
        o_g2  :   out std_logic;
        o_b2  :   out std_logic;
        o_a   :   out std_logic;
        o_b   :   out std_logic;
        o_c   :   out std_logic;
        o_d   :   out std_logic;
        o_clk :   out std_logic;
        o_lat :   out std_logic;
        o_oe  :   out std_logic
    );
end entity;

architecture rtl of matrix_control is

    -- TODO - Add a clock divider
    --
    -- The FPGA is running at 50MHz for now which
    -- meets the spec for the serial interface

    -- State machine
    type t_state is (
        IDLE,
        SHIFT_DATA,
        LATCH_DATA,
        ENABLE_OUTPUT
    );
    signal s_state : t_state;

    -- Internal registers
    signal s_r1  : std_logic_vector(31 downto 0);
    signal s_g1  : std_logic_vector(31 downto 0);
    signal s_b1  : std_logic_vector(31 downto 0);
    signal s_r2  : std_logic_vector(31 downto 0);
    signal s_g2  : std_logic_vector(31 downto 0);
    signal s_b2  : std_logic_vector(31 downto 0);
    signal s_row : std_logic_vector(3 downto 0);

    signal s_col : natural range 0 to 31;

    signal s_clk_en : std_logic;

begin

    o_r1  <= s_r1(31);
    o_g1  <= s_g1(31);
    o_b1  <= s_b1(31);
    o_r2  <= s_r2(31);
    o_g2  <= s_g2(31);
    o_b2  <= s_b2(31);
    o_clk <= i_clk when s_clk_en = '1' else '0';

    -- TODO - Figure out a better way to gate the clock
    --        Should be easier once there's a clock divider
    process (i_clk) is
    begin
        if falling_edge(i_clk) then
            if i_rst = '1' then
                s_clk_en <= '0';
            else
                if s_state = SHIFT_DATA then
                    s_clk_en <= '1';
                else
                    s_clk_en <= '0';
                end if;
            end if;
        end if;
    end process;

    -- TODO - Maybe split this logic into multiple processes
    process (i_clk) is
    begin
        if rising_edge(i_clk) then
            if i_rst = '1' then
                s_r1  <= (others => '0');
                s_g1  <= (others => '0');
                s_b1  <= (others => '0');
                s_r2  <= (others => '0');
                s_g2  <= (others => '0');
                s_b2  <= (others => '0');
                s_row <= (others => '0');
                s_col <= 0;

                o_busy <= '0';

                o_a   <= '0';
                o_b   <= '0';
                o_c   <= '0';
                o_d   <= '0';
                o_lat <= '0';
                o_oe  <= '1';  -- active low

                s_state <= IDLE;
            else
                case s_state is
                    when IDLE =>
                        if i_start = '1' then
                            s_r1  <= i_r1;
                            s_g1  <= i_g1;
                            s_b1  <= i_b1;
                            s_r2  <= i_r2;
                            s_g2  <= i_g2;
                            s_b2  <= i_b2;
                            s_row <= i_row;
                            s_col <= 0;

                            o_busy <= '1';

                            s_state <= SHIFT_DATA;
                        end if;

                    when SHIFT_DATA =>
                        if s_col = 31 then
                            s_state <= LATCH_DATA;
                        else
                            s_r1  <= s_r1(30 downto 0) & '0';
                            s_g1  <= s_g1(30 downto 0) & '0';
                            s_b1  <= s_b1(30 downto 0) & '0';
                            s_r2  <= s_r2(30 downto 0) & '0';
                            s_g2  <= s_g2(30 downto 0) & '0';
                            s_b2  <= s_b2(30 downto 0) & '0';
                            s_col <= s_col + 1;
                        end if;

                    when LATCH_DATA =>
                        -- TODO - Validate this mapping
                        o_a   <= s_row(0);
                        o_b   <= s_row(1);
                        o_c   <= s_row(2);
                        o_d   <= s_row(3);
                        o_lat <= '1';
                        o_oe  <= '1';

                        s_state <= ENABLE_OUTPUT;

                    when ENABLE_OUTPUT =>
                        o_busy <= '0';

                        o_lat <= '0';
                        o_oe  <= '0';

                        s_state <= IDLE;
                end case;
            end if;
        end if;
    end process;

end architecture;
