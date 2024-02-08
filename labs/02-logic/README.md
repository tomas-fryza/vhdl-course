# Lab 2: Combinational logic

* [Pre-Lab preparation](#preparation)
* [Part 1: Logic function minimization](#part1)
* [Part 2: Binary comparator in VHDL language](#part2)
* [Part 4: Assertion statements in VHDL testbench](#part4)
* [Experiments on your own](#experiments)
* [Post-Lab report](#report)
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

   * Project name: `comparator`
   * Project location: your working folder, such as `Documents`
   * Project type: **RTL Project**
   * Create a new VHDL source file: `comparator_2it`
   * Do not add any constraints now
   * Choose a default board: `Nexys A7-50T` (will be used later in the lab)
   * Click **Finish** to create the project
   * Define I/O ports of new module:
      * Port name: `a`, Direction: `in`, Bus: `check`, MSB: `1`, LSB: `0`
      * `b`, `in`, Bus: `check`, MSB: `1`, LSB: `0`
      * `b_greater_`, `out`
      * `b_a_equal`, `out`
      * `a_greater`, `out`

TBD




1. Log in to your [EDA Playground](https://www.edaplayground.com/login) account, open [template](https://www.edaplayground.com/x/5uu3) project, use **Copy** button, and **Save** the project under a different name.

2. In VHDL, define an [entity](https://github.com/tomas-fryza/digital-electronics-1/wiki/Entity) for a 2-bit binary comparator (`comparator_2bit`) according to the following table.

   | **Port name** | **Direction** | **Type** | **Description** |
   | :-: | :-: | :-- | :-- |
   | `b`       | input  | [`std_logic_vector(1 downto 0)`](https://github.com/tomas-fryza/digital-electronics-1/wiki/Data-types) | Input data b[1:0] |
   | `a`       | input  | `std_logic_vector(1 downto 0)` | Input data a[1:0] |
   | `b_greater` | output | `std_logic` | Output is `1` if b > a |
   | `b_a_equal` | output | `std_logic` | Output is `1` if b = a |
   | `a_greater` | output | `std_logic` | Output is `1` if b < a |

3. In VHDL, define an [architecture](https://github.com/tomas-fryza/digital-electronics-1/wiki/Architecture) for a 2-bit binary comparator. The combination logic can be written using low-level operators (`and`, `or`, etc.) as in the previous laboratory exercise. However, it is more efficient to use a higher notation with [signal assignments](https://github.com/tomas-fryza/digital-electronics-1/wiki/Signal-assignments). Use the **conditional signal assignment** `when`,`else` (outside process) to describe the three output functions, such as:

   ```vhdl
      a_greater <= '1' when (b < a) else
                   '0';
   ```

   Write all three functions in signal-assignments style and one function also with low-level operators.

<a name="part4"></a>

## Part 4: Assertion statements in VHDL testbench

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

2. When you finish, always synchronize the contents of your working folder with the local and remote versions of your repository. This way you are sure that you will not lose any of your changes. To do that, use git commands to add, commit, and push all local changes to your remote repository. Check GitHub web page for changes.

   > **Help:** Useful git commands are `git status` - Get state of working directory and staging area. `git add` - Add new and modified files to the staging area. `git commit` - Record changes to the local repository. `git push` - Push changes to remote repository. `git pull` - Update local repository and working folder. Note that, a brief description of useful git commands can be found [here](https://github.com/tomas-fryza/digital-electronics-1/wiki/Useful-Git-commands) and detailed description of all commands is [here](https://github.com/joshnh/Git-Commands).

<a name="experiments"></a>

## Experiments on your own

1. In EDA Playground, define entity and architecture for a 4-bit binary comparator (`comparator_4bit`).

   | **Port name** | **Direction** | **Type** | **Description** |
   | :-: | :-: | :-- | :-- |
   | `b`       | input  | `std_logic_vector(3 downto 0)` | Input data b[3:0] |
   | `a`       | input  | `std_logic_vector(3 downto 0)` | Input data a[3:0] |
   | `b_greater` | output | `std_logic` | Output is `1` if b > a |
   | `b_a_equal` | output | `std_logic` | Output is `1` if b = a |
   | `a_greater` | output | `std_logic` | Output is `1` if b < a |

2. In VHDL, define a testbench for a 4-bit binary comparator and verify several input combinations. Make one intentional mistake when automatically verifying expected values using the `assert` command.

<a name="report"></a>

## Post-Lab report

*Complete all parts of `02-logic/README.md` file (see Part 1.3) in Czech, Slovak, or English, push it to your GitHub repository, and submit a link to this file via [BUT e-learning](https://moodle.vutbr.cz/). The deadline for submitting the task is the day before the next lab, i.e. in one week.*

*Vypracujte všechny části ze souboru `02-logic/README.md` (viz Část 1.3) v českém, slovenském, nebo anglickém jazyce, uložte je na váš GitHub repozitář a odevzdejte link na tento soubor prostřednictvím [e-learningu VUT](https://moodle.vutbr.cz/). Termín odevzdání úkolu je den před dalším počítačovým cvičením, tj. za jeden týden.*

<a name="references"></a>

## References

1. Eric Coates. [Karnaugh Maps](https://learnabout-electronics.org/Digital/dig24.php)

2. Tomas Fryza. [Example of 2-bit binary comparator using the when/else assignments](https://www.edaplayground.com/x/5uu3)
