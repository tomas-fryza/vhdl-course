# Lab 1: Git version-control system, Online simulator

#### Table of contents

1. [Lab prerequisites](#Lab-prerequisites)
2. [GitHub](#GitHub)
3. [Linux terminal](#Linux-terminal)
4. [Online simulator](#Online-simulator)
5. [Clean project and synchronize git](#Clean-project-and-synchronize-git)
6. [Ideas for other tasks](#Ideas-for-other-tasks)


## Lab prerequisites

1. Create an account on [GitHub](https://github.com/) server.


## GitHub

1. In GitHub, create a new public repository titled **Digital-electronics-1**. Initialize a README and [MIT license](https://choosealicense.com/licenses/mit/).

2. Modify your README file according to [How to make the perfect Readme.md on GitHub](https://medium.com/swlh/how-to-make-the-perfect-readme-md-on-github-92ed5771c061), [Basic writing and formatting syntax](https://help.github.com/en/articles/basic-writing-and-formatting-syntax) or [Mastering Markdown](https://guides.github.com/features/mastering-markdown/) articles and try:
  * Headers,
  * Emphasis,
  * List,
  * Table.


## Linux terminal

1. Try basic commands in the Linux terminal:

| **Command** | **Description** |
| :-: | --------------- |
| `Ctrl+Alt+T` | Open Linux terminal in Ubuntu based distributions
| `Tab` | Automatic completion what you are typing or suggest options to you
| `Up/Down` | Browse command history
| `ls` | List directory contents
| `cd` | Change the current directory (change to parent directory: `cd ..`)
| `mkdir` | Make directories
| `cp` | Copy files and directories
| `pwd` | Print name of current/working directory
| `mc` | GNU Midnight Commander (file manager)

2. In the lab, make your own home folder within `Documents`, and with help of `git` command create a local copy of your public repository:

    ```bash
    $ cd
    $ pwd
    /home/lab661

    $ cd Documents/
    $ mkdir your-name
    $ cd your-name/
    $ pwd
    /home/lab661/Documents/your-name

    $ git clone https://github.com/your-github-account/Digital-electronics-1
    $ cd Digital-electronics-1/
    $ ls
    LICENSE  README.md
    ```

3. Download `Docs` folder from [teacher's repository](https://github.com/tomas-fryza/Digital-electronics-1) and copy it to your `Digital-electronics-1` local repository.

    ```bash
    $ ls
    Docs  LICENSE  README.md
    ```

4. Make a new folder XXXXXXXXXXXXXXx


## Online simulator

XXXXXXXXXXXXXXXXXX


1. Run Visual Studio Code source code editor, open `Digital-electronics-2` folder, run internal terminal in menu **Terminal > New Terminal**, and change path to `firmware/01-demo`. What is the meaning of each part of source file `main.c`? What is the meaning of the following commands?

    ```bash
    $ cd firmware/01-demo/
    $ make all
    $ make size
    $ make flash
    $ make clean
    ```

3. What is the meaning of `|`, `&`, `^`, `~`, `<<`, `_BV()` operations in C source file? See [AVR Libc Reference Manual](https://www.microchip.com/webdoc/AVRLibcReferenceManual/) for answer.


## Clean project and synchronize git

1. Use `cd ..` command in Linux terminal and change the working directory to `Digital-electronics-1`. Then use [git commands](https://github.com/joshnh/Git-Commands) to add, commit, and push all local changes to your remote repository. Check the repository at GitHub web page for changes.

    ```bash
    $ pwd
    /home/lab661/Documents/your-name/Digital-electronics-1/Labs/01-gates

    $ cd ..
    $ cd ..
    $ pwd
    /home/lab661/Documents/your-name/Digital-electronics-1

    $ git status
    $ git add <your-modified-files>
    $ git commit -m "[LABS] Adding 01-gates project"
    $ git push
    ```


## Ideas for other tasks

1. xxx
