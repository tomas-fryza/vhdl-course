library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity tb_debouncer is
end entity tb_debouncer;

architecture behavior of tb_debouncer is
    -- Component Declaration for the Unit Under Test (UUT)
    component debouncer is
        port (
            clk     : in    std_logic;
            rst     : in    std_logic;
            ce      : in    std_logic;
            btn_in  : in    std_logic;
            btn_out : out   std_logic
        );
    end component;

    -- Inputs
    signal clock     : std_logic;
    signal reset     : std_logic;
    signal clock_en  : std_logic;
    signal button_in : std_logic;
    signal pulse_out : std_logic;

    -- Clock period definitions
    constant clock_period : time := 10 ns;
begin

    -- Instantiate the Unit Under Test (UUT)
    uut : component debouncer
        port map (
            clk     => clock,
            rst     => reset,
            ce      => clock_en,
            btn_in  => button_in,
            btn_out => pulse_out
        );

    -- Clock process definitions
    clock_process : process is
    begin

        clock <= '0';
        wait for clock_period / 2;
        clock <= '1';
        wait for clock_period / 2;

    end process clock_process;

    -- Stimulus process
    stim_proc : process is
    begin

        clock_en  <= '1';
        button_in <= '0';
        reset     <= '1';
        -- hold reset state for 100 ns.
        wait for 100 ns;
        reset <= '0';
        wait for clock_period * 10;

        -- first activity
        button_in <= '1';
        wait for clock_period * 2;
        button_in <= '0';
        wait for clock_period * 1;
        button_in <= '1';
        wait for clock_period * 1;
        button_in <= '0';
        wait for clock_period * 20;

        -- second activity
        button_in <= '1';
        wait for clock_period * 1;
        button_in <= '0';
        wait for clock_period * 1;
        button_in <= '1';
        wait for clock_period * 1;
        button_in <= '0';
        wait for clock_period * 2;
        button_in <= '1';
        wait for clock_period * 20;

        -- third activity
        button_in <= '0';
        wait for clock_period * 2;
        button_in <= '1';
        wait for clock_period * 1;
        button_in <= '0';
        wait for clock_period * 1;
        button_in <= '1';
        wait for clock_period * 1;
        button_in <= '0';
        wait;

    end process stim_proc;

end architecture behavior;
