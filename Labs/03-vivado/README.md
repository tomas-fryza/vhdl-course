# Lab 3: Introduction to Vivado

### Learning objectives

The purpose of this laboratory exercise is to learn to use Vivado to create a simple HDL design targeting Nexys A7 Artix-7 FPGA Trainer Board.


## Preparation tasks (done before the lab at home)

See schematic or reference manual of the Nexys A7 board and find out the connection of LEDs and slide switches.

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;


## Part 1: Synchronize Git and create a new folder

Open a Linux terminal, use `cd` commands to change path to your Digital-electronics-1 working directory, and [synchronize the contents](https://github.com/joshnh/Git-Commands) with GitHub.

```bash
$ pwd
/home/lab661
$ cd Documents/your-name/Digital-electronics-1/
$ pwd
/home/lab661/Documents/your-name/Digital-electronics-1
$ git pull
```

Create a new folder `Labs/03-vivado`

```bash
$ cd Labs/
$ mkdir 03-vivado
$ cd 03-vivado/
$ touch README.md
$ ls
README.md
```


## Part 2: Project creation in Vivado

Get inspired by the [Creating and Programming our First FPGA Project Part 2: Initial Project Creation](https://blog.digilentinc.com/creating-and-programming-our-first-fpga-project-part-2-initial-project-creation/) tutorial and create a new project in Vivado. Unlike the instructions, let your project contains:

   * VHDL source file: `comparator_2bit`
   * Created constraints XDC file: `nexys-a7-50t`
   * Default board : `Nexys A7-50T`

Copy/paste your EDA Playground `design.vhd` code from the previous exercise to `comparator_2bit.vhd` source file.

Copy/paste constraints from [Nexys-A7-50T-Master.xdc](https://github.com/Digilent/digilent-xdc) to `nexys-a7-50t.xdc` file.

Use **Add Sources** > **Add or create simulation sources** and create a new VHDL file `tb_comparator_2bit`. Copy/pase your EDA Playground `testbench.vhd` code from previous exercise to `tb_comparator_2bit.vhd` file.

Use **SIMULATION** > **Run Simulation** > **Run Behavioral Simulation** and run Vivado simulator.

Get inspired by the [Creating and Programming our First FPGA Project Part 4](https://blog.digilentinc.com/creating-and-programming-our-first-fpga-project-part-4/) tutorial, compile and download circuit into the FPGA chip.


## Part 3: Multiplexer in VHDL language

TBD: mux description.

Perform the following steps to implement the two-bit wide 4-to-1 multiplexer. Take screenshots and make your own README tutorial on how to create a Vivado project, how to run a simulation and how to program an FPGA on board Nexys A7.

   1. Create a new Vivado project for your circuit.
   2. Create a VHDL entity `mux_2bit_4to1` for the two-bit wide 4-to-1 multiplexer. 
   3. Create a testbench and simulate the circuit. 
   4. Make pin assignments for the Nexys A7 board: connect mux select inputs to switches SW[15:14] and use switches SW[7:0] to provide the four inputs A to D. Connect output F[1:0] to leds LD[15:14].
   5. Compile the project and download the compiled circuit into the FPGA chip.
   6. Test the functionality of the two-bit wide 4-to-1 multiplexer by toggling the switches and observing the LEDs.


## Synchronize git

Use `cd ..` command in Linux console terminal and change the working directory to `Digital-electronics-1`. Then use [git commands](https://github.com/joshnh/Git-Commands) to add, commit, and push all local changes to your remote repository. Check the repository at GitHub web page for changes.

```bash
$ pwd
/home/lab661/Documents/your-name/Digital-electronics-1/Labs/03-vivado

$ cd ..
$ cd ..
$ pwd
/home/lab661/Documents/your-name/Digital-electronics-1

$ git status
$ git add <your-modified-files>
$ git status
$ git commit -m "[LAB] Creating 03-vivado lab"
$ git status
$ git push
$ git status
```


## Experiments on your own

1. Complete your own tutorial for Vivado design flow in `Labs/03-vivado/README.md` file.


## Lab assignment

1. A Vivado tutorial. Submit:
    * VHDL code of two-bit wide 4-to-1 multiplexer (`mux_2bit_4to1.vhd`),
    * link to your README file with Vivado tutorial.

The deadline for submitting the assignment is before the start of the next laboratory exercise. Use [BUT e-learning](https://moodle.vutbr.cz/) web page and submit a single PDF file.
