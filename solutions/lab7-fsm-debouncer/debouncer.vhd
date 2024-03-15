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
    signal next_state : state_type;
    signal state      : state_type;

    signal sig_count_clk : integer range 0 to CLK_PERIOD;
    signal sig_count_deb : integer range 0 to DEB_PERIOD;
    signal sig_ce        : std_logic;
begin

    p_debouncer : process (state, btn_in) is
    begin

        case (next_state) is

            when st1_idle =>
                if (btn_in = '1') then
                    next_state <= st2_wait;
                else
                    next_state <= st1_idle;
                end if;

            when st2_wait =>
                if (sig_count_deb = DEB_PERIOD) then
                    sig_count_deb <= 0;
                    if (btn_in = '1') then
                        next_state <= st3_active;
                    else
                        next_state <= st1_idle;
                    end if;
                else
                    sig_count_deb <= sig_count_deb + 1;
                    next_state    <= st2_wait;
                end if;

            when st3_active =>
                if (btn_in = '0') then
                    next_state <= st4_wait;
                else
                    next_state <= st3_active;
                end if;

            when st4_wait =>
                if (sig_count_deb = DEB_PERIOD) then
                    sig_count_deb <= 0;
                    if (btn_in = '0') then
                        next_state <= st1_idle;
                    else
                        next_state <= st4_wait;
                    end if;
                else
                    sig_count_deb <= sig_count_deb + 1;
                end if;

            when others =>
                next_state <= st1_idle;

        end case;

    end process p_debouncer;

    p_register : process (clk) is
    begin

        if rising_edge(clk) then
            if (rst = '1') then
                state <= st1_idle;
            elsif (sig_ce = '1') then
                state <= next_state;
            end if;
        end if;

    end process p_register;

    btn_out <= '1' when state = st3_active or state = st4_wait else
               '0';

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
                sig_ce        <= '0';

            -- End of counter reached
            else
                sig_count_clk <= 0;
                sig_ce        <= '1';
            end if;
        end if;

    end process p_clk_enable;

end architecture behavioral;
