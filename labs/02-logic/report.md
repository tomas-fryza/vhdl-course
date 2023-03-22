# Lab 2: INSERT_YOUR_FIRSTNAME INSERT_YOUR_LASTNAME

### 2-bit comparator

1. Karnaugh maps for other two functions of 2-bit comparator:

   Greater than:

   ![K-maps](images/kmap_empty.png)

   Less than:

   ![K-maps](images/kmap_empty.png)

2. Mark the largest possible implicants in the K-map and according to them, write the equations of simplified SoP (Sum of the Products) forms of both "greater than" functions and also both simplified PoS (Product of the Sums) forms.

<!--
   ![Logic functions](images/comparator_min.png)
-->

### 4-bit comparator

1. Listing of VHDL stimulus process for 4-bit comparator from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx??**

```vhdl
    p_stimulus : process is
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started";

        -- First test case
        sig_b <= "BCD_OF_YOUR_SECOND_LAST_ID_DIGIT"; -- Such as "0101" if ID = xxxx56
        sig_a <= "BCD_OF_YOUR_LAST_ID_DIGIT";        -- Such as "0110" if ID = xxxx56
        wait for 100 ns;
        -- Expected output
        assert (
            (sig_b_greater = 'WRITE_CORRECT_VALUE_HERE') and
            (sig_b_a_equal = 'WRITE_CORRECT_VALUE_HERE') and
            (sig_a_greater = 'WRITE_CORRECT_VALUE_HERE')
          )
          -- If false, then report an error
          report "Input combination COMPLETE_THIS_TEXT FAILED"
          severity error;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished";
        wait;
    end process p_stimulus;
```

2. Link to your public EDA Playground example:

   [https://www.edaplayground.com/...](https://www.edaplayground.com/...)
