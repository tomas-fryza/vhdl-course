# Digital electronics

![Logo](logolink_eng.jpg)

<p align="center">
  The Study of Modern and Developing Engineering BUT<br>
  CZ.02.2.69/0.0/0.0/18_056/0013325
</p>


The repository contains VHDL lab exercises for bachelor course [*Digital Electronics*](https://www.vutbr.cz/en/students/courses/detail/224131) at Brno University of Technology, Czechia.


## Exercises

### EDA Playground

1. [Introduction to Git and VHDL](Labs/01-gates)
2. [Combinational logic](Labs/02-logic)

### Vivado

3. [Introduction to Vivado](Labs/03-vivado)
4. [Seven-segment display decoder](Labs/04-segment)
5. [Binary counter](Labs/05-counter)
6. [Driver for multiple seven-segment displays](Labs/06-display_driver)
7. [Latches and Flip-flops](Labs/07-ffs)
8. [Traffic light controller](Labs/08-traffic_lights)

### VHDL project

9.-13. [General instructions](Labs/project)


## Materials

The following hardware and software components are mainly used in the lab.

### Hardware

* [Nexys A7 Artix-7](https://store.digilentinc.com/nexys-a7-fpga-trainer-board-recommended-for-ece-curriculum/) FPGA Trainer Board: [reference manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual), [schematic](Docs/nexys-a7-sch.pdf), XC7A50T-1CSG324C [FPGA](Docs/ds180_7Series_Overview.pdf), [Nexys-A7-50T-Master.xdc](https://github.com/Digilent/digilent-xdc/blob/master/Nexys-A7-50T-Master.xdc)
* Oscilloscope Keysight Technologies [DSOX3034T](https://www.keysight.com/en/pdx-x202175-pn-DSOX3034T/oscilloscope-350-mhz-4-analog-channels?&cc=CZ&lc=eng) (350 MHz, 4 analog channels), including 16 logic timing channels [DSOXT3MSO](https://www.keysight.com/en/pdx-x205238-pn-DSOXT3MSO/3000t-x-series-oscilloscope-mso-upgrade?cc=CZ&lc=eng) and serial protocol triggering and decode options [D3000BDLA](https://www.keysight.com/en/pd-2990560-pn-D3000BDLA/ultimate-software-bundle-for-the-3000a-t-x-series?&cc=CZ&lc=eng)

### Software

* [EDA Playground](https://www.edaplayground.com/)
* [Vivado](https://www.xilinx.com/products/design-tools/vivado.html) Design Suite 2020.1: [installation](https://github.com/tomas-fryza/Digital-electronics-1/wiki)
* [git](https://git-scm.com/)


## References

1. [ES 4 VHDL reference sheet](Docs/vhdl_cheatsheet.pdf)
2. [Digital electronics 1 wiki](https://github.com/tomas-fryza/Digital-electronics-1/wiki)
3. ASHENDEN, Peter J. *The designer's guide to VHDL.* 3rd ed. Boston: Morgan Kaufmann Publishers, c2008. ISBN 978-0-12-088785-9.
4. CHU, Pong P. *FPGA prototyping by VHDL examples.* Hoboken, N.J.: Wiley-Interscience, c2008. ISBN 978-0-470-18531-5.
5. MANO, M. Morris. Digital Design: With an Introduction to the Verilog, HDL, VHDL, and System Verilog. Pearson, 6th edition, 2018. ISBN-13: 978-1292231167.
6. KALLSTROM, P. [A Fairly Small VHDL Guide](Docs/VHDL_guide.pdf). Version 2.1.
7. [GitHub GIT CHEAT SHEET](Docs/git_cheatsheet.pdf)
