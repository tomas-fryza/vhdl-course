# Lab 3: Introduction to Vivado

<!--
![Logo](../../logolink_eng.jpg)
<p align="center">
  The Study of Modern and Developing Engineering BUT<br>
  CZ.02.2.69/0.0/0.0/18_056/0013325
</p>
-->

### Learning objectives

After completing this lab you will be able to:

* Use Vivado development tool
* Compile and implement application for Nexys A7 Artix-7 board
* Use LEDs and switches

The purpose of this laboratory exercise is to learn to use Vivado to create a simple HDL design targeting Nexys A7 Artix-7 FPGA Trainer Board.

### Table of contents

* [Preparation tasks](#preparation)
* [Part 1: Synchronize Git and create a new folder](#part1)
* [Part 2: Project creation in Vivado](#part2)
* [Part 3: Multiplexer](#part3)
* [Experiments on your own](#experiments)
* [Lab assignment](#assignment)
* [References](#references)

<a name="preparation"></a>

## Preparation tasks (done before the lab at home)

The Nexys A7 board provides sixteen switches and LEDs. The switches can be used to provide inputs, and the LEDs can be used as output devices.

1. See [schematic](https://github.com/tomas-fryza/digital-electronics-1/blob/master/docs/nexys-a7-sch.pdf) or [reference manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual) of the Nexys A7 board and find out the connection of slide switches and LEDs, ie to which FPGA pins are connected and how. Draw the schematic with LEDs and switches.

2. **Optional task:** Follow the instructions for [Windows or Linux](https://github.com/tomas-fryza/digital-electronics-1/wiki/List-of-versions), download and install Vivado Design Suite. *Note: The online EDA Playground tool can still be used to simulate designs without implementation in the target hardware.*

<a name="part1"></a>

## Part 1: Synchronize Git and create a new folder

1. Run Git Bash (Windows) of Terminal (Linux), navigate to your working directory, and update local repository.

   > Useful bash and git commands are: `cd` - Change working directory. `mkdir` - Create directory. `ls` - List information about files in the current directory. `pwd` - Print the name of the current working directory. `git status` - Get state of working directory and staging area. `git pull` - Update local repository and working folder.
   >

2. Create a new working folder `labs/03-vivado` for this exercise.

3. Create a new file `labs/03-vivado/assignment.md` and copy/paste [assignment template](https://raw.githubusercontent.com/tomas-fryza/digital-electronics-1/master/labs/03-vivado/assignment.md) into it.

<a name="part2"></a>

## Part 2: Project creation in Vivado

1. Run Vivado and create a new project:

   * Project name: `comparator`
   * Project location: your `labs/03-vivado` working folder
   * Project type: **RTL Project**
   * Create a new VHDL source file: `comparator_4bit` (the same filename as the entity)
   * Created a new constraints XDC file: `nexys-a7-50t`
   * Choose a default board: `Nexys A7-50T`

2. Copy/paste your EDA Playground `design.vhd` code from the previous assignment (or use this [unfinished template](https://www.edaplayground.com/x/5uu3)) to `comparator_4bit.vhd` source file.

3. Use **File** > **Add Sources Alt+A** > **Add or create simulation sources** and create a new VHDL file `tb_comparator_4bit` (same filename as tested entity with prefix `tb_`). Copy/pase your EDA Playground `testbench.vhd` code from previous assignment to `tb_comparator_4bit.vhd` file.

4. Use **Flow** > **Run Simulation** > **Run Behavioral Simulation** and run Vivado simulator.

   > To cleanup generated files, close simulation window, right click to SIMULATION or Run Simulation option, and select **Reset Behavioral Simulation**.
   >
   > ![Reset simulation](images/screenshot_vivado_reset_simul.png)
   >

5. Use **Flow** > **Open Elaborated design** and see the schematic after RTL analysis. Note that RTL (Register Transfer Level) represents digital circuit at the abstract level.

6. The Nexys A7 board have hardwired connections between FPGA chip and the switches and LEDs. To use these devices it is necessary to include in your project the correct pin assignments. Copy/paste default constraints from [Nexys-A7-50T-Master.xdc](https://raw.githubusercontent.com/Digilent/digilent-xdc/master/Nexys-A7-50T-Master.xdc) to `nexys-a7-50t.xdc` file. The pin assignments in the file are useful only if the pin names that appear in this file are exactly the same as the port names used in your VHDL entity.

   Use any 4 switches for inputs `a_i[0]`, ..., `a_i[3]`, other 4 switches for `b_i[0]`, ..., `b_i[3]`, and 3 LEDs for logic functions `B_less_A_o`, `B_equals_A_o`, and `B_greater_A_o`.

7. Implement your design to Nexys A7 board:

   * Use **Flow > Generate Bitstream** (the process is time consuming and can take tens of seconds)
   * Select **Open Hardware Manager**
   * Click on **Open Target > Auto Connect** (make sure Nexys A7 board is connected and switched on)
   * Click on **Program device** and select generated bitstream `YOUR_FOLDER/comparator/comparator.runs/impl_1/comparator_4bit.bit`
   * Test the functionality by toggling the switches and observing LEDs

<a name="part3"></a>

## Part 3: Multiplexer

A multiplexer (MUX) is a device that has multiple inputs and a single line output. The select lines determine which input is connected to the output. Consider a circuit in which the 3-bit output `f_o[2:0]` has to be selected from four 3-bit inputs `a_i[2:0]`, `b_i[2:0]`, `c_i[2:0]`, and `d_i[2:0]`. The circuit uses a 2-bit select input `sel_i[1:0]` and implements the following truth table.

   | **Select sel_i[1:0]** | **Output f_o[2:0]** |
   | :-: | :-: |
   | `0 0` | `a_i[2:0]` |
   | `0 1` | `b_i[2:0]` |
   | `1 0` | `c_i[2:0]` |
   | `1 1` | `d_i[2:0]` |

<!--
   ![Circuit symbol for two-bit wide 4-to-1 multiplexer](images/mux_4to1.png)
-->

1. Perform the following steps to implement the three-bit wide 4-to-1 multiplexer.

   1. Create a new Vivado RTL project `multiplexer` in your `labs/03-vivado` working folder.
   2. Create a VHDL source file `mux_3bit_4to1` for the three-bit wide 4-to-1 multiplexer and define an entity `mux_3bit_4to1`.
   3. Choose default board: `Nexys A7-50T`.
   4. Define a VHDL architecture using the [conditional signal assignment](https://github.com/tomas-fryza/digital-electronics-1/wiki/Signal-assignments) `when`, `else` (outside process).
   5. Create a VHDL testbench `tb_mux_3bit_4to1` and simulate the circuit.
   6. Make pin assignments for the Nexys A7 board in `nexys-a7-50t.xdc`.
   7. Compile the project and download the generated bitstream `YOUR_FOLDER/multiplexer/multiplexer.runs/impl_1/mux_3bit_4to1.bit` into the FPGA chip.
   8. Test the functionality by toggling the switches and observing the LEDs.

<!--
   ![Screenshot of Vivado](images/screenshot_vivado.png)
-->

## Synchronize repositories

When you finish working, always synchronize the contents of your working folder with the local and remote versions of your repository. This way you are sure that you will not lose any of your changes.

   > Useful git commands are: `git status` - Get state of working directory and staging area. `git add` - Add new and modified files to the staging area. `git commit` - Record changes to the local repository. `git push` - Push changes to remote repository. `git pull` - Update local repository and working folder. Note that, a brief description of useful git commands can be found [here](https://github.com/tomas-fryza/digital-electronics-1/wiki/Useful-Git-commands) and detailed description of all commands is [here](https://github.com/joshnh/Git-Commands).
   >

<a name="experiments"></a>

## Experiments on your own

1. Create your own tutorial for Vivado design flow.

<a name="assignment"></a>

## Lab assignment

*Copy the [assignment template](assignment.md) to your GitHub repository. Complete all parts of this file in Czech, Slovak, or English and submit a link to it via [BUT e-learning](https://moodle.vutbr.cz/). The deadline for submitting the task is the day before the next computer exercise.*

*Vložte [šablonu úkolu](assignment.md) do vašeho GitHub repozitáře. Vypracujte všechny části z tohoto souboru v českém, slovenském, nebo anglickém jazyce a odevzdejte link na něj prostřednictvím [e-learningu VUT](https://moodle.vutbr.cz/). Termín odevzdání úkolu je den před dalším počítačovým cvičením.*

<a name="references"></a>

## References

1. Digilent blog. [Nexys A7 Reference Manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual)

2. Digilent blog. [Creating and Programming our First FPGA Project Part 2: Initial Project Creation](https://blog.digilentinc.com/creating-and-programming-our-first-fpga-project-part-2-initial-project-creation/)

3. Tomas Fryza. [Example of 2-bit binary comparator using the when/else assignments](https://www.edaplayground.com/x/5uu3)

4. Digilent. [General .xdc file for the Nexys A7-50T](https://github.com/Digilent/digilent-xdc/blob/master/Nexys-A7-50T-Master.xdc)

5. Digilent blog. [Creating and Programming our First FPGA Project Part 4](https://blog.digilentinc.com/creating-and-programming-our-first-fpga-project-part-4/)

6. DesignSpark. [Implement a simple digital circuit through FPGA trainer board and in Xilinx Vivado IDE (VHDL)](https://www.rs-online.com/designspark/lab1-vhdl)
