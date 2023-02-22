------------------------------------------------------------
--
--! @title Top level of one-digit 7-segment display decoder
--! @author Tomas Fryza
--! Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
--!
--! @copyright (c) 2020 Tomas Fryza
--! This work is licensed under the terms of the MIT license
--
-- Hardware: Nexys A7-50T, xc7a50ticsg324-1L
-- Software: TerosHDL, Vivado 2020.2

library ieee;
  use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for top level
------------------------------------------------------------

entity top is
  port (
    SW   : in    std_logic_vector(3 downto 0);
    LED  : out   std_logic_vector(7 downto 0);
    CA   : out   std_logic;
    CB   : out   std_logic;
    CC   : out   std_logic;
    CD   : out   std_logic;
    CE   : out   std_logic;
    CF   : out   std_logic;
    CG   : out   std_logic;
    AN   : out   std_logic_vector(7 downto 0);
    BTNC : in    std_logic
  );
end entity top;

------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------

architecture behavioral of top is

begin

  --------------------------------------------------------------------
  -- Instance (copy) of hex_7seg entity
  --------------------------------------------------------------------

  hex2seg : entity work.hex_7seg
    port map (
      blank  => BTNC,
      hex    => SW,
      seg(6) => CA,
      seg(5) => CB,

      -- WRITE YOUR CODE HERE
      seg(4) => CC,
      seg(3) => CD,
      seg(2) => CE,
      seg(1) => CF,
      seg(0) => CG
    );

  -- Connect one common anode to 3.3V
  AN <= b"1111_0111";

  -- Display input value on LEDs
  LED(3 downto 0) <= SW;

--------------------------------------------------------------------
-- Experiments on your own: LED(7:4) indicators

-- Turn LED(4) on if input value is equal to 0, ie "0000"
-- LED(4) <= `0` when WRITE YOUR CODE HERE

-- Turn LED(5) on if input value is greater than "1001", ie 10, 11, 12, ...
-- LED(5) <= WRITE YOUR CODE HERE

-- Turn LED(6) on if input value is odd, ie 1, 3, 5, ...
-- LED(6) <= WRITE YOUR CODE HERE

-- Turn LED(7) on if input value is a power of two, ie 1, 2, 4, or 8
-- LED(7) <= WRITE YOUR CODE HERE

end architecture behavioral;
