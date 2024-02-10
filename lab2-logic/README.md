# Lab 2: Combinational logic

* [Pre-Lab preparation](#preparation)
* [Part 1: Logic function minimization](#part1)
* [Part 2: Binary comparator in VHDL language](#part2)
* [Part 3: Assertion statements in VHDL testbench](#part3)
* [Part 4: Implementing to FPGA](#part4)
* [Experiments on your own](#experiments)
* [References](#references)

### Learning objectives

After completing this lab you will be able to:

* Use truth table, K-map, SoP/PoS forms of logic functions
* Minimize logic functions
* Understand signal assignments in VHDL
* Use VHDL assertion statements for testing

The purpose of this laboratory exercise is to learn to use different ways of writing combination functions (truth table, K-map, SoP/PoS forms), their minimization, the use of signal assignments in VHDL, and assertion statements in VHDL testbench.

<a name="preparation"></a>

## Pre-Lab preparation

*Digital* or *Binary comparator* compares the digital signals A, B presented at input terminal and produce outputs depending upon the condition of those inputs.

1. Complete the truth table for 2-bit *Identity comparator* (B equals A), and two *Magnitude comparators* (B is greater than A, A is greater than A). Note that, such a digital device has four inputs and three outputs/functions.

   | **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B is greater than A** | **B equals A** | **A is greater than B** |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   |  0 | 0 0 | 0 0 | 0 | 1 | 0 |
   |  1 | 0 0 | 0 1 | 0 | 0 | 1 |
   |  2 | 0 0 | 1 0 | 0 | 0 | 1 |
   |  3 | 0 0 | 1 1 | 0 | 0 | 1 |
   |  4 | 0 1 | 0 0 |  | 0 |  |
   |  5 | 0 1 | 0 1 |  | 1 |  |
   |  6 | 0 1 | 1 0 |  | 0 |  |
   |  7 | 0 1 | 1 1 |  | 0 |  |
   |  8 | 1 0 | 0 0 |  | 0 |  |
   |  9 | 1 0 | 0 1 |  | 0 |  |
   | 10 | 1 0 | 1 0 |  | 1 |  |
   | 11 | 1 0 | 1 1 |  | 0 |  |
   | 12 | 1 1 | 0 0 |  | 0 |  |
   | 13 | 1 1 | 0 1 |  | 0 |  |
   | 14 | 1 1 | 1 0 |  | 0 |  |
   | 15 | 1 1 | 1 1 |  | 1 |  |

<a name="part1"></a>

## Part 1: Logic function minimization

*[Karnaugh Maps](https://learnabout-electronics.org/Digital/dig24.php) (or K-maps) offer a graphical method of reducing a digital circuit to its minimum number of gates. The map is a simple table containing `1`s and `0`s that can express a truth table or complex Boolean expression describing the operation of a digital circuit.*

The K-map for the "equals" function is as follows:

   ![Karnaugh map for "equals" function](images/kmap_equals.png)

1. Create K-maps for other two functions.

   ![Empty Karnaugh map 4x4](images/kmap_empty.png) &nbsp;  &nbsp;  &nbsp;  &nbsp;
   ![Empty Karnaugh map 4x4](images/kmap_empty.png)

2. Use K-maps to create simplified SoP and PoS forms of both "greater than" functions.

<!--
   ![Binary comparator simplified functions](images/comparator_min.png)
-->

<a name="part2"></a>

## Part 2: Binary comparator in VHDL language

1. Run Vivado and create a new project:

   1. Project name: `comparator`
   2. Project location: your working folder, such as `Documents`
   3. Project type: **RTL Project**
   4. Create a new VHDL source file: `compare_2bit`
   5. Do not add any constraints now
   6. Choose a default board: `Nexys A7-50T`
   7. Click **Finish** to create the project
   8. Define I/O ports of new module:
      * Port name: `a`, Direction: `in`, Bus: `check`, MSB: `1`, LSB: `0`
      * `b`, `in`, Bus: `check`, MSB: `1`, LSB: `0`
      * `b_greater_`, `out`
      * `b_a_equal`, `out`
      * `a_greater`, `out`

   > **Note:** The [entity](https://github.com/tomas-fryza/vhdl-course/wiki/Entity) for a 2-bit binary comparator in `compare_2bit.vhd` therefore coresponds to the following table.
   >
   > | **Port name** | **Direction** | **Type** | **Description** |
   > | :-: | :-: | :-- | :-- |
   > | `b`       | input  | [`std_logic_vector(1 downto 0)`](https://github.com/tomas-fryza/vhdl-course/wiki/Data-types) | Input data b[1:0] |
   > | `a`       | input  | `std_logic_vector(1 downto 0)` | Input data a[1:0] |
   > | `b_greater` | output | `std_logic` | Output is `1` if b > a |
   > | `b_a_equal` | output | `std_logic` | Output is `1` if b = a |
   > | `a_greater` | output | `std_logic` | Output is `1` if b < a |

2. In VHDL, define an [architecture](https://github.com/tomas-fryza/vhdl-course/wiki/Architecture) for a 2-bit binary comparator. The combination logic can be written using low-level operators (`and`, `or`, etc.) as in the previous laboratory exercise. However, it is more efficient to use a higher notation with [conditional signal assignments](https://github.com/tomas-fryza/vhdl-course/wiki/Signal-assignments).

   ```vhdl
   architecture behavioral of compare_2bit is
   begin

     -- MODIFY LOGIC FUNCTION FOR "B GREATER"
     b_greater <= b(1) and a(1);

     b_a_equal <= '1' when (b = a) else
                  '0';

     -- MODIFY LOGIC FUNCTION FOR "A GREATER"
     a_greater <= b(0) or a(0);

   end architecture behavioral;
   ```

   Write one function in signal-assignments style and one function in simplified SoP or PoS form with low-level operators.

3. Use **File** > **Add Sources... Alt+A** > **Add or create simulation sources** and create a new VHDL file `tb_compare_2bit` (same filename as tested entity with prefix `tb_`). Generate the testbench file by [online generator](https://vhdl.lapinoo.net/testbench/) or copy/paste it from the [EDA Playground template](https://www.edaplayground.com/x/5uu3). Complete the stimuli process by several test cases.

   ```vhdl
   stimuli : process
   begin
     -- EDIT Adapt initialization as needed
     b <= "00";
     a <= "00";
     wait for 100 ns;

     -- EDIT Add stimuli here

     wait;
   end process;
   ```

<a name="part3"></a>

## Part 3: Assertion statements in VHDL testbench

You can write any information to the console using the report statement. The basic syntax in VHDL is:

   ```vhdl
   report <message_string> [severity <severity_level>];
   ```

where possible values for `severity_level` are: `note`, `warning`, `error`, `failure`. If the severity level is omitted, then the default value is `note`. The following two statements are therefore equivalent:

   ```vhdl
   report "Stimulus process started" severity note;
   report "Stimulus process started";
   ```

An assertion statement checks that a specified condition is true and reports an error if it is not. It is combined with a report statement as follows:

   ```vhdl
   assert (<condition>)
   report <message_string> [severity <severity_level>];
   ```

The message is displayed to the console when the condition is NOT met, therefore the message should be an opposite to the condition.

   ```vhdl
   --------------------------------------------------------
   -- Data generation process
   --------------------------------------------------------
   p_stimulus : process is
   begin

     -- Report a note at the beginning of stimulus process
     report "Stimulus process started";

     -- First test case ...
     sig_b <= "00";
     sig_a <= "00";
     wait for 100 ns;
     -- ... and its expected outputs
     assert (
         (sig_b_greater = '0') and
         (sig_b_a_equal = '1') and
         (sig_a_greater = '0')
       )
       -- If false, then report an error
       -- If true, then do not report anything
       report "Input combination b=0, a=0 FAILED"
       severity error;

       -- WRITE OTHER TEST CASES AND ASSERTS HERE


     -- Report a note at the end of stimulus process
     report "Stimulus process finished";
     wait; -- Data generation process is suspended forever

   end process p_stimulus;
   ```

1. In VHDL, write a testbench and verify the correct functionality of the comparator for all input combinations.

<a name="part4"></a>

## Part 4: Implementing to FPGA

1. The Nexys A7 board have hardwired connections between FPGA chip and the switches and LEDs. To use these devices it is necessary to include in your project the correct pin assignments.

   * Create a new constraints source `nexys-a7-50t` (XDC file)
   * Copy/paste default constraints from [Nexys-A7-50T-Master.xdc](https://raw.githubusercontent.com/Digilent/digilent-xdc/master/Nexys-A7-50T-Master.xdc) to `nexys-a7-50t.xdc` file.
   * The pin assignments in the file are useful only if the pin names that appear in this file are exactly the same as the port names used in your VHDL entity. Uncomment any 2 switches for inputs `a[0]`, `a[1]`, other 2 switches for `b[0]`, `b[1]`, and 3 LEDs for logic functions `b_greater`, `b_a_equal`, and `a_greater`.

2. Implement your design to Nexys A7 board:

   * Use **Flow > Generate Bitstream** (the process is time consuming and can take tens of seconds)
   * Select **Open Hardware Manager**
   * Click on **Open Target > Auto Connect** (make sure Nexys A7 board is connected and switched on)
   * Click on **Program device** and select generated bitstream `YOUR-PROJECT-FOLDER/comparator.runs/impl_1/comparator.bit`
   * Test the functionality by toggling the switches and observing LEDs

<a name="experiments"></a>

## Experiments on your own

1. Extend your design to 4-bit comparator.

<a name="references"></a>

## References

1. Eric Coates. [Karnaugh Maps](https://learnabout-electronics.org/Digital/dig24.php)

2. Tomas Fryza. [Example of 2-bit binary comparator using the when/else assignments](https://www.edaplayground.com/x/5uu3)
