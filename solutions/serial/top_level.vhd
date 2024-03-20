----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/18/2024 06:48:27 PM
-- Design Name:
-- Module Name: top_level - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------

library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

library ieee;
    use ieee.std_logic_1164.all;

-------------------------------------------------

entity top_level is
    port (
        CLK100MHZ : in    STD_LOGIC;
        BTNC      : in    STD_LOGIC;
        SW        : in    STD_LOGIC_VECTOR(7 downto 0);
        LED       : out   STD_LOGIC_VECTOR(7 downto 0);
        BTNR      : in    STD_LOGIC;
        TX        : out   STD_LOGIC
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

    -- Component declaration for serial tx
    component serial_tx is
        port (
            clk     : in    STD_LOGIC;
            rst     : in    STD_LOGIC;
            data    : in    STD_LOGIC_VECTOR(7 downto 0);
            trigger : in    STD_LOGIC;
            tx      : out   STD_LOGIC
        );
    end component;

    -- Local signals
    --! Clock enable signal for debouncer
    signal sig_en_2ms : std_logic;
    --! Edge-driven signal that lasts for only one clock cycle
    signal sig_event : std_logic;
begin

    -- Component instantiation of clock enable for 2 ms
    button_en : component clock_enable
        generic map (
            PERIOD => 200_000
        )
        port map (
            clk   => CLK100MHZ,
            rst   => BTNC,
            pulse => sig_en_2ms
        );

    -- Component instantiation of button debouncer
    button : component debounce
        port map (
            clk      => CLK100MHZ,
            rst      => BTNC,
            en       => sig_en_2ms,
            bouncey  => BTNR,
            clean    => open,
            pos_edge => sig_event,
            neg_edge => open
        );

    -- Component instantiation of serial tx
    serial : component serial_tx
        port map (
            clk     => CLK100MHZ,
            rst     => BTNC,
            data    => SW,
            trigger => sig_event,
            tx      => TX
        );

    LED <= SW;

end architecture behavioral;
