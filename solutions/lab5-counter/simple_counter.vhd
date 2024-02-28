-------------------------------------------------
--! @brief N-bit binary counter
--! @version 1.2
--! @copyright (c) 2019-2024 Tomas Fryza, MIT license
--!
--! Implementation of N-bit up counter. Number of bits is
--! set by `g_NBIT` generic and counting is enabled by
--! `en` input.
--!
--! Developed using TerosHDL, Vivado 2023.2, and Playground.
--! Tested on Nexys A7-50T board and xc7a50ticsg324-1L FPGA.
-------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

-------------------------------------------------

entity simple_counter is
  generic (
    g_NBIT : integer := 8 --! Default number of bits
  );
  port (
    clk   : in    std_logic;                            --! Main clock
    rst   : in    std_logic;                            --! Synchronous reset
    en    : in    std_logic;                            --! Enable input
    count : out   std_logic_vector(g_NBIT - 1 downto 0) --! Counter value
  );
end entity simple_counter;

-------------------------------------------------

architecture behavioral of simple_counter is
  --! Local counter
  signal sig_cnt : unsigned(g_NBIT - 1 downto 0);
begin

  --! Clocked process with synchronous reset which implements
  --! n-bit up counter.
  p_simple_counter : process (clk) is
  begin

    if (rising_edge(clk)) then
      if (rst = '1') then           -- Synchronous reset
        sig_cnt <= (others => '0'); -- Clear all bits
      elsif (en = '1') then         -- Test if counter is enabled
        sig_cnt <= sig_cnt + 1;
      end if;
    end if;

  end process p_simple_counter;

  -- Output must be retyped from "unsigned" to "std_logic_vector"
  count <= std_logic_vector(sig_cnt);

end architecture behavioral;
