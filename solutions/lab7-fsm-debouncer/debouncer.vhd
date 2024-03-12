library ieee;
    use ieee.std_logic_1164.all;

entity debouncer is
    port (
        clk     : in    std_logic;
        rst     : in    std_logic;
        ce      : in    std_logic;
        btn_in  : in    std_logic;
        btn_out : out   std_logic
    );
end entity debouncer;

architecture behavioral of debouncer is
    type   state_type is (st1_idle, st2_wait, st3_active, st4_wait);
    signal debouncer_state : state_type;

    constant C_MAX     : integer := 5;
    signal   sig_count : integer range 0 to C_MAX;
begin

    SYNC_PROC : process (clk) is
    begin

        if rising_edge(clk) then
            if (rst = '1') then
                debouncer_state <= st1_idle;
            elsif (ce = '1') then

                case (debouncer_state) is

                    when st1_idle =>
                        if (btn_in = '1') then
                            debouncer_state <= st2_wait;
                        end if;
                        btn_out <= '0';

                    when st2_wait =>
                        if (sig_count = C_MAX) then
                            sig_count <= 0;
                            if (btn_in = '1') then
                                debouncer_state <= st3_active;
                            else
                                debouncer_state <= st1_idle;
                            end if;
                        else
                            sig_count <= sig_count + 1;
                        end if;

                    when st3_active =>
                        if (btn_in = '0') then
                            debouncer_state <= st4_wait;
                        end if;
                        btn_out <= '1';

                    when st4_wait =>
                        if (sig_count = C_MAX) then
                            sig_count <= 0;
                            if (btn_in = '0') then
                                debouncer_state <= st1_idle;
                            end if;
                        else
                            sig_count <= sig_count + 1;
                        end if;

                end case;

            end if;
        end if;

    end process SYNC_PROC;

end architecture behavioral;
