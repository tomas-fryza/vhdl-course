-------------------------------------------------
--! @brief Full adder
--! @version 1.1
--! @copyright (c) 2019-2024 Tomas Fryza, MIT license
--!
--! This VHDL module implements a full adder, which
--! utilizes two instances of the half adder component
--! to perform the addition operation.
--!
--! Developed using TerosHDL, Vivado 2020.2, and Playground.
--! Tested on Nexys A7-50T board and xc7a50ticsg324-1L FPGA.
-------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

-------------------------------------------------

entity full_adder_v2 is
  port (
    c_in  : in    std_logic; --! Input carry
    b     : in    std_logic; --! Input b
    a     : in    std_logic; --! Input a
    c_out : out   std_logic; --! Output carry
    sum   : out   std_logic  --! Output sum
  );
end entity full_adder_v2;

-------------------------------------------------

architecture behavioral of full_adder_v2 is
  -- Component declaration for half added
  component half_adder is
    port (
      b     : in    std_logic;
      a     : in    std_logic;
      carry : out   std_logic;
      sum   : out   std_logic
    );
  end component;

  -- Internal signals for intermediate carry and sum
  signal sig_c0   : std_logic;
  signal sig_c1   : std_logic;
  signal sig_sum0 : std_logic;
begin

  -- Component instantiations
  HA0 : component half_adder
    port map (
      b     => b,
      a     => a,
      carry => sig_c0,
      sum   => sig_sum0
    );

  HA1 : component half_adder
    port map (
      b     => c_in,
      a     => sig_sum0,
      carry => sig_c1,
      sum   => sum
    );

  -- Output carry
  c_out <= sig_c0 or sig_c1;

end architecture behavioral;
