# Lab 3: Introduction to Vivado

<!--
![Logo](../../logolink_eng.jpg)
<p align="center">
  The Study of Modern and Developing Engineering BUT<br>
  CZ.02.2.69/0.0/0.0/18_056/0013325
</p>
-->

![Screenshot of Vivado](images/screenshot_vivado.png)

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

1. See [schematic](https://github.com/tomas-fryza/digital-electronics-1/blob/master/Docs/nexys-a7-sch.pdf) or [reference manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual) of the Nexys A7 board and find out the connection of slide switches and LEDs, ie to which FPGA pins are connected and how.

2. **Optional task:** Follow the instructions for [Windows](https://github.com/tomas-fryza/digital-electronics-1/wiki/How-to-Install-Vivado-2020.2-on-Windows) or [Linux](https://github.com/tomas-fryza/digital-electronics-1/wiki/How-to-Install-Vivado-2020.1-on-Linux), download and install Vivado Design Suite. See known issues and recommendations at the end of [this file](https://github.com/tomas-fryza/digital-electronics-1/wiki/How-to-Install-Vivado-2020.2-on-Windows).

<a name="part1"></a>

## Part 1: Synchronize Git and create a new folder

1. Run Git Bash (Windows) of Terminal (Linux), navigate to your working directory, and update local repository.

  ```bash
  ## Windows Git Bash:
  $ cd d:/Documents/
  $ cd your-name/
  $ ls
  digital-electronics-1/
  $ cd digital-electronics-1/
  $ git pull

  ## Linux:
  $ cd
  $ cd Documents/
  $ cd your-name/
  $ ls
  digital-electronics-1/
  $ cd digital-electronics-1/
  $ git pull
  ```

2. Create a new working folder `labs/03-vivado` for this exercise.

  ```bash
  ## Windows Git Bash or Linux:
  $ cd labs/
  $ mkdir 03-vivado
  ```

<a name="part2"></a>

## Part 2: Project creation in Vivado

1. Get inspired by the [Creating and Programming our First FPGA Project Part 2: Initial Project Creation](https://blog.digilentinc.com/creating-and-programming-our-first-fpga-project-part-2-initial-project-creation/) tutorial and create a new Vivado RTL project `comparator` (Set location to your `labs/03-vivado` working folder). Unlike the instructions, let your project contains:

   * VHDL source file: `comparator_2bit` (the same file name as the entity)
   * Created constraints XDC file: `nexys-a7-50t`
   * Default board: `Nexys A7-50T`

2. Copy/paste your EDA Playground `design.vhd` code from the previous exercise (or use this [unfinished template](https://www.edaplayground.com/x/5uu3)) to `comparator_2bit.vhd` source file.

3. Use **File** > **Add Sources Alt+A** > **Add or create simulation sources** and create a new VHDL file `tb_comparator_2bit` (same filename as tested entity with prefix `tb_`). Copy/pase your EDA Playground `testbench.vhd` code from previous exercise to `tb_comparator_2bit.vhd` file.

4. Use **Flow** > **Run Simulation** > **Run Behavioral Simulation** and run Vivado simulator.

  > **Note:** To cleanup generated files, close simulation window, right click to SIMULATION or Run Simulation option, and select **Reset Behavioral Simulation**.
  >
  > ![Reset simulation](images/screenshot_vivado_reset_simul.png)
  >

5. The Nexys A7 board have hardwired connections between FPGA chip and the switches and LEDs. To use these devices it is necessary to include in your project the correct pin assignments. Copy/paste constraints from [Nexys-A7-50T-Master.xdc](https://github.com/Digilent/digilent-xdc/blob/master/Nexys-A7-50T-Master.xdc) to `nexys-a7-50t.xdc` file. The pin assignments in the file are useful only if the pin names that appear in this file are exactly the same as the port names used in your VHDL entity.

6. Get inspired by the [Creating and Programming our First FPGA Project Part 4](https://blog.digilentinc.com/creating-and-programming-our-first-fpga-project-part-4/) tutorial, compile and download circuit into the FPGA chip.

<a name="part3"></a>

## Part 3: Multiplexer

A multiplexer (MUX) is a device that has multiple inputs and a single line output. The select lines determine which input is connected to the output. Consider a circuit in which the 2-bit output f_o[1:0] has to be selected from four 2-bit inputs a_i[1:0], b_i[1:0], c_i[1:0], and d_i[1:0]. The circuit uses a 2-bit select input sel_i[1:0] and implements the following truth table.

  | **Select sel_i[1:0]** | **Output f_o[1:0]** |
  | :-: | :-: |
  | 0 0 | a_i[1:0] |
  | 0 1 | b_i[1:0] |
  | 1 0 | c_i[1:0] |
  | 1 1 | d_i[1:0] |

  ![Circuit symbol for two-bit wide 4-to-1 multiplexer](images/mux_4to1.png)

1. Perform the following steps to implement the two-bit wide 4-to-1 multiplexer. Take screenshots and make your own README tutorial on how to create a Vivado project, how to run a simulation and how to program an FPGA on board Nexys A7.

   1. Create a new Vivado RTL project `multiplexer` in your `labs/03-vivado` working folder.
   2. Create a VHDL source file `mux_2bit_4to1` for the two-bit wide 4-to-1 multiplexer and define an entity `mux_2bit_4to1`.
   3. Define a VHDL architecture using the [conditional signal assignment](https://github.com/tomas-fryza/digital-electronics-1/wiki/Signal-assignments) `when`, `else` (outside process).
   4. Create a VHDL testbench `tb_mux_2bit_4to1` and simulate the circuit.
   5. Make pin assignments for the Nexys A7 board in `nexys-a7-50t.xdc`: connect mux select inputs sel_i[1:0] to slide switches SW[15:14] and use switches SW[7:0] to provide the four inputs a_i[1:0] to d_i[1:0]. Connect output f_o[1:0] to LEDs LD[15:14].
   6. Compile the project and download the generated bitstream `multiplexer/multiplexer.runs/impl_1/mux_2bit_4to1.bit` into the FPGA chip.
   7. Test the functionality of the two-bit wide 4-to-1 multiplexer by toggling the switches and observing the LEDs.

## Synchronize repositories

Use [git commands](https://github.com/tomas-fryza/digital-electronics-1/wiki/Useful-Git-commands) to add, commit, and push all local changes to your remote repository. Check the repository at GitHub web page for changes.

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
