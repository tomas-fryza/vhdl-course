# VHDL project

### Topics

*Topics will be presented one week before the project starts.*

## Instructions

The objective of this group project is to collaborate within small teams (3-4 students), explore a chosen topic, use labs's components, develop innovative solutions, simulate and execute these solutions, generate project documentation, and present the final outcomes. Team members are responsible for organizing and assigning roles and tasks among themselves.

* Students will work on a project **in the labs** during the 9th to 13th weeks of the semester, with the practical demonstration scheduled for the last week.

* Using BUT e-learning, students should submit a link to the GitHub repository containing the VHDL project, required images, documents, and a descriptive README file. **The submission deadline is the day before the demonstration.**

* The FPGA codes must be written in VHDL and must be implementable on the Nexys A7-50T board using the development tools provided during the semester, specificallly Vivado.

* Create testbenches for all your new components.

* Physical implementation on FPGA is necessary, not just computer simulation.

* Make a short video of your app demo. (The video can then be used to promote the course at LinkedIn.)

## Help

* **Never, ever** use `rising_edge` or `falling_edge` to test edges of non-clock signals under any circumstances!

* Use hierarchical design, ie. instances, top-level, several files, etc.

* Use synchronous entities with `clk`.

* In a synchronous process, the first thing to do is test the clock edge, then synchronous reset. The only exception is asynchronous operations.

* Use only input `in` or output `out` ports and not ~~inout~~.

* Use `wait` statements [only in simulations](https://www.vhdl-online.de/courses/system_design/vhdl_language_and_syntax/sequential_statements/wait_statement).

* Except Vivado, you can use the following tools to simulate your VHDL design(s):
  * [EDA Playground](https://www.edaplayground.com/)
  * [TerosHDL](https://github.com/tomas-fryza/vhdl-course/wiki/How-to-install-TerosHDL-on-Windows-and-Linux)
  * [ghdl + GtkWave](https://github.com/tomas-fryza/vhdl-course/wiki/How-to-install-ghdl-on-Windows-and-Linux)

# Recommended README.md file structure

### Team members

* Member 1 (responsible for ...)
* Member 2 (responsible for ...)
* Member 3 (responsible for ...)

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

1. Put here the references you used.
2. ...
