# Lab 8: Debouncer

* [Pre-Lab preparation](#preparation)
* [Part 1: Finite State Machine (FSM)](#part1)


* [Part 3: VHDL code for traffic light controller](#part3)
* [Part 4: Traffic light controller simulation](#part4)
* [Part 5: Top level VHDL code](#part5)
* [Challenges](#challenges)
* [References](#references)

### Learning objectives

After completing this lab you will be able to:

* Understand the philosophy and use of finite state machines
* Use state diagrams
* Understand the difference between Mealy and Moore type of FSM
* Use FSM in VHDL
* Use git and markdown README files
* Create and clone repositories through GitHub
* Commit, push, and pull changes to the repository

<a name="preparation"></a>

## Pre-Lab preparation





1. If you don't have any, create a free account on [GitHub](https://github.com/signup?source=login).

2. Optional: For future synchronization between your local folders and GitHub, download and install [git](https://git-scm.com/).





<a name="part1"></a>

## Part 1: Finite State Machine (FSM)

A **finite state machine (FSM)** is a computation model that can be implemented with hardware or software and can be used to simulate sequential logic. There are two main types of finite state machines: the Mealy FSM and the Moore FSM. The fundamental difference between these two types lies in the management of the outputs:

   * The output of the **Mealy** machine depends on the present state and inputs.
   * The outputs of a **Moore** machine depend only on the present state and not on the inputs, as shown in the [figure](https://www.allaboutcircuits.com/technical-articles/implementing-a-finite-state-machine-in-vhdl/).

   ![Moore-type FSM](images/moore_structure.png)

A common way how to represent a finite state machine is a **state diagram** which contains of:

   * Circles and
   * Directed arcs to the next state circles.

Circles represent the machine states labelled with a reflecting state and for a Moore machine also with the [output value](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-004-computation-structures-spring-2017/c6/c6s1/).

   ![State diagrams](images/diagram_circle.png)

Directed arcs represent the transitions between states and they are labelled with input/output pair for a Mealy machine and with input for a Moore machine.

   ![State diagrams](images/diagram_structure.png)





<a name="part2"></a>

## Part 2: VHDL code for debouncer







<a name="partXX"></a>

## Part XX: GitHub

**Git** is a free and open source distributed version control system, and available on Windows, Mac, and Linux platforms.



**GitHub** is a code hosting platform of git for collaboration and version control. GitHub lets you (and others) work together on projects.

1. In GitHub, create a new public repository titled **vhdl-course**. Initialize README, [`.gitignore`](https://raw.githubusercontent.com/iDoka/eda-scripts/master/gitignore/vivado.gitignore), and [MIT license](https://choosealicense.com/licenses/mit/).

2. Use one of the available git manuals, such as [[1]](https://medium.com/swlh/how-to-make-the-perfect-readme-md-on-github-92ed5771c061) or [[2]](https://help.github.com/en/articles/basic-writing-and-formatting-syntax) and add the following sections to your online README.md file.

* Headers H1, H2, H3
* Emphasis (*italics*, **bold**)
* Lists (ordered, unordered)
* Link
* Table
* Listing of VHDL source code (with syntax highlighting)

<a name="part2"></a>

## Part 2: Local repository

1. Use your favorite file manager and run Git Bash (Windows) or Terminal (Linux) inside your home folder `Documents`.

2. With help of `git` command, clone a local copy of your public repository.

   > **Important:** To avoid future problems, never use national characters (such as éščřèêö, ...) and spaces in folder- and file-names.
   >
   > **Help:** Useful git command is `git clone` - Create a local copy of remote repository. This command is executed just once; later synchronization between remote and local repositories is performed differently.
   >
   > Useful bash commands are `cd` - Change working directory. `mkdir` - Create directory. `ls` - List information about files in the current directory. `ls -a` - List information aout all files in the current directory. `pwd` - Print the name of the current working directory.

   ```bash
   ## Windows Git Bash or Linux:
   $ git clone https://github.com/your-github-account/vhdl-course
   $ cd vhdl-course/
   $ ls
   .gitignore  LICENSE  README.md
   ```

3. Set username and email for your repository (values will be associated with your later commits):

   ```shell
   $ git config user.name "your-git-user-name"
   $ git config user.email "your-email@address.com"
   ```

   You can verify that the changes were made correctly by:

   ```shell
   $ git config --list
   ```

4. Each computer exercise will be located in a separate folder, eg `01-gates` for the first exercise, `02-logic` for the second, `03-vivado` for the third, etc. Create a new working folder `labs/01-gates` for this exercise.

   ```bash
   ## Windows Git Bash or Linux:
   $ mkdir 01-gates
   ```

5. Use your favorite text editor, such as VS Code, Notepad++, etc. and create a new file `README.md` in your `01-gates/` folder. Copy/paste [report template](https://raw.githubusercontent.com/tomas-fryza/vhdl-course/master/labs/01-gates/report.md) to your `01-gates/README.md` file.

6. Synchronize the contents of your working folder with the local and remote repository. This way you are sure that you will not lose any of your changes. To do that, use git commands to add, commit, and push all local changes to your remote repository. Check GitHub web page for changes.

   > **Help:** Useful git commands are `git status` - Get state of working directory and staging area. `git add` - Add new and modified files to the staging area. `git commit` - Record changes to the local repository. `git push` - Push changes to remote repository. `git pull` - Update local repository and working folder. Note that, a brief description of useful git commands can be found [here](https://github.com/tomas-fryza/vhdl-course/wiki/Useful-Git-commands) and detailed description of all commands is [here](https://github.com/joshnh/Git-Commands).

   ```bash
   ## Windows Git Bash or Linux:
   $ git status
   $ git add -A
   $ git status
   $ git commit -m "Creating 01-gates lab"
   $ git status
   $ git push
   $ git status
   ```

   ![git](images/git_basics.png)





<a name="challenges"></a>

## Challenges

1. Add a *speed button* to your design to ensure a synchronous (but safe:) transition to the `WEST_GO` state.

2. Use the onboard LEDs to display the countdown of the delay counter value.

3. Follow the [exercise inspired by prof. Jon Valvano](https://arduining.com/2015/09/18/traffic-light-states-machine-with-arduino/) from University of Texas and desing an enhanced traffic light controller for the intersection of two equally busy one-way streets. The controller using two sensors and two traffic lights in three colors. Two sensors detects the presence of cars in each direction and the goal is to maximize traffic flow, minimize waiting time at a red light, and avoid accidents.

   ![Enhanced traffic light controller for the intersection](images/lab8_traffic_light_intersection.png)

4. Propose your own state table and draw a state diagram of this smart controller including delays. Use on-board slide switches to emulate two sensors and implement the traffic light controller on the Nexys A7 board.





<a name="references"></a>

## References

1. David Williams. [Implementing a Finite State Machine in VHDL](https://www.allaboutcircuits.com/technical-articles/implementing-a-finite-state-machine-in-vhdl/)

2. MIT OpenCourseWare. [L06: Finite State Machines](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-004-computation-structures-spring-2017/c6/c6s1/)

3. LBEbooks, Lesson 92 - Example 62: [Traffic Light Controller](https://www.youtube.com/watch?v=6_Rotnw1hFM)

4. VHDLwhiz, [One-process vs two-process vs three-process state machine](https://vhdlwhiz.com/n-process-state-machine/)

5. Jon Valvano. [Traffic Light , Finite State Machine with Arduino](https://arduining.com/2015/09/18/traffic-light-states-machine-with-arduino/)

6. [MIT license](https://choosealicense.com/licenses/mit/)

7. Sayan Mondal. [How to make the perfect Readme.md on GitHub](https://medium.com/swlh/how-to-make-the-perfect-readme-md-on-github-92ed5771c061)

8. GitHub, Inc. [Basic writing and formatting syntax](https://help.github.com/en/articles/basic-writing-and-formatting-syntax)

9. GitHub, Inc. [Mastering Markdown](https://guides.github.com/features/mastering-markdown/)
