library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

library unisim;
    use unisim.vcomponents.all;

entity mizar_z7 is
    port (
        -- Reference clock
        PL_CLK_50M :    in std_logic;

        -- Buttons
        PL_KEY1 :    in std_logic;
        PL_KEY2 :    in std_logic;
        PL_KEY3 :    in std_logic;
        PL_KEY4 :    in std_logic;

        -- LEDs
        PL_LED1 :   out std_logic;
        PL_LED2 :   out std_logic;
        PL_LED3 :   out std_logic;
        PL_LED4 :   out std_logic;

        -- HDMI 1 (marked TX on board)
        HDMI1_CLK_P   :   out std_logic;
        HDMI1_CLK_N   :   out std_logic;
        HDMI1_D0_P    :   out std_logic;
        HDMI1_D0_N    :   out std_logic;
        HDMI1_D1_P    :   out std_logic;
        HDMI1_D1_N    :   out std_logic;
        HDMI1_D2_P    :   out std_logic;
        HDMI1_D2_N    :   out std_logic;
        HDMI1_HPD     :    in std_logic;
        HDMI1_OUT_EN  :   out std_logic;
        HDMI1_I2C_SCL : inout std_logic;
        HDMI1_I2C_SDA : inout std_logic;

        -- HDMI 2 (marked RX on board)
        HDMI2_CLK_P   :    in std_logic;
        HDMI2_CLK_N   :    in std_logic;
        HDMI2_D0_P    :    in std_logic;
        HDMI2_D0_N    :    in std_logic;
        HDMI2_D1_P    :    in std_logic;
        HDMI2_D1_N    :    in std_logic;
        HDMI2_D2_P    :    in std_logic;
        HDMI2_D2_N    :    in std_logic;
        HDMI2_HPD     :   out std_logic;
        HDMI2_OUT_EN  :   out std_logic;
        HDMI2_I2C_SCL : inout std_logic;
        HDMI2_I2C_SDA : inout std_logic;

        -- MIPI CSI
        LP_CLK_P   :    in std_logic;
        LP_CLK_N   :    in std_logic;
        LP_LANE0_P :    in std_logic;
        LP_LANE0_N :    in std_logic;
        LP_LANE1_P :    in std_logic;
        LP_LANE1_N :    in std_logic;
        CAM_CLK    :   out std_logic;
        -- CAM_GPIO   :   out std_logic;  -- PL_LED4 (NC)
        -- CAM_SCL    :   out std_logic;  -- EEPROM_I2C_SCL
        -- CAM_SDA    : inout std_logic;  -- EEPROM_I2C_SDA

        -- EEPROM
        EEPROM_I2C_SCL :   out std_logic;
        EEPROM_I2C_SDA : inout std_logic;

        -- GPIO 1
        GPIO1_0P  : inout std_logic;
        GPIO1_0N  : inout std_logic;
        GPIO1_1P  : inout std_logic;
        GPIO1_1N  : inout std_logic;
        GPIO1_2P  : inout std_logic;
        GPIO1_2N  : inout std_logic;
        GPIO1_3P  : inout std_logic;
        GPIO1_3N  : inout std_logic;
        GPIO1_4P  : inout std_logic;
        GPIO1_4N  : inout std_logic;
        GPIO1_5P  : inout std_logic;
        GPIO1_5N  : inout std_logic;
        GPIO1_6P  : inout std_logic;
        GPIO1_6N  : inout std_logic;
        GPIO1_7P  : inout std_logic;
        GPIO1_7N  : inout std_logic;
        GPIO1_8P  : inout std_logic;
        GPIO1_8N  : inout std_logic;
        GPIO1_9P  : inout std_logic;
        GPIO1_9N  : inout std_logic;
        GPIO1_10P : inout std_logic;
        GPIO1_10N : inout std_logic;
        GPIO1_11P : inout std_logic;
        GPIO1_11N : inout std_logic;
        GPIO1_12P : inout std_logic;
        GPIO1_12N : inout std_logic;
        GPIO1_13P : inout std_logic;
        GPIO1_13N : inout std_logic;
        GPIO1_14P : inout std_logic;
        GPIO1_14N : inout std_logic;
        GPIO1_15P : inout std_logic;
        GPIO1_15N : inout std_logic;
        GPIO1_16P : inout std_logic;
        GPIO1_16N : inout std_logic;
        GPIO1_17P : inout std_logic;
        GPIO1_17N : inout std_logic;

        -- GPIO 2
        GPIO2_0P  : inout std_logic;
        GPIO2_0N  : inout std_logic;
        GPIO2_1P  : inout std_logic;
        GPIO2_1N  : inout std_logic;
        GPIO2_2P  : inout std_logic;
        GPIO2_2N  : inout std_logic;
        GPIO2_3P  : inout std_logic;
        GPIO2_3N  : inout std_logic;
        GPIO2_4P  : inout std_logic;
        GPIO2_4N  : inout std_logic;
        GPIO2_5P  : inout std_logic;
        GPIO2_5N  : inout std_logic;
        GPIO2_6P  : inout std_logic;
        GPIO2_6N  : inout std_logic;
        GPIO2_7P  : inout std_logic;
        GPIO2_7N  : inout std_logic;
        GPIO2_8P  : inout std_logic;
        GPIO2_8N  : inout std_logic;
        GPIO2_9P  : inout std_logic;
        GPIO2_9N  : inout std_logic;
        GPIO2_10P : inout std_logic;
        GPIO2_10N : inout std_logic;
        GPIO2_11P : inout std_logic;
        GPIO2_11N : inout std_logic;
        GPIO2_12P : inout std_logic;
        GPIO2_12N : inout std_logic;
        GPIO2_13P : inout std_logic;
        GPIO2_13N : inout std_logic;
        GPIO2_14P : inout std_logic;
        GPIO2_14N : inout std_logic;
        GPIO2_15P : inout std_logic;
        GPIO2_15N : inout std_logic;
        GPIO2_16P : inout std_logic;
        GPIO2_16N : inout std_logic;
        GPIO2_17P : inout std_logic;
        GPIO2_17N : inout std_logic
    );
