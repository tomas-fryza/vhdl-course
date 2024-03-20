-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 18.3.2024 16:50:49 UTC

library ieee;
    use ieee.std_logic_1164.all;

entity tb_serial_tx is
end entity tb_serial_tx;

architecture tb of tb_serial_tx is
    component serial_tx is
        port (
            clk     : in    std_logic;
            rst     : in    std_logic;
            data    : in    std_logic_vector(7 downto 0);
            trigger : in    std_logic;
            tx      : out   std_logic
        );
    end component;

    signal clk     : std_logic;
    signal rst     : std_logic;
    signal data    : std_logic_vector(7 downto 0);
    signal trigger : std_logic;
    signal tx      : std_logic;

    constant TbPeriod   : time      := 10 ns; -- EDIT Put right period here
    signal   TbClock    : std_logic := '0';
    signal   TbSimEnded : std_logic := '0';
begin

    dut : component serial_tx
        port map (
            clk     => clk,
            rst     => rst,
            data    => data,
            trigger => trigger,
            tx      => tx
        );

    -- Clock generation
    TbClock <= not TbClock after TbPeriod / 2 when TbSimEnded /= '1' else
               '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process is
    begin

        -- EDIT Adapt initialization as needed
        trigger <= '0';

        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
        rst <= '1';
        wait for 3 * TbPeriod;
        rst <= '0';
        wait for 2 * TbPeriod;

        -- EDIT Add stimuli here
        data    <= x"41";
        trigger <= '1';
        wait for 1 * TbPeriod;
        trigger <= '0';
        wait for 40 * TbPeriod;

        data    <= x"54";
        trigger <= '1';
        wait for 1 * TbPeriod;
        trigger <= '0';
        wait for 40 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;

    end process stimuli;

end architecture tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_serial_tx of tb_serial_tx is
    for tb
    end for;
end cfg_tb_serial_tx;
