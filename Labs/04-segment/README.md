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

Perform the following steps to implement the seven-segment display decoder.

   1. Create a new Vivado project in your `Labs/04-segment` working folder.
   2. Create a VHDL source file `hex_7seg` for the decoder.
   3. Create a constraints XDC file: `nexys-a7-50t`.
   4. Choose default board: `Nexys A7-50T`.
   5. In source file, define an entity `hex_7seg` as follows.

   | **Port name** | **Direction** | **Width** | **Description** |
   | :-- | :-: | :-: | :-- |
   | `hex_i` | input   | 4 bits | Input binary data |
   | `seg_o` | output  | 7 bits | Cathode values in the order A, B, C, D, E, F, G |

   6. Use [combinational process](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Processes) and define an architecture of the decoder. Note that, inside a process, `case`-`when` [assignments](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Signal-assignments) can be used.

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

   7. Create a simulation source `tb_hex_7seg` and verify the functionality of your decoder.


## Part 3: Top level















1. Create a new source file **Project > New Source... > VHDL Module**, name it `top` and copy/paste the following code template.

![Ports of top module](Images/top___hex_to_7seg.png)

```vhdl
------------------------------------------------------------------------
--
-- Implementation of hexadecimal digit to seven-segment decoder.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2018-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for top level
------------------------------------------------------------------------
entity top is
port (
    SW0, SW1 :           in  std_logic;
    BTN0, BTN1 :         in  std_logic;
    LD0, LD1, LD2, LD3 : out std_logic;
    disp_seg_o :         out std_logic_vector(7-1 downto 0);
    disp_dig_o :         out std_logic_vector(4-1 downto 0)
);
end entity top;

------------------------------------------------------------------------
-- Architecture declaration for top level
------------------------------------------------------------------------
architecture Behavioral of top is
    signal s_hex : std_logic_vector(4-1 downto 0);  -- Internal signals
begin

    -- Combine inputs [SW1, SW0, BTN1, BTN0] into internal vector
    s_hex(3) <= SW1;
    s_hex(2) <= SW0;
    s_hex(1) <= not BTN1;
    s_hex(0) <= not BTN0;


    --------------------------------------------------------------------
    -- Sub-block of hex_to_7seg entity
    HEX2SSEG : entity work.hex_to_7seg
    port map (
        -- <component_signal> => <actual_signal>,
        -- <component_signal> => <actual_signal>,
        -- <other signals>...
        -- WRITE YOUR CODE HERE
    );

    -- Select display position
    disp_dig_o <= "1110";


    -- Turn on LD3 if the input value is equal to "0000"
    -- WRITE YOUR CODE HERE

    -- Turn on LD2 if the input value is A, B, C, D, E, or F
    -- WRITE YOUR CODE HERE

    -- Turn on LD1 if the input value is odd, ie 1, 3, ..., F
    -- WRITE YOUR CODE HERE

    -- Turn on LD0 if the input value is a power of two, ie 1, 2, 4, or 8
    -- WRITE YOUR CODE HERE

end architecture Behavioral;
```

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
