----------------------------------------------------------
--
--! @title D-type flip-flop
--! @author Tomas Fryza
--! Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
--!
--! @copyright (c) 2021 Tomas Fryza
--! This work is licensed under the terms of the MIT license
--!
--! D-type flip-flop with synchronous reset example.
--
-- Hardware: Nexys A7-50T, xc7a50ticsg324-1L
-- Software: TerosHDL, Vivado 2020.2, EDA Playground
--
----------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

----------------------------------------------------------
-- Entity declaration D type flip-flop with a sync reset
----------------------------------------------------------

entity d_ff_rst is
  port (
    clk   : in    std_logic; --! Main clock
    rst   : in    std_logic; --! High-active synchronous reset
    d     : in    std_logic; --! Data input
    q     : out   std_logic; --! Main output
    q_bar : out   std_logic  --! Complementary output
  );
end entity d_ff_rst;

----------------------------------------------------------
-- Architecture body for flip-flop
----------------------------------------------------------

architecture behavioral of d_ff_rst is

begin

  --------------------------------------------------------
  -- p_d_ff_rst:
  -- D type flip-flop with a high-active synchro reset and
  -- rising-edge clk.
  -- q(n+1) = d
  --------------------------------------------------------
  p_d_ff_rst : process (clk) is
  begin

    if rising_edge(clk) then      -- Synchronous process
      if (rst = '1') then         -- High-active reset
        q     <= '0';
        q_bar <= '1';
      else
        q     <= d;
        q_bar <= not d;
      end if;
    end if;

  end process p_d_ff_rst;

end architecture behavioral;
