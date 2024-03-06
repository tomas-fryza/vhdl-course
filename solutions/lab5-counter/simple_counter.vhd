-------------------------------------------------
--! @brief N-bit binary counter
--! @version 1.2
--! @copyright (c) 2019-2024 Tomas Fryza, MIT license
--!
--! Implementation of N-bit up counter. Number of bits is
--! set by `N` generic and counting is enabled by `en` input.
--!
--! Developed using TerosHDL, Vivado 2023.2, and EDA Playground.
--! Tested on Nexys A7-50T board and xc7a50ticsg324-1L FPGA.
-------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    -- The STD_LOGIC_VECTOR data type can be used in addition
    -- and subtraction operations (+ and -) if the STD_LOGIC_SIGNED
    -- or the STD_LOGIC_UNSIGNED package of the IEEE library is used.
    use IEEE.std_logic_unsigned.all;

-------------------------------------------------

entity simple_counter is
    generic (
        N : integer := 4 --! Default number of bits
    );
    port (
        clk   : in    std_logic;                       --! Main clock
        rst   : in    std_logic;                       --! High-active synchronous reset
        en    : in    std_logic;                       --! Clock enable input
        count : out   std_logic_vector(N - 1 downto 0) --! Counter value
    );
end entity simple_counter;

-------------------------------------------------

architecture behavioral of simple_counter is
    --! Local counter
    signal sig_count : std_logic_vector(N - 1 downto 0);
begin

    --! Clocked process with synchronous reset which implements
    --! n-bit up counter.
    p_simple_counter : process (clk) is
    begin

        if (rising_edge(clk)) then
            if (rst = '1') then               -- Synchronous reset
                sig_count <= (others => '0'); -- Clear all bits
            elsif (en = '1') then             -- Test if counter is enabled
                sig_count <= sig_count + 1;
            end if;
        end if;

    end process p_simple_counter;

    -- Connect output to local counter
    count <= sig_count;

end architecture behavioral;
