-------------------------------------------------
--! @brief Clock enable
--! @version 1.2
--! @copyright (c) 2019-2024 Tomas Fryza, MIT license
--!
--! Generates clock enable signal according to the number
--! of clock pulses `g_PERIOD`.
--!
--! Developed using TerosHDL, Vivado 2020.2, and Playground.
--! Tested on Nexys A7-50T board and xc7a50ticsg324-1L FPGA.
-------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all; -- Package for arithmetic operations

-------------------------------------------------

entity clock_enable is
  generic (
    g_PERIOD : integer := 5 --! Number of clk periodes to generate one pulse
  );                        -- Note that THERE IS a semicolon between generic
                            -- and port sections
  port (
    clk   : in    std_logic; --! Main clock
    rst   : in    std_logic; --! High-active synchronous reset
    pulse : out   std_logic  --! Clock enable pulse signal
  );
end entity clock_enable;

-------------------------------------------------

architecture behavioral of clock_enable is
  --! Local counter
  signal sig_cnt : integer;
begin

  --! Generate clock enable signal. By default, enable signal
  --! is low and generated pulse is always one clock long.
  p_clk_enable : process (clk) is
  begin

    if (rising_edge(clk)) then               -- Synchronous process
      if (rst = '1') then                    -- High-active reset
        sig_cnt <= 0;                        -- Clear local counter
        pulse   <= '0';                      -- Set output to low

      -- Test number of clock periods
      elsif (sig_cnt >= (g_PERIOD - 1)) then
        sig_cnt <= 0;                        -- Clear local counter
        pulse   <= '1';                      -- Generate clock enable pulse
      else
        sig_cnt <= sig_cnt + 1;              -- Increment local counter
        pulse   <= '0';
      end if;                                -- Each `if` must end by `end if`
    end if;

  end process p_clk_enable;

end architecture behavioral;
