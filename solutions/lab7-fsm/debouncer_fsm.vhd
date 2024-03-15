library ieee;
    use ieee.std_logic_1164.all;

entity debouncer_fsm is
    port (
        clk     : in    std_logic; -- Clock input
        rst     : in    std_logic;
        ce      : in    std_logic;
        bouncey : in    std_logic; -- Button input
        clear   : out   std_logic  -- Debounced button output
    );
end entity debouncer_fsm;

architecture behavioral of debouncer_fsm is
    -- Define states for the FSM
    type   state_type is (RELEASED, PRE_PRESSED, PRESSED, PRE_RELEASED);
    signal state : state_type;

    --- Define number of periods for debounce counter
    constant C_DEB_PERIODS : integer := 5;

    -- Define signals for debounce counter
    signal sig_count : integer range 0 to C_DEB_PERIODS;
begin

    --! FSM process
    p_fsm : process (clk) is
    begin

        if rising_edge(clk) then
            if (rst = '1') then
                state <= RELEASED;
            elsif (ce = '1') then

                case state is

                    when RELEASED =>
                        if (bouncey = '1') then
                            sig_count <= 0;
                            state     <= PRE_PRESSED;
                        end if;

                    when PRE_PRESSED =>
                        if (bouncey = '1') then
                            sig_count <= sig_count + 1;
                            if (sig_count >= C_DEB_PERIODS - 1) then
                                state <= PRESSED;
                            else
                                state <= PRE_PRESSED;
                            end if;
                        else
                            state <= RELEASED;
                        end if;

                    when PRESSED =>
                        if (bouncey = '0') then
                            sig_count <= 0;
                            state     <= PRE_RELEASED;
                        end if;

                    when PRE_RELEASED =>
                        if (bouncey = '0') then
                            sig_count <= sig_count + 1;
                            if (sig_count >= C_DEB_PERIODS - 1) then
                                state <= RELEASED;
                            else
                                state <= PRE_RELEASED;
                            end if;
                        else
                            sig_count <= 0;
                            state     <= PRESSED;
                        end if;

                    when others =>
                        null;

                end case;

            end if;
        end if;

    end process p_fsm;

    -- Output debounced button value
    clear <= '1' when state = PRESSED or state = PRE_RELEASED else
             '0';

end architecture behavioral;
