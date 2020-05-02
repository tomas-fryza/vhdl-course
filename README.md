
# Digital electronics 1

The repository contains VHDL examples for bachelor course [*Digital Electronics 1*](https://www.vutbr.cz/en/students/courses/detail/210628) at Brno University of Technology, Czechia. In folder `Docs` all manuals are stored. Folder `Docs/Hw` contains KiCad schematic of CPLD expansion board used in the course. All screenshots and images are located in `Images` folder and  computer lab exercises are located in `Labs` folder.

| **Laboratory exercise** | **Description** |
| :-- | :-- |
| [01-gates](Labs/01-gates) | Lab 1: Introduction to digital circuits |
| [02-ise](Labs/02-ise) | Lab 2: Introduction to VHDL and Xilinx ISE |
| [03-segment](Labs/03-segment) | Lab 3: Hexadecimal digit to seven-segment decoder |
| [04-adder](Labs/04-adder) | Lab 4: Binary adder |
| [05-counter_binary](Labs/05-counter_binary) | Lab 5: Binary counter |
| [06-display_driver](Labs/06-display_driver) | Lab 6: Driver for seven-segment display |
| [07-stopwatch](Labs/07-stopwatch) | Lab 7: Stopwatch |
| [08-traffic_lights](Labs/08-traffic_lights) | Lab 8: Traffic light controller |
| [project](Labs/project) | Lab 9-13: Project |


## Materials

The following hardware and software components are mainly used in the lab.

### Hardware

* CoolRunner-II CPLD starter board: [reference manual](Docs/coolrunner-ii_rm.pdf), [schematic](Docs/coolrunner-ii_sch.pdf), [XC2C256-TQ144](Docs/xc2c256_cpld.pdf), [shop](https://store.digilentinc.com/coolrunner-ii-cpld-starter-board-limited-time/)
* Platform Cable USB II, USB tool for in-circuit configuration and programming of all Xilinx devices: [shop](https://www.xilinx.com/products/boards-and-kits/hw-usb-ii-g.html)
* CPLD expansion board by Michal Kubicek: [schematic](Docs/cpld_expansion.pdf)

### Software

* ISE Design, ISE WebPACK Design Software, ver 14.7: [web page](https://www.xilinx.com/products/design-tools/ise-design-suite/ise-webpack.html), [installation](https://github.com/tomas-fryza/Digital-electronics-1/wiki)
* Linux Mint 18.2 "Sonya" - Xfce (64-bit): [web page](https://linuxmint.com/download_all.php)

<img src="Images/coolrunner_board.jpg" alt="CoolRunner-II board" height="300"/> <img src="Images/ise_synthesize_org.png" alt="ISE" height="300"/>


## References

1. [ES 4 VHDL reference sheet](Docs/vhdl_cheatsheet.pdf)
2. [Digital electronics 1 wiki](https://github.com/tomas-fryza/Digital-electronics-1/wiki)
3. ASHENDEN, Peter J. *The designer's guide to VHDL.* 3rd ed. Boston: Morgan Kaufmann Publishers, c2008. ISBN 978-0-12-088785-9.
4. CHU, Pong P. *FPGA prototyping by VHDL examples.* Hoboken, N.J.: Wiley-Interscience, c2008. ISBN 978-0-470-18531-5.
5. KALLSTROM, P. [A Fairly Small VHDL Guide](Docs/VHDL_guide.pdf). Version 2.1.
6. [GitHub GIT CHEAT SHEET](Docs/git_cheatsheet.pdf)


## License

[MIT](https://choosealicense.com/licenses/mit/)

[![university](https://img.shields.io/badge/university-Brno%20University%20of%20Technology-red.svg)](https://www.vutbr.cz/en/)
[![department](https://img.shields.io/badge/department-Dept.%20of%20Radio%20Electronics-blue)](https://www.facebook.com/URELBrno)
