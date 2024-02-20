-------------------------------------------------
--! @brief Implementation of 4-bit adder
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

entity adder_4bit is
  port (
    c_in   : in    std_logic;
    b      : in    std_logic_vector(3 downto 0);
    a      : in    std_logic_vector(3 downto 0);
    c_out  : out   std_logic;
    result : out   std_logic_vector(3 downto 0)
  );
end entity adder_4bit;

-------------------------------------------------

architecture behavioral of adder_4bit is
  component full_adder is
    port (
      c_in  : in    std_logic;
      b     : in    std_logic;
      a     : in    std_logic;
      c_out : out   std_logic;
      sum   : out   std_logic
    );
  end component;

  signal sig_carry_0 : std_logic;
  signal sig_carry_1 : std_logic;
  signal sig_carry_2 : std_logic;
begin

  -----------------------------------------------
  -- Sub-blocks of four full_adders
  u0 : component full_adder
    port map (
      c_in  => c_in,
      b     => b(0),
      a     => a(0),
      c_out => sig_carry_0,
      sum   => result(0)
    );

  u1 : component full_adder
    port map (
      c_in  => sig_carry_0,
      b     => b(1),
      a     => a(1),
      c_out => sig_carry_1,
      sum   => result(1)
    );

  u2 : component full_adder
    port map (
      c_in  => sig_carry_1,
      b     => b(2),
      a     => a(2),
      c_out => sig_carry_2,
      sum   => result(2)
    );

  u3 : component full_adder
    port map (
      c_in  => sig_carry_2,
      b     => b(3),
      a     => a(3),
      c_out => c_out,
      sum   => result(3)
    );

end architecture behavioral;
