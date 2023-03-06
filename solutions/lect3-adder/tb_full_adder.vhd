----------------------------------------------------------
--
-- Testbench for full adder.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- TerosHDL, Vivado v2020.2, EDA Playground
--
-- Copyright (c) 2019 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
----------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

----------------------------------------------------------
-- Entity declaration for testbench
----------------------------------------------------------

entity tb_full_adder is
-- Entity of testbench is always empty
end entity tb_full_adder;

----------------------------------------------------------
-- Architecture body for testbench
----------------------------------------------------------

architecture testbench of tb_full_adder is

  -- Local signals for full adder
  signal sig_a        : std_logic;
  signal sig_b        : std_logic;
  signal sig_carry_in : std_logic;
  signal sig_sum      : std_logic;
  signal sig_carry    : std_logic;

begin

  -- Connecting testbench signals with full_adder
  -- entity (Unit Under Test)
  uut_full : entity work.full_adder
    port map (
      a        => sig_a,
      b        => sig_b,
      carry_in => sig_carry_in,
      sum      => sig_sum,
      carry    => sig_carry
    );

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";

    sig_carry_in <= '0';
    sig_b        <= '0';
    sig_a        <= '0';
    wait for 100 ns;
    assert (
        (sig_carry = '0') and
        (sig_sum   = '0')
      )  -- Expected output
      report "Test failed for input combination 000"
      severity error;

    sig_carry_in <= '0';
    sig_b        <= '0';
    sig_a        <= '1';
    wait for 100 ns;
    assert (
        (sig_carry = '0') and
        (sig_sum   = '1')
      )
      report "Test failed for input combination 001"
      severity error;

    sig_carry_in <= '0';
    sig_b        <= '1';
    sig_a        <= '0';
    wait for 100 ns;
    assert (
        (sig_carry = '0') and
        (sig_sum   = '1')
      )
      report "Test failed for input combination 010"
      severity error;

    sig_carry_in <= '0';
    sig_b        <= '1';
    sig_a        <= '1';
    wait for 100 ns;
    assert (
        (sig_carry = '1') and
        (sig_sum   = '0')
      )
      report "Test failed for input combination 011"
      severity error;

    sig_carry_in <= '1';
    sig_b        <= '0';
    sig_a        <= '0';
    wait for 100 ns;
    assert (
        (sig_carry = '0') and
        (sig_sum   = '1')
      )
      report "Test failed for input combination 100"
      severity error;

    sig_carry_in <= '1';
    sig_b        <= '0';
    sig_a        <= '1';
    wait for 100 ns;
    assert (
        (sig_carry = '1') and
        (sig_sum   = '0')
      )
      report "Test failed for input combination 101"
      severity error;

    sig_carry_in <= '1';
    sig_b        <= '1';
    sig_a        <= '0';
    wait for 100 ns;
    assert (
        (sig_carry = '1') and
        (sig_sum   = '0'))
      report "Test failed for input combination 110"
      severity error;

    sig_carry_in <= '1';
    sig_b        <= '1';
    sig_a        <= '1';
    wait for 100 ns;
    assert (
        (sig_carry = '1') and
        (sig_sum   = '1')
      )
      report "Test failed for input combination 111"
      severity error;

    report "Stimulus process finished";
    wait;

  end process p_stimulus;

end architecture testbench;
