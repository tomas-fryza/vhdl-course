# Lab 4: YOUR_FIRSTNAME_FAMILYNAME

Link to your `Digital-electronics-1` GitHub repository:

   [https://github.com/...](https://github.com/...)


### Preparation tasks

1. Figure or table with connection of 7-segment displays on Nexys A7 board:

   ![your figure]()


### Seven-segment display decoder

1. Listing of VHDL stimulus process from testbench file (`tb_hex_7seg.vhd`) with syntax highlighting and asserts. Verify all input combinations:

```vhdl
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        -- First test case
        s_hex <= "0000"; wait for 50 ns;
        assert (s_seg = "0000001")
        report "Input combination 0000 FAILED" severity error;


        -- WRITE OTHER TEST CASES HERE


        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

2. Screenshot with simulated time waveforms; always display all inputs and outputs (inputs first):

   ![your figure]()


### LED(7:4) indicators

1. Listing of LEDs(7:4) part of VHDL architecture from source file `top.vhd` with syntax highlighting; try to write logic functions as simple as possible:

```vhdl
    --------------------------------------------------------------------
    -- Experiments on your own: LED(7:4) indicators

    -- Turn LED(4) on if input value is equal to 0, ie "0000"
    -- WRITE YOUR CODE HERE
    
    -- Turn LED(5) on if input value is greater than "1001", ie 10, 11, 12, ...
    -- WRITE YOUR CODE HERE
    
    -- Turn LED(6) on if input value is odd, ie 1, 3, 5, ...
    -- WRITE YOUR CODE HERE
    
    -- Turn LED(7) on if input value is a power of two, ie 1, 2, 4, or 8
    -- WRITE YOUR CODE HERE
```