end entity;

architecture rtl of mizar_z7 is

    signal s_hdmi1_clk : std_logic := '0';
    signal s_hdmi1_d0  : std_logic := '0';
    signal s_hdmi1_d1  : std_logic := '0';
    signal s_hdmi1_d2  : std_logic := '0';

    signal s_hdmi2_clk : std_logic;
    signal s_hdmi2_d0  : std_logic;
    signal s_hdmi2_d1  : std_logic;
    signal s_hdmi2_d2  : std_logic;

    signal s_lp_clk   : std_logic;
    signal s_lp_lane0 : std_logic;
    signal s_lp_lane1 : std_logic;

    signal s_clk    : std_logic;
    signal s_locked : std_logic;
    signal s_fb_clk : std_logic;

    signal s_rst_cnt : natural range 0 to 999 := 0;
    signal s_rst     : std_logic := '1';

    signal s_r1   : std_logic_vector(31 downto 0);
    signal s_g1   : std_logic_vector(31 downto 0);
    signal s_b1   : std_logic_vector(31 downto 0);
    signal s_r2   : std_logic_vector(31 downto 0);
    signal s_g2   : std_logic_vector(31 downto 0);
    signal s_b2   : std_logic_vector(31 downto 0);
    signal s_row  : std_logic_vector(3 downto 0);
    signal s_busy : std_logic;

    signal flag : std_logic_vector(3 downto 0);

