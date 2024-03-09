-- Inspired by:
--   https://forum.digikey.com/t/debounce-logic-circuit-vhdl/12573

library ieee;
    use ieee.std_logic_1164.all;

-------------------------------------------------

entity debouncer is
    generic (
        DEB_PERIOD : integer := 5 --! Must be >= 4
    );
    port (
        clk     : in    std_logic; --! Main clock
        en      : in    std_logic; --! Clock enable input
        btn_in  : in    std_logic; --! Input signal to be debounced
        btn_out : out   std_logic  --! Debounced signal
    );
end entity debouncer;

-------------------------------------------------

architecture behavioral of debouncer is
    signal flipflops : std_logic_vector(1 downto 0);      --! Input flip flops
    signal sig_clear : std_logic;                         --! Reset local counter
    signal sig_count : integer range 0 to DEB_PERIOD - 1; --! Local counter
begin

    sig_clear <= flipflops(0) xor flipflops(1); -- Determine when to reset counter

    p_debounce : process (clk) is
    begin

        if (rising_edge(clk)) then
            -- Clock enable activated
            if (en = '1') then
                -- Shift input signal
                flipflops(0) <= btn_in;
                flipflops(1) <= flipflops(0);

                -- Reset the counter because input signal has changed
                if (sig_clear = '1') then
                    sig_count <= 0;

                -- Counter has not reached the end yet
                elsif (sig_count < DEB_PERIOD - 1) then
                    sig_count <= sig_count + 1;

                -- Counter reached the end, ie. Stable input
                else
                    btn_out <= flipflops(1);
                end if;
            end if;
        end if;

    end process p_debounce;

end architecture behavioral;
