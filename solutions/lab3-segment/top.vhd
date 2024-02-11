-------------------------------------------------
--! @brief Top level of 7-segment display decoder
--! @version 1.2
--! @copyright (c) 2020 Tomas Fryza, MIT license
--!
--! This VHDL file implements the top-level module
--! for a binary-to-seven-segment decoder, controlling
--! two displays. The entity 'top' defines the inputs
--! for binary values (SW1 and SW0), buttons (BTNC and
--! BTND), and outputs for display cathodes (CA to CG)
--! and common anodes (AN). The module instantiates the
--! 'bin2seg' component to decode binary inputs into
--! seven-segment display signals. The selected display
--! position is controlled by BTND button, and the input
--! binary values are displayed on LEDs (LED1 and LED0).
--!
--! Developed using TerosHDL, Vivado 2020.2, and
--! EDA Playground. Tested on the Nexys A7-50T
--! board featuring the xc7a50ticsg324-1L FPGA.
-------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

-------------------------------------------------

entity top is
  port (
    SW1  : in    std_logic_vector(3 downto 0); --! Binary value for left display
    LED1 : out   std_logic_vector(3 downto 0); --! To display input binary value
    SW0  : in    std_logic_vector(3 downto 0); --! Binary value for right display
    LED0 : out   std_logic_vector(3 downto 0); --! To display input binary value
    CA   : out   std_logic;                    --! Cathode of segment A
    CB   : out   std_logic;                    --! Cathode of segment B
    CC   : out   std_logic;                    --! Cathode of segment C
    CD   : out   std_logic;                    --! Cathode of segment D
    CE   : out   std_logic;                    --! Cathode of segment E
    CF   : out   std_logic;                    --! Cathode of segment F
    CG   : out   std_logic;                    --! Cathode of segment G
    AN   : out   std_logic_vector(7 downto 0); --! Common anodes of all on-board displays
    BTNC : in    std_logic;                    --! Clear the display
    BTND : in    std_logic                     --! Switch between displays
  );
end entity top;

-------------------------------------------------

architecture behavioral of top is
  component bin2seg is
    port (
      clear : in    std_logic;
      bin   : in    std_logic_vector(3 downto 0);
      seg   : out   std_logic_vector(6 downto 0)
    );
  end component;

  --! Local signal for 7-segment decoder
  signal s_tmp : std_logic_vector(3 downto 0);
begin

  --! Instantiate (make a copy of) `bin2seg`
  --! component to decode binary input into
  --! seven-segment display signals.
  display : component bin2seg
    port map (
      clear  => BTNC,
      bin    => s_tmp,
      seg(6) => CA,
      seg(5) => CB,
      seg(4) => CC,
      seg(3) => CD,
      seg(2) => CE,
      seg(1) => CF,
      seg(0) => CG
    );

  -----------------------------------------------
  -- Connect local signal to input switches
  s_tmp <= SW1 when (BTND = '1') else
           SW0;

  -- Select one display position
  AN <= b"1111_0111" when (BTND = '1') else
        b"1111_1011";

  -- Display input value(s) on LEDs
  LED1 <= SW1;
  LED0 <= SW0;

end architecture behavioral;