begin

    u_pll : PLLE2_BASE
        generic map (
            CLKFBOUT_MULT => 16,
            CLKIN1_PERIOD => 20.000,
            CLKOUT0_DIVIDE => 128
        )
        port map (
            CLKOUT0 => s_clk,
            CLKFBOUT => s_fb_clk,
            LOCKED => s_locked,
            CLKIN1 => PL_CLK_50M,
            PWRDWN => '0',
            RST => '0',
            CLKFBIN => s_fb_clk
        );

    -- 1000 clock reset
    process (s_clk) is
    begin
        if rising_edge(s_clk) then
            if s_locked = '1' then
                if s_rst_cnt = 999 then
                    s_rst <= '0';
                else
                    s_rst_cnt <= s_rst_cnt + 1;
                    s_rst <= '1';
                end if;
            end if;
        end if;
    end process;

    -- Really messy process to generate a test pattern
    process (s_clk) is
    begin
        if rising_edge(s_clk) then
            if s_rst = '1' then
                s_r1  <= "00000000000000000000000000000001"; --"10011001100110011001100110011001";
                s_g1  <= "00000000000000000000000000000000"; --"01010101010101010101010101010101";
                s_b1  <= "00000000000000000000000000000000"; --"00110011001100110011001100110011";
                s_r2  <= "00000000000000000000000000000000"; --"00110011001100110011001100110011";
                s_g2  <= "00000000000000000000000000000000"; --"10101010101010101010101010101010";
                s_b2  <= "00000000000000000000000000000000"; --"01100110011001100110011001100110";
                s_row <= "0000";
                flag <= "0000";
            else
                -- Should be low for one cycle since i_start tied high
                if s_busy = '0' then
                    flag <= std_logic_vector(unsigned(flag) + 1);
                    -- s_r1 <= s_r1(0) & s_r1(31 downto 1);
                    -- s_g1 <= s_g1(0) & s_g1(31 downto 1);
                    -- s_b1 <= s_b1(0) & s_b1(31 downto 1);
                    -- s_r2 <= s_r2(30 downto 0) & s_r2(31);
                    -- s_g2 <= s_g2(30 downto 0) & s_g2(31);
                    -- s_b2 <= s_b2(30 downto 0) & s_b2(31);
                    if flag = "1111" then
                        s_r1 <= s_r2;
                        s_r2 <= s_r1;
                    s_row <= std_logic_vector(unsigned(s_row) + 1);
                    end if;
                end if;
            end if;
        end if;
    end process;

    u_matrix_control : entity work.matrix_control
        port map(
            -- Clock and reset
            i_clk => s_clk,
            i_rst => s_rst,

            -- FPGA data and control
            i_r1    => s_r1,
            i_g1    => s_g1,
            i_b1    => s_b1,
            i_r2    => s_r2,
            i_g2    => s_g2,
            i_b2    => s_b2,
            i_row   => s_row,
            i_start => '1',
            o_busy  => s_busy,

            -- Matrix control
            o_r1  => GPIO1_5P,   -- pin 13
            o_g1  => GPIO1_5N,   -- pin 14
            o_b1  => GPIO1_6P,   -- pin 15
            o_r2  => GPIO1_7P,   -- pin 17
            o_g2  => GPIO1_7N,   -- pin 18
            o_b2  => GPIO1_8P,   -- pin 19
            o_a   => GPIO1_9P,   -- pin 21
            o_b   => GPIO1_9N,   -- pin 22
            o_c   => GPIO1_10P,  -- pin 23
            o_d   => GPIO1_10N,  -- pin 24
            o_clk => GPIO1_11P,  -- pin 25
            o_lat => GPIO1_11N,  -- pin 26
            o_oe  => GPIO1_12P   -- pin 27
        );

    GPIO1_6N  <= '0';  -- pin 16
    GPIO1_8N  <= '0';  -- pin 20
    GPIO1_12N <= '0';  -- pin 28

    ----------------------------------------------------
    --                 Signal Buffers                 --
    ----------------------------------------------------

    u_hdmi1_clk_obufds : OBUFDS
        generic map (
            IOSTANDARD => "TMDS_33",
            SLEW       => "FAST"
        )
        port map (
            I  => s_hdmi1_clk,
            O  => HDMI1_CLK_P,
            OB => HDMI1_CLK_N
        );

    u_hdmi1_d0_obufds : OBUFDS
        generic map (
            IOSTANDARD => "TMDS_33",
            SLEW       => "FAST"
        )
        port map (
            I  => s_hdmi1_d0,
            O  => HDMI1_D0_P,
            OB => HDMI1_D0_N
        );

    u_hdmi1_d1_obufds : OBUFDS
        generic map (
            IOSTANDARD => "TMDS_33",
            SLEW       => "FAST"
        )
        port map (
            I  => s_hdmi1_d1,
            O  => HDMI1_D1_P,
            OB => HDMI1_D1_N
        );

    u_hdmi1_d2_obufds : OBUFDS
        generic map (
            IOSTANDARD => "TMDS_33",
            SLEW       => "FAST"
        )
        port map (
            I  => s_hdmi1_d2,
            O  => HDMI1_D2_P,
            OB => HDMI1_D2_N
        );

    u_hdmi2_clk_ibufds : IBUFDS
        generic map (
            IOSTANDARD   => "TMDS_33",
            DIFF_TERM    => TRUE,  -- No termination on PCB
            IBUF_LOW_PWR => TRUE
        )
        port map (
            O  => s_hdmi2_clk,
            I  => HDMI2_CLK_P,
            IB => HDMI2_CLK_N
        );

    u_hdmi2_d0_ibufds : IBUFDS
        generic map (
            IOSTANDARD   => "TMDS_33",
            DIFF_TERM    => TRUE,  -- No termination on PCB
            IBUF_LOW_PWR => TRUE
        )
        port map (
            O  => s_hdmi2_d0,
            I  => HDMI2_D0_P,
            IB => HDMI2_D0_N
        );

    u_hdmi2_d1_ibufds : IBUFDS
        generic map (
            IOSTANDARD   => "TMDS_33",
            DIFF_TERM    => TRUE,  -- No termination on PCB
            IBUF_LOW_PWR => TRUE
        )
        port map (
            O  => s_hdmi2_d1,
            I  => HDMI2_D1_P,
            IB => HDMI2_D1_N
        );

    u_hdmi2_d2_ibufds : IBUFDS
        generic map (
            IOSTANDARD   => "TMDS_33",
            DIFF_TERM    => TRUE,  -- No termination on PCB
            IBUF_LOW_PWR => TRUE
        )
        port map (
            O  => s_hdmi2_d2,
            I  => HDMI2_D2_P,
            IB => HDMI2_D2_N
        );

    u_s_lp_clk_ibufdf : IBUFDS
        generic map (
            IOSTANDARD   => "LVDS_25",
            DIFF_TERM    => FALSE,  -- Termination on PCB
            IBUF_LOW_PWR => TRUE
        )
        port map (
            O  => s_lp_clk,
            I  => LP_CLK_P,
            IB => LP_CLK_N
        );

    u_s_lp_lane0_ibufdf : IBUFDS
        generic map (
            IOSTANDARD   => "LVDS_25",
            DIFF_TERM    => FALSE,  -- Termination on PCB
            IBUF_LOW_PWR => TRUE
        )
        port map (
            O  => s_lp_lane0,
            I  => LP_LANE0_P,
            IB => LP_LANE0_N
        );

    u_s_lp_lane1_ibufdf : IBUFDS
        generic map (
            IOSTANDARD   => "LVDS_25",
            DIFF_TERM    => FALSE,  -- Termination on PCB
            IBUF_LOW_PWR => TRUE
        )
        port map (
            O  => s_lp_lane1,
            I  => LP_LANE1_P,
            IB => LP_LANE1_N
        );

end architecture;
