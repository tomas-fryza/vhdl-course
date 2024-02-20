-------------------------------------------------
--! @brief Full adder
--! @version 1.1
--! @copyright (c) 2019 Tomas Fryza, MIT license
--!
--! <detail>
--!
--! Developed using TerosHDL, Vivado 2020.2, and
--! EDA Playground. Tested on the Nexys A7-50T
--! board featuring the xc7a50ticsg324-1L FPGA.
-------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

-------------------------------------------------

entity full_adder_v2 is
  port (
    carry_in  : in    std_logic; --! Input carry
    b         : in    std_logic; --! Input b
    a         : in    std_logic; --! Input a
    carry_out : out   std_logic; --! Output carry
    sum       : out   std_logic  --! Output sum
  );
end entity full_adder_v2;

-------------------------------------------------

architecture behavioral of full_adder_v2 is
  component half_adder
    port (
      b     : in    std_logic;
      a     : in    std_logic;
      carry : out   std_logic;
      sum   : out   std_logic
    );
    end component;

  -- Internal signals between two half adders
  signal sig_carry0 : std_logic;
  signal sig_carry1 : std_logic;
  signal sig_sum0   : std_logic;

begin

  --! Instantiate (make a copy of) two `half_adder`
  --! components.
  U1 : component half_adder
    port map (
      b     => b,
      a     => a,
      carry => sig_carry0,
      sum   => sig_sum0
    );

  U2 : component half_adder
    port map (
      b     => carry_in,
      a     => sig_sum0,
      carry => sig_carry1,
      sum   => sum
    );

  -- Output carry
  carry_out <= sig_carry0 or sig_carry1;

end architecture behavioral;
