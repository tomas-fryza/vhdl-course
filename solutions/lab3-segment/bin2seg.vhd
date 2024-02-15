-------------------------------------------------
--! @brief One-digit 7-segment display decoder
--! @version 1.3
--! @copyright (c) 2018 Tomas Fryza, MIT license
--!
--! This VHDL file represents a binary-to-seven-
--! segment decoder for a one-digit display with
--! Common Anode configuration (active-low). The
--! decoder defines 16 hexadecimal symbols: `0, 1,
--! ..., 9, A, b, C, d, E, F`. All segments are
--! turned off when `clear` signal is high.
--! Note: Decimal Point functionality is not
--! implemented.
--!
--! Developed using TerosHDL, Vivado 2020.2, and
--! EDA Playground. Tested on the Nexys A7-50T
--! board featuring the xc7a50ticsg324-1L FPGA.
-------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

-------------------------------------------------

entity bin2seg is
  port (
    clear : in    std_logic;                    --! Clear the display
    bin   : in    std_logic_vector(3 downto 0); --! Binary representation of one hexadecimal symbol
    seg   : out   std_logic_vector(6 downto 0)  --! Seven active-low segments from A to G
  );
end entity bin2seg;

-------------------------------------------------

architecture behavioral of bin2seg is
begin

  --! This combinational process decodes binary
  --! input (`bin`) into 7-segment display output
  --! (`seg`) for a Common Anode configuration.
  --! When either `bin` or `clear` changes, the
  --! process is triggered. Each bit in `seg`
  --! represents a segment from A to G. The display
  --! is cleared if input `clear` is set to 1.
  p_7seg_decoder : process (bin, clear) is
  begin

    if (clear = '1') then
      seg <= "1111111";     -- Clear the display
    else

      case bin is

        when "0000" =>
          seg <= "0000001"; -- 0

        when "0001" =>
          seg <= "1001111"; -- 1

        -- WRITE YOUR CODE HERE
        -- 2, 3, 4, 5, 6

        when "0010" =>
          seg <= "0010010"; -- 2

        when "0011" =>
          seg <= "0000110"; -- 3

        when "0100" =>
          seg <= "1001100"; -- 4

        when "0101" =>
          seg <= "0100100"; -- 5

        when "0110" =>
          seg <= "0100000"; -- 6

        when "0111" =>
          seg <= "0001111"; -- 7

        when "1000" =>
          seg <= "0000000"; -- 8

        -- WRITE YOUR CODE HERE
        -- 9, A, b, C, d

        when "1001" =>
          seg <= "0000100"; -- 9

        when "1010" =>
          seg <= "0001000"; -- A (10)

        when "1011" =>
          seg <= "1100000"; -- b (11)

        when "1100" =>
          seg <= "0110001"; -- C (12)

        when "1101" =>
          seg <= "1000010"; -- d (13)

        when "1110" =>
          seg <= "0110000"; -- E

        when others =>
          seg <= "0111000"; -- F

      end case;

    end if;

  end process p_7seg_decoder;

end architecture behavioral;
