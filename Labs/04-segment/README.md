# Lab 4: Seven-segment display decoder

#### Objectives

The purpose of this laboratory exercise is to design a 7-segment display decoder and to become familiar with the VHDL structural description that allows you to build a larger system from simpler or predesigned components.


## Preparation tasks (done before the lab at home)

The Nexys A7 board provides two four-digit common anode seven-segment LED displays, configured to behave like a single eight-digit display. See schematic or reference manual of the Nexys A7 board and find out the connection of 7-segment display.

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;


Complete the decoder conversion table for common anode 7-segment display.

   | **Hex** | **Input** | **A** | **B** | **C** | **D** | **E** | **F** | **G** |
   | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 0000 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
   | 1 | 0001 | 1 | 0 | 0 | 1 | 1 | 1 | 1 |
   | 2 |      |   |   |   |   |   |   |   |
   | 3 |      |   |   |   |   |   |   |   |
   | 4 |      |   |   |   |   |   |   |   |
   | 5 |      |   |   |   |   |   |   |   |
   | 6 |      |   |   |   |   |   |   |   |
   | 7 |      |   |   |   |   |   |   |   |
   | 8 |      |   |   |   |   |   |   |   |
   | 9 |      |   |   |   |   |   |   |   |
   | A |      |   |   |   |   |   |   |   |
   | b |      |   |   |   |   |   |   |   |
   | C |      |   |   |   |   |   |   |   |
   | d |      |   |   |   |   |   |   |   |
   | E | 1110 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
   | F | 1111 | 0 | 1 | 1 | 1 | 0 | 0 | 0 |


## Part 1: Synchronize Git and create a new folder

