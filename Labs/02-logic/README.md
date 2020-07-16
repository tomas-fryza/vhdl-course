# Lab 2: Combinational logic

### Learning objectives

The purpose of this laboratory exercise is to learn to use different ways of writing combination functions (truth table, K-map, SoP/PoS forms), their minimization, the use of signal assignments in VHDL, and assertion statements in VHDL testbench.


## Preparation tasks (done before the lab at home)

*Digital* or *Binary comparator* compares the digital signals A, B presented at input terminal and produce outputs depending upon the condition of those inputs. Complete the truth table for 2-bit *Identity comparator* (B equals A), and two *Magnitude comparators* (B greater than A, B less than A). Note that, such a digital device has four inputs and three outputs/functions.

| **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B greater than A** | **B equals A** | **B less than A** |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0 0 | 0 0 | 0 | 1 | 0 |
| 1 | 0 0 | 0 1 | 0 | 0 | 1 |
| 2 | 0 0 | 1 0 | 0 | 0 | 1 |
| 3 | 0 0 | 1 1 | 0 | 0 | 1 |
| 4 | 0 1 | 0 0 |  |  |  |
| 5 | 0 1 | 0 1 |  |  |  |
| 6 | 0 1 | 1 0 |  |  |  |
| 7 | 0 1 | 1 1 |  |  |  |
| 8 |  |  |  |  |  |
| 9 |  |  |  |  |  |
| 10 |  |  |  |  |  |
| 11 |  |  |  |  |  |
| 12 |  |  |  |  |  |
| 13 |  |  |  |  |  |
| 14 | 1 1 | 1 0 |  |  |  |
| 15 | 1 1 | 1 1 |  |  |  |

According to the truth table, write canonical SoP (Sum of Products) and PoS (Product of Sums) forms for "equals" and "less than" functions:

![Binary comparator functions](Images/comparator.png)


## Part 1: Logic function minimization

*[Karnaugh Maps](https://learnabout-electronics.org/Digital/dig24.php) (or K-maps) offer a graphical method of reducing a digital circuit to its minimum number of gates. The map is a simple table containing 1s and 0s that can express a truth table or complex Boolean expression describing the operation of a digital circuit.*

The K-map for the "equals" function is as follows:

![Karnaugh map for "equals" function](Images/kmap_equals.png)


Create K-maps for other two functions.

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

Use K-maps to create a simplified SoP form of the "greater than" function and a PoS form of the "less than" function.

![Binary comparator simplified functions](Images/comparator_min.png)

 
## Part 2: Synchronize Git and create a new folder

Open a Linux terminal, use `cd` commands to change path to your Digital-electronics-1 working directory, and [synchronize the contents](https://github.com/joshnh/Git-Commands) with GitHub.

```bash
$ pwd
/home/lab661
$ cd Documents/your-name/Digital-electronics-1/
$ pwd
/home/lab661/Documents/your-name/Digital-electronics-1
$ git pull
```

Create a new folder `Labs/02-logic`

```bash
$ cd Labs/
$ mkdir 02-logic
$ cd 02-logic/
$ touch README.md
$ ls
README.md
```


## Part 3: Binary comparator in VHDL language

Log in to your [EDA Playground](https://www.edaplayground.com/login) account and create a new project: you can copy your previous playground and save it under a different name.

In VHDL, define an [entity](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Entity) for a 2-bit binary comparator.

| **Name** | **Direction** | **Description** |
| :-- | :-: | :-- |
| `a_i`       | input  | 2-bit [vector](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Data-types) |
| `b_i`       | input  | 2-bit vector |
| `greater_o` | output | B is greater than A |
| `equals_o`  | output | B equals A |
| `less_o`    | output | B is less than A |

In VHDL, define an [architecture](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Architecture) for a 2-bit binary comparator. The combination logic can be written using low-level operators (`and`, `or`, etc.) as in the previous laboratory exercise. However, it is more efficient to use a higher notation with [signal assignments](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Signal-assignments). Use the assignment `when`,` else` to describe the three output functions, such as:

```vhdl
greater_o <= '1' when (b_i > a_i) else
             '0';
```


## Part 4: Assertion statements in VHDL testbench

You can write any information to the console using the report statement. The basic syntax in VHDL is:

```vhdl
report <message_string> [severity <severity_level>];
```

where possible values for `severity_level` are: `note`, `warning`, `error`, `failure`. If the severity level is omitted, then the default value is `note`.

An assertion statement checks that a specified condition is true and reports an error if it is not. It is combined with a report statement as follows:

```vhdl
assert (<condition>)
    report <message_string>
    [severity <severity_level>];
```

The message is displayed to the console when the condition is NOT met, therefore the message should be an opposite to the condition.

```vhdl
------------------------------------------------------------
-- Data generation process
------------------------------------------------------------
p_stimulus : process
begin
    report "Stimulus process started" severity note;

    s_b <= "00";
    s_a <= "00";
    wait for 100 ns;
    assert ((s_greater = '0') and (s_equals = '1') and (s_less = '0')) -- Expected output
        -- If false, report an error
        report "Test failed for input combination: 00, 00"
        severity error;


    -- Add other test cases


    report "Stimulus process finished" severity note;
    wait;
end process p_stimulus;
```

In VHDL, write a testbench and verify the correct functionality of the comparator for all input combinations.

Update your local (not GitHub) `README.md` file with a screenshot of the simulation(s) and a link to your public EDA playground.


## Synchronize git

Use `cd ..` command in Linux console terminal and change the working directory to `Digital-electronics-1`. Then use [git commands](https://github.com/joshnh/Git-Commands) to add, commit, and push all local changes to your remote repository. Check the repository at GitHub web page for changes.

```bash
$ pwd
/home/lab661/Documents/your-name/Digital-electronics-1/Labs/02-logic

$ cd ..
$ cd ..
$ pwd
/home/lab661/Documents/your-name/Digital-electronics-1

$ git status
$ git add <your-modified-files>
$ git status
$ git commit -m "[LAB] Creating 02-logic lab"
$ git status
$ git push
$ git status
```


## Experiments on your own

1. In VHDL, define entity and architecture for a 4-bit binary comparator.

   | **Name** | **Direction** | **Description** |
   | :-- | :-: | :-- |
   | `a_i`       | input  | 4-bit vector |
   | `b_i`       | input  | 4-bit vector |
   | `greater_o` | output | B is greater than A |
   | `equals_o`  | output | B equals A |
   | `less_o`    | output | B is less than A |

2. In VHDL, define a testbench for a 4-bit binary comparator. Verify at least ten random input combinations.


## Lab assignment

1. A 4-bit binary comparator. Submit:
    * VHDL code (`design.vhd`),
    * VHDL testbench (`testbench.vhd`),
    * screenshot with simulated time waveforms,
    * link to your public EDA playground.

The deadline for submitting the assignment is before the start of the next laboratory exercise. Use [BUT e-learning](https://moodle.vutbr.cz/) web page and submit a single PDF file.
