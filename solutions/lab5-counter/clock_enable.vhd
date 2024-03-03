-------------------------------------------------
--! @brief Clock enable
--! @version 1.3
--! @copyright (c) 2019-2024 Tomas Fryza, MIT license
--!
--! Generates clock enable signal according to the number
--! of clock pulses `PERIOD`.
--!
--! Developed using TerosHDL, Vivado 2020.2, and Playground.
--! Tested on Nexys A7-50T board and xc7a50ticsg324-1L FPGA.
-------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all; -- Package for arithmetic operations with std_logic_vector
    use ieee.math_real.all; -- To calculate the number of bits needed to represent a number

-------------------------------------------------

entity clock_enable is
    generic (
        PERIOD : integer := 6 --! Default number of clk periodes to generate one pulse
    );
    port (
        clk   : in    std_logic; --! Main clock
        rst   : in    std_logic; --! High-active synchronous reset
        pulse : out   std_logic  --! Clock enable pulse signal
    );
end entity clock_enable;

-------------------------------------------------

architecture behavioral of clock_enable is
    --! Get number for needed bits for PERIOD value
    constant bits_needed : integer := integer(ceil(log2(real(PERIOD + 1))));
    --! Local counter with needed number of bits
    signal sig_count : std_logic_vector(bits_needed - 1 downto 0);
begin

    --! Generate clock enable signal. By default, enable signal
    --! is low and generated pulse is always one clock long.
    p_clk_enable : process (clk) is
    begin

        if (rising_edge(clk)) then                 -- Synchronous process
            if (rst = '1') then                    -- High-active reset
                sig_count <= (others => '0');      -- Clear all bits
                pulse     <= '0';                  -- Set output to low

            -- Test number of clock periods
            elsif (sig_count = (PERIOD - 1)) then
                sig_count <= (others => '0');      -- Clear all bits
                pulse     <= '1';                  -- Generate clock enable pulse
            else
                sig_count <= sig_count + 1;        -- Increment local counter
                pulse     <= '0';
            end if;                                -- Each `if` must end by `end if`
        end if;

    end process p_clk_enable;

end architecture behavioral;
