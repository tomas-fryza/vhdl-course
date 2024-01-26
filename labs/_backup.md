
# Git

After completing this lab you will be able to:

* Use git and markdown README files
* Create and clone repositories through GitHub
* Commit, push, and pull changes to the repository

In this laboratory exercise, you will learn how to use the git versioning system, write the markdown readme file, use the Windows/Linux console terminal to work in the lab.

## Pre-Lab preparation

1. If you don't have any, create a free account on [GitHub](https://github.com/signup?source=login).

3. For future synchronization of local folders with GitHub, download and install [git](https://git-scm.com/). Git is free, open source, and available on Windows, Mac, and Linux platforms. Window users will also need to use the Git Bash application (installed automatically with git) for command line operations.

## Part 1: GitHub

GitHub is a code hosting platform for collaboration and version control. GitHub lets you (and others) work together on projects.

1. In GitHub, create a new public repository titled **digital-electronics-1**. Initialize README, [`.gitignore`](https://raw.githubusercontent.com/iDoka/eda-scripts/master/gitignore/vivado.gitignore), and [MIT license](https://choosealicense.com/licenses/mit/).

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
   $ git clone https://github.com/your-github-account/digital-electronics-1
   $ cd digital-electronics-1/
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

5. Use your favorite text editor, such as VS Code, Notepad++, etc. and create a new file `README.md` in your `01-gates/` folder. Copy/paste [report template](https://raw.githubusercontent.com/tomas-fryza/digital-electronics-1/master/labs/01-gates/report.md) to your `01-gates/README.md` file.

6. Synchronize the contents of your working folder with the local and remote repository. This way you are sure that you will not lose any of your changes. To do that, use git commands to add, commit, and push all local changes to your remote repository. Check GitHub web page for changes.

   > **Help:** Useful git commands are `git status` - Get state of working directory and staging area. `git add` - Add new and modified files to the staging area. `git commit` - Record changes to the local repository. `git push` - Push changes to remote repository. `git pull` - Update local repository and working folder. Note that, a brief description of useful git commands can be found [here](https://github.com/tomas-fryza/digital-electronics-1/wiki/Useful-Git-commands) and detailed description of all commands is [here](https://github.com/joshnh/Git-Commands).

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

1. [MIT license](https://choosealicense.com/licenses/mit/)

2. Sayan Mondal. [How to make the perfect Readme.md on GitHub](https://medium.com/swlh/how-to-make-the-perfect-readme-md-on-github-92ed5771c061)

3. GitHub, Inc. [Basic writing and formatting syntax](https://help.github.com/en/articles/basic-writing-and-formatting-syntax)

4. GitHub, Inc. [Mastering Markdown](https://guides.github.com/features/mastering-markdown/)
