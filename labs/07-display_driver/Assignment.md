# Lab 7: YOUR_FIRSTNAME FAMILYNAME

Link to your `Digital-electronics-1` GitHub repository:

   [https://github.com/...](https://github.com/...)


### Preparation tasks

1. Figure of timing diagram for displaying value `3.142`:

   ![your figure]()


### Display driver

1. Listing of VHDL code of the completed process `p_mux` with syntax highlighting:

```vhdl
    --------------------------------------------------------
    -- p_mux:
    -- A sequential process that implements a multiplexer for
    -- selecting data for a single digit, a decimal point 
    -- signal, and switches the common anodes of each display.
    --------------------------------------------------------
    p_mux : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                s_hex <= data0_i;
                dp_o  <= dp_i(0);
                dig_o <= "1110";
            else
                case s_cnt is
                    when "11" =>
                        s_hex <= data3_i;
                        dp_o  <= dp_i(3);
                        dig_o <= "0111";

                    when "10" =>
                        -- WRITE YOUR CODE HERE

                    when "01" =>
                        -- WRITE YOUR CODE HERE

                    when others =>
                        -- WRITE YOUR CODE HERE
                end case;
            end if;
        end if;
    end process p_mux;
```

2. Screenshot with simulated time waveforms; always display all inputs and outputs (inputs first). The full functionality of the entity must be verified:

   ![your figure]()


### Eight-digit driver

1. Image of the driver schematic. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   ![your figure]()
