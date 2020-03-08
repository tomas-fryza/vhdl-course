------------------------------------------------------------------------
--
-- Driver for seven-segment displays.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;    -- Provides unsigned numerical computation

------------------------------------------------------------------------
-- Entity declaration for display driver
------------------------------------------------------------------------
entity driver_7seg is
port (
    clk_i    : in  std_logic;
    srst_n_i : in  std_logic;   -- Synchronous reset (active low)
    data0_i  : in  std_logic_vector(4-1 downto 0);  -- Input values
    data1_i  : in  std_logic_vector(4-1 downto 0);
    data2_i  : in  std_logic_vector(4-1 downto 0);
    data3_i  : in  std_logic_vector(4-1 downto 0);
    dp_i     : in  std_logic_vector(4-1 downto 0);  -- Decimal points
    
    dp_o     : out std_logic;                       -- Decimal point
    seg_o    : out std_logic_vector(7-1 downto 0);
    dig_o    : out std_logic_vector(4-1 downto 0)
);
end entity driver_7seg;

------------------------------------------------------------------------
-- Architecture declaration for display driver
------------------------------------------------------------------------
architecture Behavioral of driver_7seg is
    -- WRITE YOUR CODE HERE
    signal s_en  : std_logic;
    signal s_cnt : std_logic_vector(2-1 downto 0) := "00";
    signal s_hex : std_logic_vector(4-1 downto 0);
begin

    --------------------------------------------------------------------
    -- Sub-block of clock_enable entity
    --- WRITE YOUR CODE HERE
    CLK_EN_0 : entity work.clock_enable
    generic map (
        g_NPERIOD => x"0028"        -- @ 4 ms if fclk = 10 kHz
    )
    port map (
        clk_i          => clk_i,
        srst_n_i       => srst_n_i,
        clock_enable_o => s_en
    );


    --------------------------------------------------------------------
    -- p_select_cnt:
    -- Sequential process with synchronous reset and clock enable,
    -- which implements an internal 2-bit counter for multiplexer 
    -- selection bits.
    --------------------------------------------------------------------
    p_select_cnt : process (clk_i)
    begin
        if rising_edge(clk_i) then  -- Rising clock edge
            if srst_n_i = '0' then  -- Synchronous reset (active low)
                -- WRITE YOUR CODE HERE
                s_cnt <= (others => '0');
            elsif s_en = '1' then
                -- WRITE YOUR CODE HERE
                s_cnt <= s_cnt + 1;
            end if;
        end if;
    end process p_select_cnt;

    --------------------------------------------------------------------
    -- p_mux:
    -- Combinational process which implements a 4-to-1 mux.
    --------------------------------------------------------------------
    p_mux : process (s_cnt, data0_i, data1_i, data2_i, data3_i, dp_i)
    begin
        case s_cnt is
        when "00" =>
            -- WRITE YOUR CODE HERE
            s_hex <= data0_i;
            dp_o  <= dp_i(0);
            dig_o <= "1110";
        when "01" =>
            -- WRITE YOUR CODE HERE
            s_hex <= data1_i;
            dp_o  <= dp_i(1);
            dig_o <= "1101";
        when "10" =>
            -- WRITE YOUR CODE HERE
            s_hex <= data2_i;
            dp_o  <= dp_i(2);
            dig_o <= "1011";
        when others =>
            -- WRITE YOUR CODE HERE
            s_hex <= data3_i;
            dp_o  <= dp_i(3);
            dig_o <= "0111";
        end case;
    end process p_mux;


    --------------------------------------------------------------------
    -- Sub-block of hex_to_7seg entity
    --- WRITE YOUR CODE HERE
    HEX_TO_SEG : entity work.hex_to_7seg
    port map (
        hex_i => s_hex,
        seg_o => seg_o
    );
--    --------------------------------------------------------------------
--    -- p_hex_to_seg:
--    -- Combinational process which implements a hex to seven-segment 
--    -- decoder.
--    --------------------------------------------------------------------
--    p_hex_to_seg : process (s_hex)
--    begin
--        case s_hex is
--        when "0000" =>
--            seg_o <= "0000001";     -- 0
--        when "0001" =>
--            seg_o <= "1001111";     -- 1
--        when "0010" =>
--            seg_o <= "0010010";     -- 2
--        when "0011" =>
--            seg_o <= "0000110";     -- 3
--        when "0100" =>
--            seg_o <= "1001100";     -- 4
--        when "0101" =>
--            seg_o <= "0100100";     -- 5
--        when "0110" =>
--            seg_o <= "0100000";     -- 6
--        when "0111" =>
--            seg_o <= "0001111";     -- 7
--        when "1000" =>
--            seg_o <= "0000000";     -- 8
--        when "1001" =>
--            seg_o <= "0001100";     -- 9
--
--        -- WRITE YOUR CODE HERE
--
--        when others =>
--            seg_o <= "0111000";     -- F
--        end case;
--    end process p_hex_to_seg;

end architecture Behavioral;
