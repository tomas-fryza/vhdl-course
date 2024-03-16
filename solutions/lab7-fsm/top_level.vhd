-------------------------------------------------
--! @brief Top level implementation for button debouncer
--! @version 1.0
--! @copyright (c) 2024 Tomas Fryza, MIT license
--!
--! This VHDL file implements a top-level design for a <TBD>
--!
--! Developed using TerosHDL, Vivado 2023.2, and EDA Playground.
--! Tested on Nexys A7-50T board and xc7a50ticsg324-1L FPGA.
-------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;

-------------------------------------------------

entity top_level is
    port (
        CLK100MHZ : in    std_logic;                    --! Main clock
        LED       : out   std_logic_vector(3 downto 0); --! Show 4-bit counter value
        LED16_B   : out   std_logic;                    --! Show debounced signal
        BTNC      : in    std_logic;                    --! Synchronous reset
        BTNR      : in    std_logic                     --! Bouncey button to increment 4-bit counter
    );
end entity top_level;

-------------------------------------------------

architecture behavioral of top_level is
    -- Component declaration for clock enable
    component clock_enable is
        generic (
            PERIOD : integer
        );
        port (
            clk   : in    std_logic;
            rst   : in    std_logic;
            pulse : out   std_logic
        );
    end component;

    -- Component declaration for button debouncer
    component debounce is
        port (
            clk      : in    std_logic;
            rst      : in    std_logic;
            en       : in    std_logic;
            bouncey  : in    std_logic;
            clean    : out   std_logic;
            pos_edge : out   std_logic;
            neg_edge : out   std_logic
        );
    end component;

    -- Component declaration for simple counter
    component simple_counter is
        generic (
            NBIT : integer
        );
        port (
            clk   : in    std_logic;
            rst   : in    std_logic;
            en    : in    std_logic;
            count : out   std_logic_vector(NBIT - 1 downto 0)
        );
    end component;

    -- Local signals
    signal sig_en_2ms : std_logic; --! Clock enable signal for debouncer
    signal sig_event  : std_logic; --! Edge-driven signal that lasts for only one clock cycle
begin

    -- Component instantiation of clock enable for 2 ms
    clk_en : component clock_enable
        generic map (
            PERIOD => 200_000
        )
        port map (
            clk   => CLK100MHZ,
            rst   => BTNC,
            pulse => sig_en_2ms
        );

    -- Component instantiation of button debouncer
    display : component debounce
        port map (
            clk      => CLK100MHZ,
            rst      => BTNC,
            en       => sig_en_2ms,
            bouncey  => BTNR,
            clean    => LED16_B,
            pos_edge => sig_event,
            neg_edge => open
        );

    -- Component instantiation of 4-bit simple counter
    counter : component simple_counter
        generic map (
            NBIT => 4
        )
        port map (
            clk   => CLK100MHZ,
            rst   => BTNC,
            en    => sig_event,
            count => LED
        );

end architecture behavioral;
