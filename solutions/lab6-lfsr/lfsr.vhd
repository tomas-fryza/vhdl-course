-- Inspired by:
--   https://nandland.com/lfsr-linear-feedback-shift-register/
--   https://docs.xilinx.com/v/u/en-US/xapp052

library ieee;
    use ieee.std_logic_1164.all;

-------------------------------------------------

entity lfsr is
    generic (
        NBIT : integer := 4
    );
    port (
        clk       : in    std_logic;
        en        : in    std_logic;
        seed_en   : in    std_logic;
        seed_data : in    std_logic_vector(NBIT - 1 downto 0);
        done      : out   std_logic;
        count     : out   std_logic_vector(NBIT - 1 downto 0)
    );
end entity lfsr;

-------------------------------------------------

architecture behavioral of lfsr is
    --! Internal register
    signal sig_reg : std_logic_vector(NBIT - 1 downto 0);

    --! Internal feedback with xnor gate(s)
    signal sig_feedback : std_logic;
begin

    p_lfsr : process (clk) is
    begin

        if (rising_edge(clk)) then
            -- Load `starting` data
            if (seed_en = '1') then
                sig_reg <= seed_data;

            -- Clock enable activated
            elsif (en = '1') then
                -- Shift internal register
                sig_reg <= sig_reg(NBIT - 2 downto 0) & sig_feedback;
            end if;
        end if;

    end process p_lfsr;

    -- Assign internal register to output
    count <= sig_reg;

    -- Create feedback for 4-bit LFSR counter (tap4, tap3)
    sig_feedback <= sig_reg(3) xnor sig_reg(2);

    -- Create a `done` output pulse
    done <= '1' when (sig_reg = seed_data) else
            '0';

end architecture behavioral;
