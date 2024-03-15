library ieee;
    use ieee.std_logic_1164.all;

-- Entity declaration

entity ButtonDebouncer is
    Port (
        clk       : in    STD_LOGIC; -- Clock signal
        btn       : in    STD_LOGIC; -- Button input
        debounced : out   STD_LOGIC  -- Debounced button output
    );
end entity ButtonDebouncer;

-- Architecture definition

architecture Behavioral of ButtonDebouncer is
    -- Constants
    constant DEBOUNCE_COUNT : integer := 10; -- Debounce counter value (adjust based on clock frequency)

    -- Signals
    type   State_t is (IDLE, st_wait);
    signal current_state : State_t; -- Current state of the FSM
    signal counter       : integer range 0 to DEBOUNCE_COUNT;    -- Debounce counter
begin

    -- Debounce process (sequential logic)
    process (clk) is
    begin

        if rising_edge(clk) then                         -- Triggered on positive clock edge

            case current_state is

                when IDLE =>
                    if (btn /= debounced) then           -- Button state changed
                        current_state <= st_wait;
                        counter       <= 0;
                    end if;

                when st_wait =>
                    if (counter >= DEBOUNCE_COUNT) then  -- Debounce counter reached
                        current_state <= IDLE;
                        debounced     <= btn;            -- Update debounced output
                    else
                        counter <= counter + 1;
                    end if;

            end case;

        end if;

    end process;

end architecture Behavioral;

