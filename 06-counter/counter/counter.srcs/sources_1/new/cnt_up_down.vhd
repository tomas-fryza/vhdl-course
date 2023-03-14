----------------------------------------------------------
--
--! @title N-bit Up/Down binary counter
--! @author Tomas Fryza
--! Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
--!
--! @copyright (c) 2019 Tomas Fryza
--! This work is licensed under the terms of the MIT license
--!
--! Implementation of bidirectional N-bit counter. Number
--! of bits is set by `g_CNT_WIDTH` and counting direction
--! by `cnt_up` input.
--
-- Hardware: Nexys A7-50T, xc7a50ticsg324-1L
-- Software: TerosHDL, Vivado 2020.2, EDA Playground
--
----------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

----------------------------------------------------------
-- Entity declaration for N-bit counter
----------------------------------------------------------

entity cnt_up_down is
  generic (
    g_CNT_WIDTH : natural := 4 --! Default number of counter bits
  );
  port (
    clk    : in    std_logic; --! Main clock
    rst    : in    std_logic; --! Synchronous reset
    en     : in    std_logic; --! Enable input
    cnt_up : in    std_logic; --! Direction of the counter
    cnt    : out   std_logic_vector(g_CNT_WIDTH - 1 downto 0)
  );
end entity cnt_up_down;

----------------------------------------------------------
-- Architecture body for N-bit counter
----------------------------------------------------------

architecture behavioral of cnt_up_down is

  signal sig_cnt : unsigned(g_CNT_WIDTH - 1 downto 0); --! Local counter

begin

  --------------------------------------------------------
  -- p_cnt_up_down:
  -- Clocked process with synchronous reset which implements
  -- n-bit up/down counter.
  --------------------------------------------------------
  p_cnt_up_down : process (clk) is
  begin

    if rising_edge(clk) then
      if (rst = '1') then           -- Synchronous reset
        sig_cnt <= (others => '0'); -- Clear all bits
      elsif (en = '1') then         -- Test if counter is enabled

        -- TEST COUNTER DIRECTION HERE
        if (cnt_up = '1') then
          sig_cnt <= sig_cnt + 1;
        else
          sig_cnt <= sig_cnt - 1;
        end if;
      end if;
    end if;

  end process p_cnt_up_down;

  -- Output must be retyped from "unsigned" to "std_logic_vector"
  cnt <= std_logic_vector(sig_cnt);

end architecture behavioral;
