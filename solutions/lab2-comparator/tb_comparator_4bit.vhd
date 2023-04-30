--! @title Testbench for 4-bit binary comparator
--! @author Tomas Fryza
--! Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
--! @version 0.2
--! @date 2023-04-30
--!
--! @copyright Copyright (c) 2020 by Tomas Fryza
--! This work is licensed under the terms of the MIT license.
--!

library ieee;
  use ieee.std_logic_1164.all;

----------------------------------------------------------
-- Entity declaration for testbench
----------------------------------------------------------

entity tb_comparator_4bit is
  -- Entity of testbench is always empty
end entity tb_comparator_4bit;

----------------------------------------------------------
-- Architecture body for testbench
----------------------------------------------------------

architecture testbench of tb_comparator_4bit is

  -- Testbench local signals
  signal sig_b         : std_logic_vector(3 downto 0); --! Input data b[3:0]
  signal sig_a         : std_logic_vector(3 downto 0); --! Input data a[3:0]
  signal sig_b_greater : std_logic;                    --! Output is `1` if b > a
  signal sig_b_a_equal : std_logic;                    --! Output is `1` if b = a
  signal sig_a_greater : std_logic;                    --! Output is `1` if b < a

begin

  --------------------------------------------------------
  --! Connecte testbench signals declared above to
  --! comparator_4bit entity as Unit Under Test
  uut_comparator_4bit : entity work.comparator_4bit
    port map (
      b         => sig_b,
      a         => sig_a,
      b_greater => sig_b_greater,
      b_a_equal => sig_b_a_equal,
      a_greater => sig_a_greater
    );

  --------------------------------------------------------
  --! Input data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    -- Report a note at the beginning of stimulus process
    report "Stimulus process started";

    -- First test case ...
    sig_b <= "0000";
    sig_a <= "0000";
    wait for 100 ns;
    -- ... and its expected outputs
    assert (
        (sig_b_greater = '0') and
        (sig_b_a_equal = '1') and
        (sig_a_greater = '0')
      )
      -- If false, then report an error
      -- If true, then do not report anything
      report "Input combination b=0, a=0 FAILED"
      severity error;

    ------------------------------
    -- WRITE OTHER TEST CASES AND ASSERTS HERE
    sig_b <= "0001";
    sig_a <= "0001";
    wait for 100 ns;
    assert (
        (sig_b_greater = '0') and
        (sig_b_a_equal = '1') and
        (sig_a_greater = '0')
      )
      report "Input combination b=1, a=1 FAILED"
      severity error;

    ------------------------------
    sig_b <= "0011";
    sig_a <= "1100";
    wait for 100 ns;
    assert (
        (sig_b_greater = '0') and
        (sig_b_a_equal = '0') and
        (sig_a_greater = '1')
      )
      report "Input combination b=3, a=12 FAILED"
      severity error;

    ------------------------------
    sig_b <= "1000";
    sig_a <= "1001";
    wait for 100 ns;
    assert (
        (sig_b_greater = '0') and
        (sig_b_a_equal = '0') and
        (sig_a_greater = '1')
      )
      report "Input combination b=8, a=9 FAILED"
      severity error;

    ------------------------------
    sig_b <= "1001";
    sig_a <= "1000";
    wait for 100 ns;
    assert (
        (sig_b_greater = '1') and
        (sig_b_a_equal = '0') and
        (sig_a_greater = '0')
      )
      report "Input combination b=9, a=8 FAILED"
      severity error;

    -- Report a note at the end of stimulus process
    report "Stimulus process finished";
    wait; -- Data generation process is suspended forever

  end process p_stimulus;

end architecture testbench;
