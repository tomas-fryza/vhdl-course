--------------------------------------------------------------------------------
--
--   FileName:         debounce.vhd
--   Dependencies:     none
--   Design Software:  Quartus Prime Version 17.0.0 Build 595 SJ Lite Edition
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 2.0 6/28/2019 Scott Larson
--     Made stable time higher resolution and simpler to specify
--     Made stable time simpler to specify
--   Version 1.0 3/26/2012 Scott Larson
--     Initial Public Release
--
--------------------------------------------------------------------------------

LIBRARY ieee;
    USE ieee.std_logic_1164.all;

ENTITY debounce IS
    GENERIC (
        clk_freq    : INTEGER := 100_000_000; -- system clock frequency in Hz
        stable_time : INTEGER := 8            -- time button must remain stable in ms
    );
    PORT (
        clk    : IN    STD_LOGIC; -- input clock
        arst_n : IN    STD_LOGIC; -- asynchronous active low reset
        button : IN    STD_LOGIC; -- input signal to be debounced
        result : OUT   STD_LOGIC  -- debounced signal
    );
END entity debounce;

ARCHITECTURE logic OF debounce IS
    SIGNAL flipflops   : STD_LOGIC_VECTOR(1 DOWNTO 0); -- input flip flops
    SIGNAL counter_set : STD_LOGIC;                    -- sync reset to zero
BEGIN

    counter_set <= flipflops(0) xor flipflops(1); -- determine when to start/reset counter

    p_debounce : PROCESS (clk, arst_n) is

        VARIABLE count : INTEGER RANGE 0 TO clk_freq * stable_time / 1000; -- counter for timing

    BEGIN

        IF (arst_n = '0') THEN                                 -- reset
            flipflops(1 DOWNTO 0) <= "00";                     -- clear input flipflops
            result                <= '0';                      -- clear result register
        ELSIF (clk'EVENT and clk = '1') THEN                   -- rising clock edge
            flipflops(0) <= button;                            -- store button value in 1st flipflop
            flipflops(1) <= flipflops(0);                      -- store 1st flipflop value in 2nd flipflop
            IF (counter_set = '1') THEN                        -- reset counter because input is changing
                count := 0;                                    -- clear the counter
            ELSIF (count < clk_freq * stable_time / 1000) THEN -- stable input time is not yet met
                count := count + 1;                            -- increment counter
            ELSE                                               -- stable input time is met
                result <= flipflops(1);                        -- output the stable value
            END IF;
        END IF;

    END PROCESS p_debounce;

END architecture logic;
