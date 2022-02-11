# Lab 1: Introduction to Git and VHDL

<!--
![Logo](../../logolink_eng.jpg)
<p align="center">
  The Study of Modern and Developing Engineering BUT<br>
  CZ.02.2.69/0.0/0.0/18_056/0013325
</p>

![Screenshot od EDA Playground](images/screenshot_eda.png)
-->

### Learning objectives

After completing this lab you will be able to:

* Use markdown README files
* Create git repository
* Understand basic structure of VHDL files

In this laboratory exercise, you will learn how to use the git versioning system, write the markdown readme file, use the Windows/Linux console terminal to work in the lab, and then how to compose a basic VHDL code using the online development tool.

### Table of contents

* [Preparation tasks](#preparation)
* [Part 1: GitHub](#part1)
* [Part 2: Local repository](#part2)
* [Part 3: EDA Playground](#part3)
* [Experiments on your own](#experiments)
* [Lab assignment](#assignment)
* [References](#references)

<a name="preparation"></a>

## Preparation tasks (done before the lab at home)

1. Create your account on [GitHub](https://github.com/).
2. If you don't have Google or Facebook account, register your account on [EDA Playground](https://www.edaplayground.com/login).
3. For future synchronization of local folders with GitHub, download and install [git](https://git-scm.com/).

<a name="part1"></a>

## Part 1: GitHub

GitHub is a code hosting platform for collaboration and version control. GitHub lets you (and others) work together on projects.

1. In GitHub, create a new public repository titled **digital-electronics-1**. Initialize a README and [MIT license](https://choosealicense.com/licenses/mit/).

2. Use one of the available git manuals, such as [1](https://medium.com/swlh/how-to-make-the-perfect-readme-md-on-github-92ed5771c061), [2](https://help.github.com/en/articles/basic-writing-and-formatting-syntax), or [3](https://guides.github.com/features/mastering-markdown/), and add the following sections to your online README.md file.

* Headers H1, H2, H3
* Emphasis (*italics*, **bold**)
* Lists (ordered, unordered)
* Link
* Table
* Listing of VHDL source code (with syntax highlighting)

<a name="part2"></a>

## Part 2: Local repository

1. Run Git Bash (Windows), Terminal (Linux), or your favorite file manager, and create your own home folder inside `Documents`. *Important: To avoid future problems, never use national characters (such as éščřèêö, ...) and spaces in folder- and file-names.*

   > Useful bash commands are: `cd` - Change working directory. `mkdir` - Create directory. `ls` - List information about files in the current directory. `pwd` - Print the name of the current working directory.
   >

   ```bash
   ## Windows Git Bash:
   ## Note that in the lab, home folders are located in Documents on disk D:
   $ cd d:/Documents/
   $ mkdir your-name
   $ cd your-name/

   ## Linux:
   $ cd
   $ cd Documents/
   $ mkdir your-name
   $ cd your-name/
   ```

2. With help of `git` command, clone a local copy of your public repository. (Important: The `clone` command is used only once to create a local version of the repository. Later synchronization is performed differently.)

   ```bash
   ## Windows Git Bash or Linux:
   $ git clone https://github.com/your-github-account/digital-electronics-1.git
   $ cd digital-electronics-1/
   $ ls
   LICENSE  README.md
   ```

3. Create a new working folder `labs/01-gates` for this exercise.

   ```bash
   ## Windows Git Bash or Linux:
   $ mkdir labs
   $ cd labs/
   $ mkdir 01-gates
   ```

4. Use your favorite text editor, such as VS Code, Notepad, etc. and create a new file `assignment.md` in your `labs/01-gates/` folder. Copy/paste [assignment template](https://raw.githubusercontent.com/tomas-fryza/digital-electronics-1/master/labs/01-gates/assignment.md) to your `assignment.md` text file.

5. Synchronize the contents of your working folder with the local and remote repository. Use git commands to add, commit, and push all local changes to your remote repository Check the repository at GitHub web page for changes.

   > Useful git commands are: `status` - Get state of working directory and staging area. `add` - Add new and modified files to the staging area. `commit` - Record changes to the local repository. `push` - Push changes to remote repository. `pull` - Update local repository and working folder. Use  to add, commit, and push all local changes to your remote repository. Note that, a brief description of useful git commands can be found [here](https://github.com/tomas-fryza/digital-electronics-1/wiki/Useful-Git-commands) and detailed description of all commands is [here](https://github.com/joshnh/Git-Commands). 
   >

   ```bash
   ## Windows Git Bash or Linux:
   $ git status
   $ git add -A
   $ git status
   $ git commit -m "[LAB] Creating 01-gates lab"
   $ git status
   $ git push
   $ git status
   ```

   ![git](images/git_basics.png)

<a name="part3"></a>

## Part 3: EDA Playground

1. EDA Playground is a cloud-based service that runs in your browser. Open the [Example of basic gates](https://www.edaplayground.com/x/5L92). Take a look at the basic parts of the VHDL source code, such as [entity](https://github.com/tomas-fryza/digital-electronics-1/wiki/Entity), [architecture](https://github.com/tomas-fryza/digital-electronics-1/wiki/Architecture), and testbench. Use button **Run** to run the simulation and log in to your account using **Log In (save edits)**.

   Most common VHDL operators are shown in the table.

   | **Operator** | **Description** |
   | :-: | :-- |
   | `<=` | Value assignment |
   | `and` | Logical AND |
   | `nand` | Logical AND with negated output |
   | `or` | Logical OR |
   | `nor` | Logical OR with negated output |
   | `not` | Nagation |
   | `xor` | Exclusive OR |
   | `xnor` | Exclusive OR with negated output |
   | `-- comment` | Comments |

2. Use De Morgan's laws and modify the following logic function to the form with NAND and NOR gates only. Verify all three functions in EDA Playground tool.

   ![Logic function](images/equations.png)

   > Note that, equations were generated by [Online LaTeX Equation Editor](https://www.codecogs.com/latex/eqneditor.php) using the following code.
   >
   ```LaTeX
   \begin{align*}
       f(c,b,a) =&~ \overline{b}\,a + \overline{c}\,\overline{b}\\
       f(c,b,a)_{\textup{NAND}} =&\\
       f(c,b,a)_{\textup{NOR}} =&\\
   \end{align*}
   ```
   >

3. According to the simulation, complete the table with logic values.

   | **c** | **b** |**a** | **f(c,b,a)** | **f_NAND(c,b,a)** | **f_NOR(c,b,a)** |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 0 | 0 |  |  |  |
   | 0 | 0 | 1 |  |  |  |
   | 0 | 1 | 0 |  |  |  |
   | 0 | 1 | 1 |  |  |  |
   | 1 | 0 | 0 |  |  |  |
   | 1 | 0 | 1 |  |  |  |
   | 1 | 1 | 0 |  |  |  |
   | 1 | 1 | 1 |  |  |  |

<a name="experiments"></a>

## Experiments on your own

1. In EDA Playground, verify at least one of the Distributive laws:

  First:

  ![Distributive law1](images/distributive1.png)

  <!--
  \begin{align*}
    x\cdot y + x\cdot z =&~ x\cdot (y+z)\\
    f(z,y,x)_{\textup{left}} =&~x\cdot y + x\cdot z\\
    f(z,y,x)_{\textup{right}} =&~x\cdot (y+z)\\
  \end{align*}
  -->

  Second:

  ![Distributive law2](images/distributive2.png)

  <!--
  \begin{align*}
    (x+y)\cdot (x+z) =&~ x+ (y\cdot z)\\
    f(z,y,x)_{\textup{left}} =&~(x+y)\cdot (x+z)\\
    f(z,y,x)_{\textup{right}} =&~x+ (y\cdot z)\\
  \end{align*}
  -->

2. You can also try several online graphics simulators, such as [CircuitVerse](https://circuitverse.org/), [Logicly](https://logic.ly/), [CircuitLab](https://www.circuitlab.com/), [simulatorIO](https://simulator.io/), [LogicEmu](https://lodev.org/logicemu/), and compare their options.

<a name="assignment"></a>

## Lab assignment

*Copy the [assignment template](assignment.md) to your GitHub repository. Complete all parts of this file in Czech, Slovak, or English and submit a link to it via [BUT e-learning](https://moodle.vutbr.cz/). The deadline for submitting the task is the day before the next computer exercise.*

*Vložte [šablonu úkolu](assignment.md) do vašeho GitHub repozitáře. Vypracujte všechny části z tohoto souboru v českém, slovenském, nebo anglickém jazyce a odevzdejte link na něj prostřednictvím [e-learningu VUT](https://moodle.vutbr.cz/). Termín odevzdání úkolu je den před dalším počítačovým cvičením.*

<a name="references"></a>

## References

1. [MIT license](https://choosealicense.com/licenses/mit/)

2. Sayan Mondal. [How to make the perfect Readme.md on GitHub](https://medium.com/swlh/how-to-make-the-perfect-readme-md-on-github-92ed5771c061)

3. GitHub, Inc. [Basic writing and formatting syntax](https://help.github.com/en/articles/basic-writing-and-formatting-syntax)

4. GitHub, Inc. [Mastering Markdown](https://guides.github.com/features/mastering-markdown/)

5. Tomas Fryza. [Example of basic OR, AND, XOR gates](https://www.edaplayground.com/x/5L92)

6. CodeCogs. [Online LaTeX Equation Editor](https://www.codecogs.com/latex/eqneditor.php)

7. CircuitVerse. [Online Digital Logic Circuit Simulator](https://circuitverse.org/)

8. Bowler Hat LLC. [Logicly - A logic circuit simulator for Windows and macOS](https://logic.ly/)

9. CircuitLab, Inc. [Online circuit simulation & schematic editor](https://www.circuitlab.com/)

10. Bastian Born. [simulatorIO - Build and simulate logic circuits](https://simulator.io/)

11. Lode Vandevenne. [LogicEmu: Online Logic Simulator](https://lodev.org/logicemu/)
