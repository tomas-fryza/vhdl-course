------------------------------------------------------------
--
-- Template for 7-segment display decoder.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- Vivado v2018.3, EDA Playground, TerosHDL
--
-- Copyright (c) 2018-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for seven7-segment display decoder
------------------------------------------------------------
entity hex_7seg is
    port (
        blank_i : in  std_logic;
        hex_i   : in  std_logic_vector(3 downto 0);
        seg_o   : out std_logic_vector(6 downto 0)
    );
end entity hex_7seg;

------------------------------------------------------------
-- Architecture body for seven-segment display decoder
------------------------------------------------------------
architecture Behavioral of hex_7seg is
begin
    --------------------------------------------------------
    -- p_7seg_decoder:
    -- A combinational process for 7-segment display (Common
    -- Anode) decoder. Any time "hex_i" is changed, the process
    -- is "executed". Output pin seg_o(6) controls segment A,
    -- seg_o(5) segment B, etc.
    --       segment A
    --        | segment B
    --        |  | segment C
    --        +-+|  |   ...   segment G
    --          ||+-+          |
    --          |||            |
    -- seg_o = "0000001"-------+
    --
    -- Display is clear/blank if blank_i = 1.
    --------------------------------------------------------
    p_7seg_decoder : process (hex_i, blank_i)
    begin
        if (blank_i = '1') then
            seg_o <= "1111111"; -- Blanking display
        else
            case hex_i is
                when "0000" =>
                    seg_o <= "0000001"; -- 0
                when "0001" =>
                    seg_o <= "1001111"; -- 1

                    -- WRITE YOUR CODE HERE
                    -- 2, 3, 4, 5, 6, 7
                when "0010" =>
                    seg_o <= "0010010"; -- 2
                when "0011" =>
                    seg_o <= "0000110"; -- 3
                when "0100" =>
                    seg_o <= "1001100"; -- 4
                when "0101" =>
                    seg_o <= "0100100"; -- 5
                when "0110" =>
                    seg_o <= "0100000"; -- 6
                when "0111" =>
                    seg_o <= "0001111"; -- 7
                when "1000" =>
                    seg_o <= "0000000"; -- 8

                    -- WRITE YOUR CODE HERE
                    -- 9, A, b, C, d
                when "1001" =>
                    seg_o <= "0000100"; -- 9
                when "1010" =>
                    seg_o <= "0001000"; -- A (10)
                when "1011" =>
                    seg_o <= "1100000"; -- b (11)
                when "1100" =>
                    seg_o <= "0110001"; -- C (12)
                when "1101" =>
                    seg_o <= "1000010"; -- d (13)

                when "1110" =>
                    seg_o <= "0110000"; -- E
                when others =>
                    seg_o <= "0111000"; -- F
            end case;
        end if;
    end process p_7seg_decoder;

end architecture Behavioral;