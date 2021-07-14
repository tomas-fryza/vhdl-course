# Lab 2: YOUR_FIRSTNAME_FAMILYNAME

Link to your `Digital-electronics-1` GitHub repository:

   [https://github.com/...](https://github.com/...)


### 2-bit comparator

1. Karnaugh maps for other two functions:

   Greater:

   ![K-maps](Images/kmap_empty.png)

   Less:

   ![K-maps](Images/kmap_empty.png)

2. Equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![Logic functions](Images/comparator_min.png)

3. Listing of VHDL architecture from design file (`design.vhd`) with syntax highlighting for all three functions:

```vhdl
architecture Behavioral of comparator_2bit is
begin
    B_greater_A_o <= -- WRITE YOUR CODE HERE
    B_equals_A_o  <= -- WRITE YOUR CODE HERE
    B_less_A_o    <= '1' when (b_i < a_i) else '0';
end architecture Behavioral;
```


### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with syntax highlighting and asserts. Verify at least ten random input combinations:

```vhdl
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case
        s_b <= "0000"; s_a <= "0000"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '1') and
                (s_B_less_A    = '0'))
        -- If false, then report an error
        report "Input combination 0000, 0000 FAILED" severity error;

        -- WRITE OTHER TEST CASES HERE

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

2. Screenshot with simulated time waveforms; always display all inputs and outputs (inputs first):

   ![Screenshot example](Images/basicgates_waveform.png)

3. Link to your public EDA Playground example:

   [https://www.edaplayground.com/...](https://www.edaplayground.com/...)
