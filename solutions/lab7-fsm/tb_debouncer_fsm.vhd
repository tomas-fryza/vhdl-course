library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity tb_debouncer is
end entity tb_debouncer;

architecture behavior of tb_debouncer is
    -- Component Declaration for the Device Under Test (DUT)
    component debouncer_fsm is
        port (
            clk     : in    std_logic;
            rst     : in    std_logic;
            ce      : in    std_logic;
            bouncey : in    std_logic;
            clear   : out   std_logic
        );
    end component;

    -- Inputs
    signal clock     : std_logic;
    signal reset     : std_logic;
    signal clock_en  : std_logic;
    signal button_in : std_logic;
    signal pulse_out : std_logic;

    -- Clock period definitions
    constant TbPeriod   : time := 10 ns;
    signal   TbClock    : std_logic := '0';
    signal   TbSimEnded : std_logic := '0';
begin

    -- Instantiate the Device Under Test (DUT)
    dut : component debouncer_fsm
        port map (
            clk     => clock,
            rst     => reset,
            ce      => clock_en,
            bouncey => button_in,
            clear   => pulse_out
        );

    -- Clock generation
    TbClock <= not TbClock after TbPeriod / 2 when TbSimEnded /= '1' else
               '0';

    -- EDIT: Check that clk is really your main clock signal
    clock <= TbClock;

    -- Stimulus process
    stim_proc : process is
    begin

        clock_en  <= '1';
        button_in <= '0';
        reset     <= '1';
        wait for TbPeriod * 3;
        reset     <= '0';

        -- first activity
        wait for TbPeriod * 10;
        button_in <= '1';
        wait for TbPeriod * 2;
        button_in <= '0';
        wait for TbPeriod * 1;
        button_in <= '1';
        wait for TbPeriod * 1;
        button_in <= '0';
        wait for TbPeriod * 20;

        -- second activity
        button_in <= '1';
        wait for TbPeriod * 1;
        button_in <= '0';
        wait for TbPeriod * 1;
        button_in <= '1';
        wait for TbPeriod * 1;
        button_in <= '0';
        wait for TbPeriod * 2;
        button_in <= '1';
        wait for TbPeriod * 10;
        button_in <= '0';
        wait for TbPeriod * 1;
        button_in <= '1';
        wait for TbPeriod * 10;

        -- third activity
        button_in <= '0';
        wait for TbPeriod * 2;
        button_in <= '1';
        wait for TbPeriod * 1;
        button_in <= '0';
        wait for TbPeriod * 1;
        button_in <= '1';
        wait for TbPeriod * 1;
        button_in <= '0';
        wait for TbPeriod * 30;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;

    end process stim_proc;

end architecture behavior;
