# Lab 4: Arithmetic circuits

* [Pre-Lab preparation](#preparation)
* [Part 1: VHDL code for full adder](#part1)
* [Part 2: VHDL code for 4-bit adder](#part2)
* [Part 3: Top level VHDL code](#part3)
* [Challenges](#challenges)
* [References](#references)

### Learning objectives

After completing this lab you will be able to:

* Understand half- and full-adders
* Practice instantiating VHDL sub-components
* Construct a ripple carry adder

The purpose of this laboratory exercise is to design a binary adder and subtractor and practise the instantiations in VHDL.

<a name="preparation"></a>

## Pre-Lab preparation

A **half adder** has two one-bit inputs A and B and consists of two outputs Carry and Sum. Complete the half adder truth table. Draw a logic diagram of both output functions. A **full adder** extend inputs to three signal: A, B, and input Carry and also has two outputs: output Carry and Sum. Basicaly, carry and sum represent 2-bit result of addition operation.

1. Complete the full adder truth table.

   | **C_in** | **B** | **A** | **C_out** | **Sum** | **Dec. equivalent** |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 0 | 0 | 0 | 0 | 0 |
   | 0 | 0 | 1 |  |  |  |
   | 0 | 1 | 0 |  |  |  |
   | 0 | 1 | 1 |  |  |  |
   | 1 | 0 | 0 |  |  |  |
   | 1 | 0 | 1 |  |  |  |
   | 1 | 1 | 0 |  |  |  |
   | 1 | 1 | 1 | 1 | 1 | 3 |

2. See [schematic](https://github.com/tomas-fryza/vhdl-course/blob/master/docs/nexys-a7-sch.pdf) or [reference manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual) of the Nexys A7 board and find out the connection of RGB LEDs and how to turn them on and off using BJTs (Bipolar Junction Transistor).

   ![nexys A7 led and segment](../lab2-logic/images/nexys-a7_leds-display.png)

<a name="part1"></a>

## Part 1: VHDL code for full adder

Full adder is the adder which adds three inputs and produces two outputs. The first two inputs are A and B and the third input is an input carry as C_IN. The output carry is designated as C_OUT and the normal output is designated as SUM.

1. Run Vivado and create a new project:

   1. Project name: `adder`
   2. Project location: your working folder, such as `Documents`
   3. Project type: **RTL Project**
   4. Create a new VHDL source file: `full_adder`
   5. Do not add any constraints now
   6. Choose a default board: `Nexys A7-50T`
   7. Click **Finish** to create the project
   8. Define I/O ports of new module:

      | **Port name** | **Direction** | **Type** | **Description** |
      | :-: | :-: | :-- | :-- |
      | `c_in` | input | `std_logic` | Input carry |
      | `b` | input   | `std_logic` | Input b |
      | `a` | input   | `std_logic` | Input a |
      | `c_out` | output | `std_logic` | Output carry |
      | `sum` | output  | `std_logic` | Output sum |

2. Complete the architecture and define output signals `c_out` and `sum`. Note that, you can also use two instances of [half adder](https://www.edaplayground.com/x/2Jcz) and one OR gate. (For explanation, see logic diagram of [Satvik Ramaprasad](https://circuitverse.org/users/3/projects/247).)

   ![full adder structures](images/full-adder_structure.png)

3. Create a VHDL simulation source `tb_full_adder`, [generate testbench](https://vhdl.lapinoo.net/testbench/), complete all test cases, and verify the functionality of the adder.

   ```vhdl
   -- Test case 1: Input binary value 0,0,0
    c_in <= '0';
    b    <= '0';
    a    <= '0';
    wait for 100 ns;
    assert (c_out = '0' and sum = '0')
      report "Input combination c_in=0, b=0, a=0 FAILED"
      severity error;
   ```

4. Use **Flow** > **Open Elaborated design** and see the schematic after RTL analysis. Note that RTL (Register Transfer Level) represents digital circuit at the abstract level.

<a name="part2"></a>

## Part 2: VHDL code for 4-bit adder

**Ripple carry** adder is designed by connecting full-adder circuits in a cascade fasion in such a way that, two n-bit binary inputs are applied parallelly to the circuit and the output carry of previous full adder is applied to the input carry of the next full adder. For two n-bit binary addition, n number of full adder circuit is required.

   ![ripple carry adder](images/RCA.jpg)

1. Create a new VHDL design source `adder_4bit` in your project.
2. Define I/O ports as follows.

   | **Port name** | **Direction** | **Type** | **Description** |
   | :-: | :-: | :-- | :-- |
   | `c_in` | in  | `std_logic` | Input carry |
   | `b` | input   | `std_logic_vector (3 downto 0)` | Input bus b[3:0] |
   | `a` | input   | `std_logic_vector (3 downto 0)` | Input bus a[3:0] |
   | `c_out` | output | `std_logic` | Output carry |
   | `result` | output  | `std_logic_vector (3 downto 0)` | Output bus sum[3:0] |

3. Use 4 component instantiations of `full_adder` and define the 4-bit binary adder.

4. Create a VHDL simulation source `tb_adder_4bit`, generate testbench, complete several test cases, and verify the functionality of the adder.

5. Use **Flow** > **Open Elaborated design** and see the schematic after RTL analysis.

<a name="part3"></a>

## Part 3: Top level VHDL code

1. Create a new VHDL design source `top_level` in your project.
2. Define I/O ports as follows.

   | **Port name** | **Direction** | **Type** | **Description** |
   | :-: | :-: | :-- | :-- |
   | `SW_C` | in  | `std_logic` | Input carry |
   | `SW_B` | in  | `std_logic_vector(3 downto 0)` | First operand b[3:0] |
   | `SW_A` | in  | `std_logic_vector(3 downto 0)` | Second operand a[3:0] |
   | `LED_B` | out | `std_logic_vector(3 downto 0)` | Show binary value b[3:0] |
   | `LED_A` | out | `std_logic_vector(3 downto 0)` | Show binary value a[3:0] |
   | `LED_RED` | out | `std_logic` | Show output carry |
   | `CA` | out | `std_logic` | Cathode of segment A |
   | `CB` | out | `std_logic` | Cathode of segment B |
   | `CC` | out | `std_logic` | Cathode of segment C |
   | `CD` | out | `std_logic` | Cathode of segment D |
   | `CE` | out | `std_logic` | Cathode of segment E |
   | `CF` | out | `std_logic` | Cathode of segment F |
   | `CG` | out | `std_logic` | Cathode of segment G |
   | `DP` | out | `std_logic` | Decimal point |
   | `AN` | out | `std_logic_vector(7 downto 0)` | Common anodes of all on-board displays |
   | `BTNC` | in | `std_logic` | Clear the display |

2. Copy source file `bin2seg.vhd` from the previous lab to the `YOUR-PROJECT-FOLDER/adder.srcs/sources_1/new/` source folder and add it to the project.

3. Use component instantiation of `adder_4bit` and `bin2seg`, and define the top-level architecture.

   !FIGURE TBD











4. In menu **Tools > Schematic Viewer > RTL...** select **Start with a schematic of top-level block** and check the hierarchical structure of the module.

5. In menu **Project > Design Summary/Reports** check **CPLD Fitter Report (Text)** for implemented functions in section `********** Mapped Logic **********`.







> **Fun fact:** In the next labs we are not going to use these low level gates to perform arithmetical operations but operators defined in numeric package :sweat_smile:
>
>    ```vhdl
>    library ieee;
>      use ieee.std_logic_1164.all;
>      use ieee.numeric_std.all; -- Package for arithmetic operations
>
>    ...
>      sig_cnt <= sig_cnt + 1;
>    ...
>    ```

<a name="challenges"></a>

## Challenges

1. Extend the functionality of 4-bit adder to perform combined adder and subtractor circuit.

## References

1. Digilent Reference. [Nexys A7 Reference Manual](https://digilent.com/reference/programmable-logic/nexys-a7/reference-manual)

2. Satvik Ramaprasad. [Full adder from 2 half adders](https://circuitverse.org/users/3/projects/247)

3. Tomas Fryza. [Template for binary adder](https://www.edaplayground.com/x/Vdpu)

4. Ishaan. [Ripple Carry Adder](https://circuitfever.com/ripple-carry-adder)

5. Digilent. [General .xdc file for the Nexys A7-50T](https://github.com/Digilent/digilent-xdc/blob/master/Nexys-A7-50T-Master.xdc)
