[![university](https://img.shields.io/badge/university-Brno%20University%20of%20Technology-red.svg)](https://www.vutbr.cz/en/)
[![department](https://img.shields.io/badge/department-Dept.%20of%20Radio%20Electronics-blue)](https://www.facebook.com/URELBrno)
[![GitHub](https://img.shields.io/github/license/tomas-fryza/Digital-electronics-1)](https://choosealicense.com/licenses/mit/)
[![activity](https://img.shields.io/github/last-commit/tomas-fryza/Digital-electronics-1)](https://github.com/tomas-fryza/Digital-electronics-1/commits/master)

# Digital electronics 1

#### Contents

1. [Introduction](#Introduction)
2. [Hardware components](#Hardware-components)
3. [Software components](#Software-components)
4. [References](#References)
5. [License](#License)


## Introduction

The repository contains VHDL examples for bachelor course [*Digital Electronics 1*](https://www.vutbr.cz/en/students/courses/detail/210628) at Brno University of Technology, Czechia. In folder `Docs` all manuals are stored. Folder `Docs/Hw` contains KiCad schematic of CPLD expansion board used in the course. All computer lab exercises are located within `Labs` folder and all screenshots and images are located in `Images` folder.

| **Computer lab exercise** | **Description** |
| :-- | :-- |
| [01-gates](Labs/01-gates) | Lab 1: Git version-control system, Online digital circuit simulator |
| [02-ise](Labs/02-ise) | Lab 2: Introduction to Xilinx ISE |
| ... | Lab 3: ... |
| ... | Lab 4: ... |
| ... | Lab 5: ... |
| ... | Lab 6: ... |
| ... | Lab 7: ... |
| ... | Lab 8: ... |
| ... | Lab 9: ... |
| [project](Labs/project) | Lab 10-13: Final project |


## Hardware components

The following hardware components are mainly used in the lab.

| **Component** | **Description** | **Manual** |
| :-: | :-- | :-: |
| [CoolRunner-II](https://store.digilentinc.com/coolrunner-ii-cpld-starter-board-limited-time/) | CoolRunner-II CPLD starter board ([XC2C256-TQ144](Docs/xc2c256_cpld.pdf)) | [Manual](Docs/coolrunner-ii_rm.pdf), [Schematic](Docs/coolrunner-ii_sch.pdf)
| [Platform Cable USB II](https://www.xilinx.com/products/boards-and-kits/hw-usb-ii-g.html) | USB tool for in-circuit configuration and programming of all Xilinx devices |
| CPLD board | CPLD expansion board by Michal Kubicek | [Schematic](Docs/cpld_expansion.pdf)

![cpld](Images/coolrunner_board.jpg)


## Software components

| **Component** | **Description** | **Manual** |
| :-: | :-- | :-: |
| [ISE Design](https://www.xilinx.com/products/design-tools/ise-design-suite/ise-webpack.html) | ISE WebPACK Design Software, ver 14.7 | [Installation](https://github.com/tomas-fryza/Digital-electronics-1/wiki)
| [Linux Mint](https://linuxmint.com/download_all.php) | Linux Mint 18.2 "Sonya" - Xfce (64-bit) |

![ise](Images/ise_synthesize_org.png)


## References

1. [Git, free and open source distributed version control system](https://git-scm.com/)
2. KALLSTROM, P. [A Fairly Small VHDL Guide](Docs/VHDL_guide.pdf). Version 2.1.
3. [Digital electronics 1 wiki](https://github.com/tomas-fryza/Digital-electronics-1/wiki)


## License

[MIT](https://choosealicense.com/licenses/mit/)
