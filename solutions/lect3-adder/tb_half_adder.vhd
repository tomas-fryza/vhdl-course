--! @title Testbench for half adder
--! @author Tomas Fryza
--! Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
--! @version 0.2
--! @date 2023-04-30
--!
--! @copyright Copyright (c) 2019 by Tomas Fryza
--! This work is licensed under the terms of the MIT license.
--!

library ieee;
  use ieee.std_logic_1164.all;

----------------------------------------------------------
-- Entity declaration for testbench
----------------------------------------------------------

entity tb_half_adder is
  -- Entity of testbench is always empty
end entity tb_half_adder;

----------------------------------------------------------
-- Architecture body for testbench
----------------------------------------------------------

architecture testbench of tb_half_adder is

  --! Local signals for half adder !!! DOES NOT WORK IN DOC !!!
  signal sig_a     : std_logic;
  signal sig_b     : std_logic; --! B input
  signal sig_sum   : std_logic; --! LSB of result
  signal sig_carry : std_logic; --! Output carry !!! DOES NOT WORK IN DOC !!!

begin

  --------------------------------------------------------
  --! Connect testbench signals declared above to
  --! half_adder entity as Unit Under Test
  uut_half : entity work.half_adder
    port map (
      a     => sig_a,
      b     => sig_b,
      sum   => sig_sum,
      carry => sig_carry
    );

  --------------------------------------------------------
  --! Input data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";

    sig_b <= '0';
    sig_a <= '0';
    wait for 100 ns;
    assert (
        (sig_carry = '0') and
        (sig_sum   = '0')
      )  -- Expected output
      report "Test failed for input combination 00"
      severity error;

    sig_b <= '0';
    sig_a <= '1';
    wait for 100 ns;
    assert (
        (sig_carry = '0') and
        (sig_sum   = '1')
      )
      report "Test failed for input combination 01"
      severity error;

    sig_b <= '1';
    sig_a <= '0';
    wait for 100 ns;
    assert (
        (sig_carry = '0') and
        (sig_sum   = '1')
      )
      report "Test failed for input combination 10"
      severity error;

    sig_b <= '1';
    sig_a <= '1';
    wait for 100 ns;
    assert (
        (sig_carry = '1') and
        (sig_sum   = '0')
      )
      report "Test failed for input combination 11"
      severity error;

    report "Stimulus process finished";
    wait;

  end process p_stimulus;

end architecture testbench;
