# VHDL project

### Topics

*Topics will be presented one week before the project starts.*

## Instructions

The objective of this group project is to collaborate within small teams of 3-4 students, explore a chosen topic, utilize lab components, develop innovative solutions, simulate and execute these solutions, generate project documentation, and present the final outcomes. Team members are responsible for organizing and assigning roles and tasks among themselves.

* Students will work on the project in the lab during Weeks 8 to 12 (or 13) of the semester, culminating in a practical demonstration.

* Students must submit a link to their GitHub repository containing the VHDL project, required images, documents, and a descriptive README file. The submission deadline is the day before the practical demonstration.

* All FPGA code must be written in VHDL and must be implementable on the Nexys A7-50T board using the development tools provided during the semester, specifically Vivado.

* Use components designed and tested during the semester.

* Follow ethical rules regarding plagiarism, licensing, and policies for the use of [generative artificial intelligence](https://www.vut.cz/vut/aktuality-f19528/vut-vydalo-zasady-a-doporuceni-k-vyuzivani-generativni-umele-inteligence-d247152).

* Provide detailed simulation testbenches for all your new components.

* Physical implementation on FPGA is necessary, not just computer simulation.

* Teams should create a short video (<1 min.) demonstrating their application. This video can be used to promote the course on LinkedIn.

## Help

* **Never, ever** use `rising_edge` or `falling_edge` to test edges of non-clock signals under any circumstances!

* Use hierarchical design, ie. instances, top-level, several files, etc.

* Use synchronous entities with rising `clk`.

* In a synchronous process, the first thing to do is the test of clock edge, then synchronous reset. The only exception is asynchronous operations (try to avoid them).

* Use only input `in` or output `out` ports and not ~~inout~~.

* Use `wait` statements [only in simulations](https://www.vhdl-online.de/courses/system_design/vhdl_language_and_syntax/sequential_statements/wait_statement).

* Except Vivado, you can use the following tools to simulate your VHDL design(s):
   * [EDA Playground](https://www.edaplayground.com/)
   * [TerosHDL](https://github.com/tomas-fryza/vhdl-course/wiki/How-to-install-TerosHDL-on-Windows-and-Linux)
   * [ghdl + GtkWave](https://github.com/tomas-fryza/vhdl-course/wiki/How-to-install-ghdl-on-Windows-and-Linux)
   * [ModelSim](https://www.intel.com/content/www/us/en/software-kit/750666/modelsim-intel-fpgas-standard-edition-software-version-20-1-1.html)

# Recommended README.md file structure

### Team members

* Member 1 (responsible for ...)
* Member 2 (responsible for ...)
* Member 3 (responsible for ...)
* Member 4 (responsible for ...)

## Theoretical description and explanation

Enter a description of the problem and how to solve it.

## Hardware description of demo application

Insert descriptive text and schematic(s) of your implementation.

## Software description

Put flowchats/state diagrams of your algorithm(s) and direct links to source/testbench files in `src` and `sim` folders. 

### Component(s) simulation

Write descriptive text and put simulation screenshots of your components.

## Instructions

Write an instruction manual for your application, including photos and a link to a short app video.

## References

1. Put here all references to sources and tools you used.
2. ...
