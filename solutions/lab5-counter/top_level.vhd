----------------------------------------------------------
--
--! @title Top level of bidirectional counter(s)
--! @author Tomas Fryza
--! Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
--!
--! @copyright (c) 2019 Tomas Fryza
--! This work is licensed under the terms of the MIT license
--
-- Hardware: Nexys A7-50T, xc7a50ticsg324-1L
-- Software: TerosHDL, Vivado 2020.2, EDA Playground
--
----------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

----------------------------------------------------------
-- Entity declaration for top-level design
----------------------------------------------------------

entity top is
  port (
    CLK100MHZ : in    std_logic;                     --! Main clock
    SW        : in    std_logic_vector(1 downto 0);  --! Counter(s) direction
    LED       : out   std_logic_vector(11 downto 0); --! Counter1 value
    CA        : out   std_logic;                     --! Cathod A
    CB        : out   std_logic;                     --! Cathod B
    CC        : out   std_logic;                     --! Cathod C
    CD        : out   std_logic;                     --! Cathod D
    CE        : out   std_logic;                     --! Cathod E
    CF        : out   std_logic;                     --! Cathod F
    CG        : out   std_logic;                     --! Cathod G
    AN        : out   std_logic_vector(7 downto 0);  --! Common anode signals to individual displays
    BTNC      : in    std_logic                      --! Synchronous reset
  );
end entity top;

----------------------------------------------------------
-- Architecture body for top level
----------------------------------------------------------

architecture behavioral of top is

  -- First counter: 4-bit @ 250 ms
  signal sig_en_250ms : std_logic;                    --! Clock enable signal for Counter0
  signal sig_cnt_4bit : std_logic_vector(3 downto 0); --! Counter0

  -- Second counter: n-bit @ 10 ms
  signal sig_en_10ms : std_logic;                     --! Clock enable signal for Counter1

begin

  --------------------------------------------------------
  -- Instances (copies) of clock_enable entity
  --------------------------------------------------------
  clk_en0 : entity work.clock_enable
    generic map (
      g_MAX => 25000000
    )
    port map (
      clk => CLK100MHZ,
      rst => BTNC,
      ce  => sig_en_250ms
    );

  clk_en1 : entity work.clock_enable
    generic map (
      g_MAX => 1000000
    )
    port map (
      clk => CLK100MHZ,
      rst => BTNC,
      ce  => sig_en_10ms
    );

  --------------------------------------------------------
  -- Instances (copies) of cnt_up_down entity
  --------------------------------------------------------
  bin_cnt0 : entity work.cnt_up_down
    generic map (
      g_CNT_WIDTH => 4
    )
    port map (
      clk    => CLK100MHZ,
      rst    => BTNC,
      en     => sig_en_250ms,
      cnt_up => SW(0),
      cnt    => sig_cnt_4bit
    );

  bin_cnt1 : entity work.cnt_up_down
    generic map (
      g_CNT_WIDTH => 12
    )
    port map (
      clk    => CLK100MHZ,
      rst    => BTNC,
      en     => sig_en_10ms,
      cnt_up => SW(1),
      cnt    => LED
    );

  --------------------------------------------------------
  -- Instance (copy) of hex_7seg entity
  --------------------------------------------------------
  hex2seg : entity work.hex_7seg
    port map (
      blank  => BTNC,
      hex    => sig_cnt_4bit,
      seg(6) => CA,
      seg(5) => CB,
      seg(4) => CC,
      seg(3) => CD,
      seg(2) => CE,
      seg(1) => CF,
      seg(0) => CG
    );

  --------------------------------------------------------
  -- Other settings
  --------------------------------------------------------
  -- Connect one common anode to 3.3V
  AN <= b"1111_1110";

end architecture behavioral;
