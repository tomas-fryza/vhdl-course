library ieee;
    use ieee.std_logic_1164.all;

entity debouncer is
    generic (
        CLK_PERIOD : integer := 3;
        DEB_PERIOD : integer := 5
    );
    port (
        clk     : in    std_logic;
        rst     : in    std_logic;
        btn_in  : in    std_logic;
        btn_out : out   std_logic
    );
end entity debouncer;

architecture behavioral of debouncer is
    type   state_type is (st1_idle, st2_wait, st3_active, st4_wait);
    signal debouncer_state : state_type;

    signal sig_count_clk : integer range 0 to CLK_PERIOD;
    signal sig_count_deb : integer range 0 to DEB_PERIOD;
    signal sig_ce        : std_logic;
begin

    p_debouncer : process (clk) is
    begin

        if rising_edge(clk) then
            if (rst = '1') then
                debouncer_state <= st1_idle;
            elsif (sig_ce = '1') then

                case (debouncer_state) is

                    when st1_idle =>
                        if (btn_in = '1') then
                            debouncer_state <= st2_wait;
                        else
                            debouncer_state <= st1_idle;
                        end if;
                        btn_out <= '0';

                    when st2_wait =>
                        if (sig_count_deb = DEB_PERIOD) then
                            sig_count_deb <= 0;
                            if (btn_in = '1') then
                                debouncer_state <= st3_active;
                            else
                                debouncer_state <= st1_idle;
                            end if;
                        else
                            sig_count_deb   <= sig_count_deb + 1;
                            debouncer_state <= st2_wait;
                        end if;

                    when st3_active =>
                        if (btn_in = '0') then
                            debouncer_state <= st4_wait;
                        else
                            debouncer_state <= st3_active;
                        end if;
                        btn_out <= '1';

                    when st4_wait =>
                        if (sig_count_deb = DEB_PERIOD) then
                            sig_count_deb <= 0;
                            if (btn_in = '0') then
                                debouncer_state <= st1_idle;
                            else
                                debouncer_state <= st4_wait;
                            end if;
                        else
                            sig_count_deb <= sig_count_deb + 1;
                        end if;

                    when others =>
                        debouncer_state <= st1_idle;

                end case;

            end if;
        end if;

    end process p_debouncer;

    --! Count the number of clock pulses from zero to PERIOD-1.
    p_clk_enable : process (clk) is
    begin

        if (rising_edge(clk)) then
            if (rst = '1') then
                sig_count_clk <= 0;
                sig_ce        <= '0';

            -- Counting
            elsif (sig_count_clk < (CLK_PERIOD - 1)) then
                sig_count_clk <= sig_count_clk + 1;

            -- End of counter reached
            else
                sig_count_clk <= 0;
                sig_ce        <= '1';
            end if;
        end if;

    end process p_clk_enable;

end architecture behavioral;
