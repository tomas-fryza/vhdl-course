library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all; -- Definition of "to_unsigned"

-------------------------------------------------

entity tb_bin2seg is
-- Entity of testbench is always empty
end entity tb_bin2seg;

-------------------------------------------------

architecture testbench of tb_bin2seg is
  component bin2seg is
    port (
      clear : in    std_logic;
      bin   : in    std_logic_vector(3 downto 0);
      seg   : out   std_logic_vector(6 downto 0)
    );
  end component;

  -- Testbench local signals
  signal sig_clear : std_logic;
  signal sig_bin   : std_logic_vector(3 downto 0);
  signal sig_seg   : std_logic_vector(6 downto 0);
begin

  dut : component bin2seg
    port map (
      clear => sig_clear,
      bin   => sig_bin,
      seg   => sig_seg
    );

  -----------------------------------------------
  -- Data generation process
  -----------------------------------------------
  p_stimulus : process is
  begin

    report "Stimulus process started";

    -- Normal operation
    sig_clear <= '0';
    sig_bin   <= "0011";
    wait for 50 ns;

    -- Clear display
    sig_clear <= '1';
    wait for 115 ns;
    sig_clear <= '0';
    wait for 25 ns;

    -- Loop for all hex values
    for i in 0 to 15 loop

      -- Convert decimal value `i` to 4-bit wide binary
      sig_bin <= std_logic_vector(to_unsigned(i, 4));
      -- sig_bin <= std_logic_vector(to_unsigned(i, sig_bin'length));
      wait for 50 ns;

      -- Expected segment values
      case sig_bin is

        when "0000" =>
          assert sig_seg = "0000001"
            report "Error: Segments do not match expected value for BCD input 0"
            severity error;

        when "0001" =>
          assert sig_seg = "1001111"
            report "Error: Segments do not match expected value for BCD input 1"
            severity error;

        when "0010" =>
          assert sig_seg = "0010010"
            report "Error: Segments do not match expected value for BCD input 2"
            severity error;

        when "0011" =>
          assert sig_seg = "0000110"
            report "Error: Segments do not match expected value for BCD input 3"
            severity error;

        when "0100" =>
          assert sig_seg = "1001100"
            report "Error: Segments do not match expected value for BCD input 4"
            severity error;

        when "0101" =>
          assert sig_seg = "0100100"
            report "Error: Segments do not match expected value for BCD input 5"
            severity error;

        when "0110" =>
          assert sig_seg = "0100000"
            report "Error: Segments do not match expected value for BCD input 6"
            severity error;

        when "0111" =>
          assert sig_seg = "0001111"
            report "Error: Segments do not match expected value for BCD input 7"
            severity error;

        when "1000" =>
          assert sig_seg = "0000000"
            report "Error: Segments do not match expected value for BCD input 8"
            severity error;

        when "1001" =>
          assert sig_seg = "0000100"
            report "Error: Segments do not match expected value for BCD input 9"
            severity error;

        when others =>
          null;  -- No assertion for other input combinations

      end case;

    end loop;

    report "Stimulus process finished";
    wait;

  end process p_stimulus;

end architecture testbench;
