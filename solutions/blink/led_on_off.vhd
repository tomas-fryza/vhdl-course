-------------------------------------------------
--! @brief Blinking LED example.
--! @copyright (c) 2024 Tomas Fryza, MIT license
--!
--! VHDL example for a simple LED controller using
--! a clock signal and an asynchronous reset. It
--! implements a process for counting cycles and
--! toggling the LED state based on the internal
--! counter.
-------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

-------------------------------------------------

entity led_on_off is
  port (
    clk  : in    std_logic; --! Main clock signal
    arst : in    std_logic; --! Asynchronous reset
    led  : out   std_logic  --! LED pin
  );
end entity led_on_off;

-------------------------------------------------

architecture behavioral of led_on_off is

  --! Number of bits for internal counter
  constant c_nbit : natural := 4;
  --! Internal counter
  signal sig_internal_cnt : unsigned(c_nbit downto 0);

begin

  --! The process is responsible for counting cycles and
  --! resetting an internal counter (`sig_internal_cnt`)
  --! to zero on an asynchronous reset. On each rising
  --! edge of the clock, the counter is incremented.
  p_blink : process (arst, clk) is
  begin

    if (arst = '1') then
      sig_internal_cnt <= (others => '0');
    elsif (rising_edge(clk)) then
      sig_internal_cnt <= sig_internal_cnt + 1;
    end if;

  end process p_blink;

  led <= std_logic(sig_internal_cnt(c_nbit));

end architecture behavioral;
