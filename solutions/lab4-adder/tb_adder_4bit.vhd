-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 20.2.2024 10:25:25 UTC

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all; -- Definition of "to_unsigned"

entity tb_adder_4bit is
end entity tb_adder_4bit;

architecture tb of tb_adder_4bit is

  component adder_4bit is
    port (
      b      : in    std_logic_vector(3 downto 0);
      a      : in    std_logic_vector(3 downto 0);
      c_in   : in    std_logic;
      result : out   std_logic_vector(3 downto 0);
      c_out  : out   std_logic
    );
  end component;

  signal b      : std_logic_vector(3 downto 0);
  signal a      : std_logic_vector(3 downto 0);
  signal c_in   : std_logic;
  signal result : std_logic_vector(3 downto 0);
  signal c_out  : std_logic;

begin

  dut : component adder_4bit
    port map (
      b      => b,
      a      => a,
      c_in   => c_in,
      result => result,
      c_out  => c_out
    );

  stimuli : process is
  begin

    report "Stimulus process started";

    -- EDIT Adapt initialization as needed
    b    <= "0000";
    c_in <= '0';
    -- Loop for all hex values
    for i in 0 to 15 loop

      -- Convert decimal value `i` to 4-bit wide binary
      a <= std_logic_vector(to_unsigned(i, a'length));
      wait for 50 ns;

    end loop;

    b    <= "0110";
    c_in <= '0';
    -- Loop for all hex values
    for i in 0 to 15 loop

      -- Convert decimal value `i` to 4-bit wide binary
      a <= std_logic_vector(to_unsigned(i, a'length));
      wait for 50 ns;

    end loop;

    b    <= "0011";
    c_in <= '1';
    -- Loop for all hex values
    for i in 0 to 15 loop

      -- Convert decimal value `i` to 4-bit wide binary
      a <= std_logic_vector(to_unsigned(i, a'length));
      wait for 50 ns;

    end loop;

    report "Stimulus process finished";
    wait;

  end process stimuli;

end architecture tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_adder_4bit of tb_adder_4bit is
    for tb
    end for;
end cfg_tb_adder_4bit;
