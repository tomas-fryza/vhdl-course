-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 8.3.2024 14:18:15 UTC

library ieee;
    use ieee.std_logic_1164.all;

entity tb_debouncer is
end entity tb_debouncer;

architecture tb of tb_debouncer is
    component debouncer is
        generic (
            DEB_PERIOD : integer
        );
        port (
            clk     : in    std_logic;
            en      : in    std_logic;
            btn_in  : in    std_logic;
            btn_out : out   std_logic
        );
    end component;

    signal clk     : std_logic;
    signal en      : std_logic;
    signal btn_in  : std_logic;
    signal btn_out : std_logic;

    constant TbPeriod   : time      := 10 ns; -- EDIT Put right period here
    signal   TbClock    : std_logic := '0';
    signal   TbSimEnded : std_logic := '0';
begin

    dut : component debouncer
        generic map (
            DEB_PERIOD => 5
        )
        port map (
            clk     => clk,
            en      => en,
            btn_in  => btn_in,
            btn_out => btn_out
        );

    -- Clock generation
    TbClock <= not TbClock after TbPeriod / 2 when TbSimEnded /= '1' else
               '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process is
    begin

        -- EDIT Adapt initialization as needed
        en     <= '1';
        btn_in <= '0';

        -- EDIT Add stimuli here
        wait for 10 * TbPeriod;
        btn_in <= '1';
        wait for 1 * TbPeriod;
        btn_in <= '0';
        wait for 1 * TbPeriod;
        btn_in <= '1';
        wait for 2 * TbPeriod;
        btn_in <= '0';
        wait for 2 * TbPeriod;
        btn_in <= '1';
        wait for 1 * TbPeriod;
        btn_in <= '0';
        wait for 1 * TbPeriod;
        btn_in <= '1';
        wait for 20 * TbPeriod;

        btn_in <= '0';
        wait for 1 * TbPeriod;
        btn_in <= '1';
        wait for 2 * TbPeriod;
        btn_in <= '0';
        wait for 4 * TbPeriod;
        btn_in <= '1';
        wait for 1 * TbPeriod;
        btn_in <= '0';
        wait for 20 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;

    end process stimuli;

end architecture tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_debouncer of tb_debouncer is
    for tb
    end for;
end cfg_tb_debouncer;
