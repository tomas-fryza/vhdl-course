-------------------------------------------------
--
-- Testbench for LED blink.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- TerosHDL, Vivado v2020.2, EDA Playground
--
-- Copyright (c) 2024 Tomas Fryza
-- Dept. of Radio Electronics
-- Brno Univ. of Technology, Czechia
---
-- MIT license.
--
-------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

-------------------------------------------------
-- Entity declaration for testbench
-------------------------------------------------

entity tb_led_on_off is
-- Entity of testbench is always empty
end entity tb_led_on_off;

-------------------------------------------------
-- Architecture body for testbench
-------------------------------------------------

architecture testbench of tb_led_on_off is

  component led_on_off is
    port (
      clk  : in    std_logic;
      arst : in    std_logic;
      led  : out   std_logic
    );
  end component;

  constant c_clk_100mhz_period : time := 10 ns;

  -- Local signals
  signal sig_clk_100mhz : std_logic;
  signal sig_arst       : std_logic;
  signal sig_led        : std_logic;

begin

  dut : component led_on_off
    port map (
      clk  => sig_clk_100mhz,
      arst => sig_arst,
      led  => sig_led
    );

  -----------------------------------------------
  -- Clock generation process
  -----------------------------------------------
  p_clk_gen : process is
  begin

    -- 75 periods of 100MHz clock
    while now < 750 ns loop

      sig_clk_100mhz <= '0';
      wait for c_clk_100mhz_period / 2;
      sig_clk_100mhz <= '1';
      wait for c_clk_100mhz_period / 2;

    end loop;

    -- Process is suspended forever
    wait;

  end process p_clk_gen;

  -----------------------------------------------
  -- Reset generation process
  -----------------------------------------------
  p_reset_gen : process is
  begin

    sig_arst <= '0';
    wait for 13 ns;

    -- Reset activated
    sig_arst <= '1';
    wait for 20 ns;

    -- Reset deactivated
    sig_arst <= '0';

    wait;

  end process p_reset_gen;

  -----------------------------------------------
  -- Input data generation process
  -----------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";
    -- No other input data is needed
    report "Stimulus process finished";

    wait;

  end process p_stimulus;

end architecture testbench;
