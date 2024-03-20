library ieee;
    use ieee.std_logic_1164.all;

-----------------------------------------------------------

entity serial_tx is
    port (
        clk     : in    std_logic;
        rst     : in    std_logic;
        data    : in    std_logic_vector(7 downto 0);
        trigger : in    std_logic;
        tx      : out   std_logic
    );
end entity serial_tx;

-----------------------------------------------------------

architecture behavioral of serial_tx is
    -- Component declaration of clock enable
    component clock_enable is
        generic (
            PERIOD : integer
        );
        port (
            clk   : in    std_logic;
            rst   : in    std_logic;
            pulse : out   std_logic
        );
    end component;

    -- Internal signals
    signal sig_en    : std_logic;
    signal sig_start : std_logic;
    signal sig_reg   : std_logic_vector(9 downto 0);
    signal sig_count : integer;
begin

    baudrate : component clock_enable
        generic map (
            -- For simulation
            -- PERIOD => 3
            -- (1 / 115.200 Bd) / (1/100_000_000)
            -- PERIOD => 868
            -- (1 / 9.600 Bd) / (1/100_000_000)
            PERIOD => 10_417
        )
        port map (
            clk   => clk,
            rst   => rst,
            pulse => sig_en
        );

    p_start : process (clk) is
    begin

        if rising_edge(clk) then
            if (rst = '1') then
                sig_start <= '0';
                tx        <= '1';
                sig_count <= 0;

            -- Starting event
            elsif (trigger = '1') then
                sig_start <= '1';
                sig_reg   <= '1' & data & '0';

            -- Transmitting bits: Start, from LSB to MSB, Stop
            elsif ((sig_start = '1') and (sig_en = '1')) then
                tx        <= sig_reg(0);
                sig_reg   <= '0' & sig_reg(9 downto 1);
                sig_count <= sig_count + 1;

                -- End of UART frame
                if (sig_count >= 9) then
                    sig_start <= '0';
                    sig_count <= 0;
                end if;
            end if;
        end if;

    end process p_start;

end architecture behavioral;
