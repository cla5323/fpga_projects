library ieee;
    use ieee.std_logic_1164.all;

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

begin

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
