library ieee;
    use ieee.std_logic_1164.all;

entity matrix_control is
    port (
        -- Clock and reset
        i_clk :    in std_logic;
        i_rst :    in std_logic;

        -- Matrix control signals
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

    -- ping and pong buffers
        -- split buffers in half to make addressing easier
            -- 2 scan lines on matrix
        -- one buffer is displayed, other is updated
    -- at least two state machines
        -- one controls updating the ping/pong buffers
            -- should only swap buffers when other state machine finishes
        -- one controls outputting the image
            -- shift out row of data
            -- in one cycle:
                -- toggle output enable
                -- toggle latch
                -- set address lines (A-D)
            -- toggle output enable again the following cycle
            -- might need to play around with this some
    -- eventually want to add in gamma correction and dithering

begin

end architecture;
