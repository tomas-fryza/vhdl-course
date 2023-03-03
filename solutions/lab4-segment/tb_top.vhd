------------------------------------------------------------
--
-- Testbench for Top level of one-digit 7-segment display
-- decoder7-segment display decoder.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- TerosHDL, Vivado v2020.2, EDA Playground
--
-- Copyright (c) 2023 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all; -- Definition of "to_unsigned"

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------

entity tb_top is
  -- Entity of testbench is always empty
end entity tb_top;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------

architecture testbench of tb_top is

  -- Testbench local signals
  signal sig_sw   : std_logic_vector(3 downto 0) := (others => '0');
  signal sig_led  : std_logic_vector(7 downto 0) := (others => '0');
  signal sig_ca   : std_logic := '0';
  signal sig_cb   : std_logic := '0';
  signal sig_cc   : std_logic := '0';
  signal sig_cd   : std_logic := '0';
  signal sig_ce   : std_logic := '0';
  signal sig_cf   : std_logic := '0';
  signal sig_cg   : std_logic := '0';
  signal sig_an   : std_logic_vector(7 downto 0):= (others => '0');
  signal sig_btnc : std_logic := '0';

begin

  -- Connecting testbench signals with top entity
  -- (Unit Under Test)
  uut_top : entity work.top
    port map (
      SW   => sig_sw,
      LED  => sig_led,
      CA   => sig_ca,
      CB   => sig_cb,
      CC   => sig_cc,
      CD   => sig_cd,
      CE   => sig_ce,
      CF   => sig_cf,
      CG   => sig_cg,
      AN   => sig_an,
      BTNC => sig_btnc
    );

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";

    sig_btnc <= '0';    -- Normal operation
    wait for 25 ns;

    -- Loop for all switch values
    for ii in 0 to 15 loop
      sig_sw <= std_logic_vector(to_unsigned(ii, 4));
      wait for 50 ns;
    end loop;

    report "Stimulus process finished";
    wait;

  end process p_stimulus;

end architecture testbench;
