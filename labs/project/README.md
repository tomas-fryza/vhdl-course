# VHDL project: General instructions

The aim of the VHDL project is cooperation in small teams, study of assigned topic, design of own solution, simulation, implementation, creation of project documentation and presentation of results. Students are divided into groups that represent small teams within a company. Their task will be to redistribute the work, fulfill the assigned task and defeat competing teams from the "company". The division of roles and tasks within the team is up to their members. All team members will be evaluated with the same number of points. *Any non-cooperation of some of the team members will be resolved individually*.

* Students work on the project in laboratories from the 9th(10th) to 12th(13th) week of the semester in groups of 3 to 4 students.

* Students may consult the project within their own team, with their laboratory teacher and may not assign anyone else, including other students, academics, or PhD students. Consultations with the teacher will take place during the laboratories.

* Students submit their results after the last laboratory in the 12th(13th) week of the semester.

* The source code for the FPGA must be written in VHDL language and must be implementable on Nexys A7-50T board using development tools used in the lab during the semester.

## Will be evaluated

* Content of GitHub repository (see below)
* Complexity of created application, functionality
* Other functionality beyond the topic
* If the topic has been completed
* Compliance with VHDL Guidelines, see elearning web page
* Usage of codes and modules from previous exercises instead of copying from the Internet
* Presence of Vivado project and generated bitstream
* Discussion of results
* 5-minute youtube video presentation in English, Czech, or Slovak

> ## Bude hodnoceno
>
> * Obsah GitHub repozitáře (viz dále)
> * Složitost vytvořené aplikace, funkčnost
> * Přidání vlastní funkcionality nad rámec zadání
> * Zda práce odpovídá zadání
> * Dodržování pravidel dle VHDL Guidelines, viz elearning
> * Využití kódů a modulů z předchozích cvičení namísto jejich kopírování z internetu
> * Přítomnost projektu ve Vivado a vygenerovaný programovací soubor
> * Diskuse o výsledcích
> * 5minutová video prezentace v angličtině, češtině, nebo slovenštině

## The repository folder itself must contain

* Project README file according to the required structure. The README file can be written in English, Czech, or Slovak
* Project in Vivado. All source files must be written in English
* Testbench of all components that you have developed
* Screenshots of simulations (individual components--not the whole project--can be simulated by EDA Playground as well)
* External circuit diagrams and their simulations, if needed
* Any other files, such as PCB of proposed circuit, documents for 3D printing, production documentation, etc.
* Literature references you used

## README template

The README file contains a complete description of the problem, circuit diagram of peripherals, graphical representation of the application (flowchart or state diagram), screenshots of simulations, links to source files in the repository (do NOT include whole code listing to README), block diagram of final application, discussion of results, list of references, link to your youtube video presentation, etc. Use this required structure of [project README file](project.md).

## Project submitting

Use BUT e-learning web page and submit the project GitHub link. All team members work on one GitHub repository. The link is submitted by at least one member of the team (but everyone can submit it).

The deadline for submitting the project GitHub link is on **day of the 12th computer exercise**.

| Groups | Deadline |
| :-- | :-: |
| Thursday groups | 28-Apr, 23:59 |
| Tuesday groups | 3-May, 23:59 |
| Wednesday groups | 4-May, 23:59 |

## Topics 2021/22

1. UART interface, ie UART transmitter and receiver. Let the UART frame structure is 8N1 and symbol rate is 9600 Bd.
2. Nexys board mono audio output and PWM sound generation. Generate basic signals and/or audio samples.
3. Morse code receiver, ie converter of Morse code to characters/numbers.
4. Morse code transmitter, ie converter of characters/numbers to Morse code.
5. Digital clock (hh mm ss) with time/alarm setting.
6. Running text on 7-seg displays.
7. Frequency counter of square and harmonic and/or ECG signal.
8. Measuring the speed of an object through a series of IR sensors (such as HW-201) or optical barriers.

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

## Topics 2019/20

1. Code lock with 4x3 matrix keyboard, time limit for entering the correct pin code and signaling an incorrect attempt.

2. PWM dimmer with adjustable "timing" with rotary encoder KY-040 and push button. After the time has elapsed, the output of 100% PWM is continuously dimmed to zero.

3. UART (Universal asynchronous receiver / transmitter) transmitter with adjustable UART frame, data word and one of two preset standard symbol rate parameters while the application is running.

4. Ultrasonic distance meter HC-SR04. Output on multiplexed 7-segment display.

5. Own ALU (Arithmetic Logic Unit) unit. Possibility to select instructions and input values while the application is running. Output on multiplexed 7-segment display.

6. Countdown from given value to zero. Value is given by rotary encoder KY-040 with button, output is shown on serial 4-digit 7-segment display with control circuit TM1637.