Open a Linux terminal, use `cd` commands to change path to your Digital-electronics-1 working directory, and [synchronize the contents](https://github.com/joshnh/Git-Commands) with GitHub.

```bash
$ pwd
/home/lab661
$ cd Documents/your-name/Digital-electronics-1/
$ pwd
/home/lab661/Documents/your-name/Digital-electronics-1
$ git pull
```

Create a new folder `Labs/04-segment`

```bash
$ cd Labs/
$ mkdir 04-segment
$ cd 04-segment/
$ touch README.md
$ ls
README.md
```


## Part 2: VHDL code for seven-segment display decoder

Perform the following steps to simulate the seven-segment display decoder.

   1. Create a new Vivado project in your `Labs/04-segment` working folder.
   2. Create a VHDL source file `hex_7seg` for the decoder.
   3. Choose default board: `Nexys A7-50T`.
   4. In source file, define an entity `hex_7seg` as follows.

   | **Port name** | **Direction** | **Width** | **Description** |
   | :-- | :-: | :-: | :-- |
   | `hex_i` | input   | 4 bits | Input binary data |
   | `seg_o` | output  | 7 bits | Cathode values in the order A, B, C, D, E, F, G |

   5. Use [combinational process](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Processes) and define an architecture of the decoder. Note that, inside a process, `case`-`when` [assignments](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Signal-assignments) can be used.

```vhdl
------------------------------------------------------------
-- Architecture body for seven-segment display decoder
------------------------------------------------------------
architecture behavioral of hex_7seg is
begin

    ------------------------------------------------------------
    -- p_7seg_decoder:
    -- A combinational process for 7-segment display decoder. 
    -- Any time "hex_i" is changed, the process is "executed".
    -- Output pin seg_o(6) corresponds to segment A, seg_o(5) to B,
    -- etc.
    ------------------------------------------------------------
    p_7seg_decoder : process (hex_i)
    begin
        case hex_i is
            when "0000" =>
                seg_o <= "0000001";     -- 0
            when "0001" =>
                seg_o <= "1001111";     -- 1
    
            -- WRITE YOUR CODE HERE
    
            when "1110" =>
                seg_o <= "0110000";     -- E
            when others =>
                seg_o <= "0111000";     -- F
        end case;
    end process p_7seg_decoder;

end architecture behavioral;
```

   6. Create a simulation source `tb_hex_7seg` and verify the functionality of your decoder.


## Part 3: Top level VHDL code

VHDL provides a mechanism how to build a larger system from simpler or predesigned components. It is called an instantiation. Each instantiation statement creates an instance (copy) of a design entity.

VHDL-93 and later offers two methods of instantiation: direct instantiation and component instantiation. In direct instantiation, the entity itself is directly instantiated in an architecture. Its ports are connected using the port map. Let the top-level design `top.vhd`, implements an instance of the module defined in `hex_7seg.vhd`.

Perform the following steps to implement the seven-segment display decoder on the Nexys A7 board.

   1. Create a new design source `top` in your project.
   2. Define an entity `top` as follows.

   | **Port name** | **Direction** | **Width** | **Description** |
   | :-- | :-: | :-: | :-- |
   | `SW`  | input   | 4 bits | Input binary data |
   | `LED` | output  | 4 bits | LED indicators |
   | `CA` | output | 1 bit | Cathod A |
   | `CB` | output | 1 bit | Cathod B |
   | `CC` | output | 1 bit | Cathod C |
   | `CD` | output | 1 bit | Cathod D |
   | `CE` | output | 1 bit | Cathod E |
   | `CF` | output | 1 bit | Cathod F |
   | `CG` | output | 1 bit | Cathod G |
   | `AN` | output | 8 bits | Common anode signals to individual displays |

   3. Create a new [constraints XDC]((https://github.com/Digilent/digilent-xdc)) file: `nexys-a7-50t` and uncomment assigned pins.
   4. Use [direct instantiation](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Direct-instantiation) and define an architecture of the top level.

```vhdl
------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------
architecture behavioral of top is
begin

    --------------------------------------------------------------------
    -- Instance (copy) of hex_7seg entity
    hex2seg : entity work.hex_7seg
    port map (
        hex_i    => SW,
        seg_o(6) => CA,

        -- WRITE YOUR CODE HERE

        seg_o(0) => CG
    );

    -- Connect one common anode to 3.3V
    AN <= b"1111_0111";
    
    -- Use LEDs as indicators
    LED <= "0011";

end architecture behavioral;
```





TODO: TBD

-- Turn on LD3 if the input value is equal to "0000"
-- WRITE YOUR CODE HERE

-- Turn on LD2 if the input value is A, B, C, D, E, or F
-- WRITE YOUR CODE HERE

-- Turn on LD1 if the input value is odd, ie 1, 3, 5, ..., F
-- WRITE YOUR CODE HERE

-- Turn on LD0 if the input value is a power of two, ie 1, 2, 4, or 8
-- WRITE YOUR CODE HERE

2. Use onboard push buttons and slide switches as 4-bit input. How is the sub-block of hex to 7-segment decoder connected to the top module?

3. What coding style is used to name the input, output, and internal signals in VHDL?

4. Follow instructions from wiki, create a constraints file, and [implement your design](https://github.com/tomas-fryza/Digital-electronics-1/wiki/How-to-implement-your-design-to-target-device-in-ISE) to CoolRunner-II CPLD starter board.

5. Write logic functions for LEDs. Let two functions are defined using VHDL construction `when`-`else` and two functions using low-level gates `and`, `or`, `not`, etc.

6. In menu **Tools > Schematic Viewer > RTL...** select **Start with a schematic of top-level block** and check the hierarchical structure of the module.

7. In menu **Project > Design Summary/Reports** check **CPLD Fitter Report (Text)** for implemented functions in section `********** Mapped Logic **********`.


## 5 Clean project and synchronize git

1. In Xilinx ISE, clean up all generated files in menu **Project > Cleanup Project Files...** and close the project using **File > Close Project**.

    > **Warning:** In any file manager, make sure the project folder does not contain any **large** (gigabyte) files. These can be caused by incorrect simulation in ISim. Delete such files.
    >

2. Use `cd ..` command in Linux terminal and change working directory to `Digital-electronics-1`. Then use [git commands](https://github.com/joshnh/Git-Commands) to add, commit, and push all local changes to your remote repository. Check the repository at GitHub web page for changes.

    ```bash
    $ pwd
    /home/lab661/Documents/your-name/Digital-electronics-1/Labs/03-segment

    $ cd ..
    $ cd ..
    $ pwd
    /home/lab661/Documents/your-name/Digital-electronics-1

    $ git status
    $ git add <your-modified-files>
    $ git status
    $ git commit -m "[LAB] Adding 03-segment lab"
    $ git status
    $ git push
    $ git status
    ```


## Experiments on your own

1. Program and simulate a 4-to-1 multiplexer consists of four data input lines `data_i` two select lines `sel_i` and a single output line `y_o`.

2. Complete your `README.md` file with notes and screenshots from the implementation.








#TODO
4. In menu **Tools > Schematic Viewer > RTL...** select **Start with a schematic of top-level block** and check the hierarchical structure of the module.
