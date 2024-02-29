-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 28.2.2024 21:53:41 UTC

library ieee;
    use ieee.std_logic_1164.all;

-------------------------------------------------

entity tb_simple_counter is
end entity tb_simple_counter;

-------------------------------------------------

architecture tb of tb_simple_counter is
    component simple_counter is
        generic (
            g_NBIT : integer
        );
        port (
            clk   : in    std_logic;
            rst   : in    std_logic;
            en    : in    std_logic;
            count : out   std_logic_vector(g_NBIT - 1 downto 0)
        );
    end component;

    constant c_NBIT : integer := 5;
    signal   clk    : std_logic;
    signal   rst    : std_logic;
    signal   en     : std_logic;
    signal   count  : std_logic_vector(c_NBIT - 1 downto 0);

    constant TbPeriod   : time      := 10 ns; -- EDIT Put right period here
    signal   TbClock    : std_logic := '0';
    signal   TbSimEnded : std_logic := '0';
begin

    dut : component simple_counter
        generic map (
            g_NBIT => c_NBIT
        )
        port map (
            clk   => clk,
            rst   => rst,
            en    => en,
            count => count
        );

    -- Clock generation
    TbClock <= not TbClock after TbPeriod / 2 when TbSimEnded /= '1' else
               '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process is
    begin

        -- EDIT Adapt initialization as needed
        en <= '1';

        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
        rst <= '1';
        wait for 100 ns;
        rst <= '0';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 66 * TbPeriod;
        en <= '0';
        wait for 30 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;

    end process stimuli;

end architecture tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_simple_counter of tb_simple_counter is
    for tb
    end for;
end cfg_tb_simple_counter;
