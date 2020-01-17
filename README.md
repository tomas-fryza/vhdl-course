# Digital-electronics-1

#### Table of contents

1. [Introduction](#introduction)
2. [Hardware components](#hardware-components)
3. [Software components](#software-components)
4. [References](#references)


## Introduction

The repository contains VHDL examples for bachelor course *Digital Electronics 1* ([Summer 2019/2020](https://www.vutbr.cz/en/students/courses/detail/210628)) at Brno University of Technology, Czechia.

In folder `Docs` all manuals are stored. Folder `Hw` contains KiCad schematic of CPLD expansion board used in the course. All examples are located within `Labs` and all screenshots and images are located in `Images` folder.

| **Lab exercise** | **Description** |
| :-- | :-- |
| [01-gates](Labs/01-gates) | Lab 1: Git version-control system, Online simulator |


## Hardware components

The following hardware components are mainly used in the lab.

| **Component** | **Description** | **Manual** |
| :-: | :-- | :-: |
| [CoolRunner-II](https://store.digilentinc.com/coolrunner-ii-cpld-starter-board-limited-time/) | CoolRunner-II CPLD starter board | [Manual](docs/coolrunner-ii_rm.pdf), [Schematic](docs/coolrunner-ii_sch.pdf)
| [Platform Cable USB II](https://www.xilinx.com/products/boards-and-kits/hw-usb-ii-g.html) | USB tool for in-circuit configuration and programming of all Xilinx devices |
| CPLD board | CPLD expansion board by Michal Kubicek | [Schematic](hw/cpld_expansion.pdf)

![cpld](images/coolrunner_640px.jpg)


## Software components

| **Component** | **Description** | **Manual** |
| :-: | :-- | :-: |
| [ISE Design](https://www.xilinx.com/products/design-tools/ise-design-suite/ise-webpack.html) | ISE WebPACK Design Software, ver 14.7 | [Installation](https://gitlab.com/tomas.fryza/vhdl-examples/wikis/)
| [Linux Mint](https://linuxmint.com/download_all.php) | Linux Mint 18.2 "Sonya" - Xfce (64-bit) |

![ise](images/ise_synthesize_org.png)


## References

1. [Git, free and open source distributed version control system](https://git-scm.com/)
2. [VHDL cheat sheet](docs/README.md)
3. KALLSTROM, P. [A Fairly Small VHDL Guide](docs/VHDL_guide.pdf). Version 2.1.
4. [Wiki](https://gitlab.com/tomas.fryza/vhdl-examples/wikis/)


## License

[MIT](https://choosealicense.com/licenses/mit/)
