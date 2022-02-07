# VHDL project: General instructions

<!--
![Logo](../../logolink_eng.jpg)
<p align="center">
  The Study of Modern and Developing Engineering BUT<br>
  CZ.02.2.69/0.0/0.0/18_056/0013325
</p>
-->

The aim of the VHDL project is cooperation in small groups, study of the assigned topic, design of own solution, simulation, implementation, creation of project documentation and presentation of results. Students are divided into groups that represent small teams within a company. Their task will be to redistribute their work, best to fulfill the assigned task and defeat competing teams from the "company". The division of roles and tasks within the team is up to their members. All team members will be evaluated with the same number of points. *Any non-cooperation of some of the team members will be resolved individually.*

* Students work on the project during 4 week in computer laboratories from the 9th to the 13th week of the semester in groups of 3 to 5 students.

* Students may consult the project within their own group, with their laboratory teacher and may not assign anyone else, including other students, academics, or PhD students. Consultations with the teacher will take place during the computer laboratories.

* Students present their results during in the 12th (13th) week of the semester.

* The source code for the FPGA must be written in VHDL and must be implementable on Nexys A7 Artix-7 board using toolchains used in the lab during the semester. Any other development tools are not allowed.

## Will be evaluated

* Submitted README file (see below)
* Content of GitHub repository
* Complexity of created application, functionality
* Other functionality beyond the topic
* If the topic has been completed
* Compliance with VHDL Guidelines (2021)
* Usage of codes and modules from previous exercises instead of copying from the Internet
* Presence of Vivado project and generated bitstream file
* Completeness and clarity of documentation
* Discussion of results
* 5-minute video presentation in English, Czech, or Slovak

> ## Bude hodnoceno
>
> * Obsah odeslaného souboru README (viz dále)
> * Obsah GitHub repozitáře
> * Složitost vytvořené aplikace, funkčnost
> * Přidání vlastní funkcionality nad rámec zadání
> * Zda práce odpovídá zadání
> * Dodržování pravidel dle VHDL Guidelines (2021)
> * Využití kódů a modulů z předchozích cvičení namísto jejich kopírování z internetu
> * Přítomnost kompletního projektu ve Vivado a vygenerovaný programovací soubor
> * Úplnost a jasnost dokumentace
> * Diskuse o výsledcích
> * 5minutová video prezentace v angličtině, češtině, nebo slovenštině
>

## The repository folder itself must contain

* Project README file according to the required structure (You will export and submit this file). The README file can be written in English, Czech, or Slovak
* Complete project in Vivado. All source files must be written in English
* Testbench of all components that you have developed
* Screenshots of simulations (individual components--not the whole project--can be simulated by EDA Playground as well)
* External circuit diagrams and their simulations, if needed
* Any other files, such as PCB of proposed circuit, production documentation, etc.
* Literature references you used

## README template

The README file contains a complete description of the problem, circuit diagram of peripherals, graphical representation of the application (flowchart or state diagram), screenshots of simulations, links to source files in the repository (do NOT include whole code listing to README), block diagram of final application, discussion of results, list of references, link to your video presentation, etc. Use this required structure of [project README file](project.md).

The deadline for submitting the project is **Tuesday May 4, 2021**. Use BUT e-learning web page, export your project README file to PDF and submit it.

![project schedule](schedule.png)

## Topics 2020/21

The source code for the FPGA must be written in VHDL language and must be implementable on **Arty A7-35T** or **Arty A7-100T** [board](https://store.digilentinc.com/arty-a7-artix-7-fpga-development-board/), not Nexys A7!

1. [Parking assistant with HC-SR04](https://github.com/xrysav25/DE1_Parking_assistant) ultrasonic sensor, sound signaling using PWM, signaling by LED bargraph.

   > *Parkovací asistent s HC-SR04 ultrazvukovým senzorem, zvuková PWM signalizace, signalizace pomocí LED bargrafu.*
   >

2. [Door lock system](https://github.com/xcadaj00/DE1_project) with PIN (4-digit) terminal, 4x3 push buttons, 4-digit 7-segment display, relay for door lock control.

   > *Terminál pro odemčení/zamčení dveří pomocí 4místného PIN kódu, 4x3 tlačítek, 4 sedmisegmentové displeje, relé pro ovládání zámku dveří.*
   >

3. [Console for exercise bike](https://github.com/mkousal/Digital-electronics-1-Tachometer), hall sensor, measuring and displaying speed, distance traveled, etc.

   > *Konzole pro rotoped/kolo, hallova sonda, měření a zobrazení rychlosti, ujeté vzdálenosti, atd.*
   >
