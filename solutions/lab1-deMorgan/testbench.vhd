--------------------------------------------------
--
-- Testbench for basic gates circuit.
-- TerosHDL, EDA Playground, Vivado
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics
-- Brno Univ. of Technology, Czechia
--
-- MIT license
--
--------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

--------------------------------------------------
-- Entity declaration for testbench
--------------------------------------------------

entity tb_gates is
-- Entity of testbench is always empty
end entity tb_gates;

--------------------------------------------------
-- Architecture body for testbench
--------------------------------------------------

architecture testbench of tb_gates is

  component gates is
    port (
      a      : in    std_logic;
      b      : in    std_logic;
      c      : in    std_logic;
      f_orig : out   std_logic;
      f_nand : out   std_logic;
      f_nor  : out   std_logic
    );
  end component;

  -- Testbench local signals
  signal sig_c      : std_logic;
  signal sig_b      : std_logic;
  signal sig_a      : std_logic;
  signal sig_f_orig : std_logic;
  signal sig_f_nand : std_logic;
  signal sig_f_nor  : std_logic;

begin

  -- Connecting local testbench signals to `gates`
  -- component (Design Under Test)
  dut_gates : component gates

    port map (
      c      => sig_c,
      b      => sig_b,
      a      => sig_a,
      f_orig => sig_f_orig,
      f_nand => sig_f_nand,
      f_nor  => sig_f_nor
    );

  ------------------------------------------------
  -- Testing data generation process
  ------------------------------------------------

  p_stimulus : process is
  begin

    -- Set one test case and wait for 100 ns ...
    sig_c <= '0';
    sig_b <= '0';
    sig_a <= '0';
    wait for 100 ns;
    -- ... and then continue with other test cases
    sig_c <= '0';
    sig_b <= '0';
    sig_a <= '1';
    wait for 100 ns;
    sig_c <= '0';
    sig_b <= '1';
    sig_a <= '0';
    wait for 100 ns;
    sig_c <= '0';
    sig_b <= '1';
    sig_a <= '1';
    wait for 100 ns;
    sig_c <= '1';
    sig_b <= '0';
    sig_a <= '0';
    wait for 100 ns;
    sig_c <= '1';
    sig_b <= '0';
    sig_a <= '1';
    wait for 100 ns;
    sig_c <= '1';
    sig_b <= '1';
    sig_a <= '0';
    wait for 100 ns;
    sig_c <= '1';
    sig_b <= '1';
    sig_a <= '1';
    wait for 100 ns;

    wait; -- Generation process is suspended forever

  end process p_stimulus;

end architecture testbench;
