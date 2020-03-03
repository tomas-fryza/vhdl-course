# Lab 5: Binary counters

The purpose of this laboratory exercise is to design a counter.


#### Contents

1. [Materials](#1-Materials)
2. [Synchronize Git and create a new folder](#2-Synchronize-Git-and-create-a-new-folder)
3. [Clock enable VHDL code](#3-Clock-enable-VHDL-code)
4. [Binary counter VHDL code](#4-Binary-counter-VHDL-code)
5. [Top level implementation of 4-bit counter](#5-Top-level-implementation-of-4-bit-counter)
6. [Clean project and synchronize git](#6-Clean-project-and-synchronize-git)


## Preparation tasks (done before the lab at home)

1. Calculate how many periods of clock signal with ![equation](https://latex.codecogs.com/gif.latex?f_%7Bclk%7D%20%3D%2010%5C%2C%5Ctext%7BkHz%7D) contain time intervals 10&nbsp;ms, 250&nbsp;ms, 500&nbsp;ms, and 1&nbsp;s. Write values in decimal, binary, and hexadecimal forms.

    &nbsp;
    
    ![equation](https://latex.codecogs.com/gif.latex?T_%7Bclk%7D%20%3D%20%5Cfrac%7B1%7D%7Bf_%7Bclk%7D%7D%20%3D)
    
    &nbsp;

    | **Freq** | **Time** | **Number of periods** | **Number of periods in binary** | **Number of periods in hexa** |
    | :-: | :-: | :-: | :-: | :-: |
    | 100&nbsp;Hz | 10&nbsp;ms |  |  |  |
    | 4&nbsp;Hz | 250&nbsp;ms |  |  |  |
    | 2&nbsp;Hz | 500&nbsp;ms |  |  |  |
    | 1&nbsp;Hz | 1&nbsp;sec |  |  |  |

2. See how to create a [synchronous operation](https://github.com/tomas-fryza/Digital-electronics-1/wiki/VHDL-cheat-sheet#processes) in the VHDL.


## 1 Materials

1. CoolRunner-II CPLD starter board ([XC2C256-TQ144](../../Docs/xc2c256_cpld.pdf)): [Manual](../../Docs/coolrunner-ii_rm.pdf), [Schematic](../../Docs/coolrunner-ii_sch.pdf).

    ![coolrunner_expansion](../../Images/coolrunner_segments.jpg)


## 2 Synchronize Git and create a new folder

1. Open a Linux terminal, change path to your Digital-electronics-1 working directory, and synchronize the contents with GitHub.

2. Create a new folder `Labs/05-counter_binary`


## 3 Clock enable VHDL code

*To drive another logic in the design (with slower clock), it is better to generate a clock enable signal instead of creating another clock domain (using clock dividers) that would cause timing issues or clock domain crossing problems such as metastability, data loss, and data incoherency.*

1. Create a new project in ISE titled `binary_counter` for XC2C256-TQ144 CPLD device in location `/home/lab661/Documents/your-name/Digital-electronics-1/Labs/05-counter_binary`

2. Create a new VHDL module `clock_enable` and copy + paste the following code template.

```vhdl
------------------------------------------------------------------------
--
-- Generates clock enable signal.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;    -- Provides unsigned numerical computation

------------------------------------------------------------------------
-- Entity declaration for clock enable
------------------------------------------------------------------------
entity clock_enable is
generic(
    g_NPERIOD : std_logic_vector(16-1 downto 0) := x"0004"
);
port(
    clk_i          : in  std_logic;
    srst_n_i       : in  std_logic; -- Synchronous reset (active low)
    clock_enable_o : out std_logic
);
end entity clock_enable;

------------------------------------------------------------------------
-- Architecture declaration for clock enable
------------------------------------------------------------------------
architecture Behavioral of clock_enable is
    signal s_cnt : std_logic_vector(16-1 downto 0) := x"0000";
begin

    --------------------------------------------------------------------
    -- p_clk_enable:
    -- Generate clock enable signal instead of creating another clock 
    -- domain. By default enable signal is low and generated pulse is 
    -- always one clock long.
    --------------------------------------------------------------------
    p_clk_enable : process(clk_i)
    begin
        if rising_edge(clk_i) then  -- Rising clock edge
            if srst_n_i = '0' then  -- Synchronous reset (active low)
                s_cnt <= (others => '0');   -- Clear all bits
                clock_enable_o <= '0';
            else
                if s_cnt >= g_NPERIOD-1 then
                    s_cnt <= (others => '0');
                    clock_enable_o <= '1';
                else
                    s_cnt <= s_cnt + x"0001";
                    clock_enable_o <= '0';
                end if;
            end if;
        end if;
    end process p_clk_enable;

end architecture Behavioral;
```

> **Generic** allows us to pass information into an entity and component. Since a generic cannot be modified inside the architecture, it is like a constant.
   >

3. Simulate the module for different `g_NPERIOD` values and verify that the reset works correctly.

    > **Warning:** Comment or remove lines in generated test bench that contain `clock_enable_o_process` process definition. The clock enable signal is generated by the VHDL module.
    >

```vhdl
--   clock_enable_o_process :process
--   begin
--		clock_enable_o <= '0';
--		wait for clock_enable_o_period/2;
--		clock_enable_o <= '1';
--		wait for clock_enable_o_period/2;
--   end process;
```


## 4 Binary counter VHDL code

1. Create a new VHDL module `binary_cnt` and copy + paste the following code template.

```vhdl
------------------------------------------------------------------------
--
-- N-bit binary counter.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;    -- Provides unsigned numerical computation

------------------------------------------------------------------------
-- Entity declaration for N-bit binary counter
------------------------------------------------------------------------
entity binary_cnt is
generic(
    g_NBIT : positive := 5          -- Number of bits
);
port(
    clk_i          : in  std_logic;
    srst_n_i       : in  std_logic; -- Synchronous reset (active low)
    clock_enable_i : in  std_logic;
    cnt_o          : out std_logic_vector(g_NBIT-1 downto 0)
);
end entity binary_cnt;

------------------------------------------------------------------------
-- Architecture declaration for N-bit binary counter
------------------------------------------------------------------------
architecture Behavioral of binary_cnt is
    signal s_cnt : std_logic_vector(g_NBIT-1 downto 0);
begin

    --------------------------------------------------------------------
    -- p_binary_cnt:
    -- Sequential process with synchronous reset and clock enable,
    -- which implements a one-way binary counter.
    --------------------------------------------------------------------
    p_binary_cnt : process(clk_i)
    begin
        if rising_edge(clk_i) then  -- Rising clock edge
            if srst_n_i = '0' then  -- Synchronous reset (active low)
                s_cnt <= (others => '0');   -- Clear all bits
            elsif clock_enable_i = '1' then
                s_cnt <= s_cnt + 1; -- Normal operation
            end if;
        end if;
    end process p_binary_cnt;

    cnt_o <= s_cnt;

end architecture Behavioral;
```

   > Note that an internal `s_cnt` signal is used to implement the counter. This is because the **output** port `cnt_o` cannot be read and therefore the operation `cnt_o + 1` cannot be performed.
   >

2. Simulate the module for different `g_NBIT` values and verify that the clock enable signal works correctly.


## 5 Top level implementation of 4-bit counter

1. Create a new VHDL module `top` and copy + paste the following code template.

    > If top level module in Xilinx ISE has not changed automatically, do it manually: right click to **top - Behavioral (top.vhd)** line and select **Set as Top Module**.
    >

```vhdl
------------------------------------------------------------------------
--
-- Implementation of 4-bit binary counter.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2019-2020 Tomas Fryza
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
    clk_i      : in  std_logic;     -- 10 kHz clock signal
    BTN0       : in  std_logic;     -- Synchronous reset
    disp_seg_o : out std_logic_vector(7-1 downto 0);
    disp_dig_o : out std_logic_vector(4-1 downto 0)
);
end entity top;

------------------------------------------------------------------------
-- Architecture declaration for top level
------------------------------------------------------------------------
architecture Behavioral of top is
    constant c_NBIT : positive := 4;    -- Number of bits
    --- WRITE YOUR CODE HERE
begin
    --- WRITE YOUR CODE HERE


    -- Select display position
    disp_dig_o <= "1110";

end architecture Behavioral;
```

2. Implement a four-bit binary counter on the Coolrunner-II board. Display the values on the 7-segment display, connect the reset to the BTN0 push button and make sure the 10kHz clock frequency is selected.

Use all values for `clock_enable` module from preparation task table.


## 6 Clean project and synchronize git

1. In Xilinx ISE, clean up all generated files in menu **Project > Cleanup Project Files...** and close the project using **File > Close Project**.

    > **Warning:** In any file manager, make sure the project folder does not contain any **large** (gigabyte) files. These can be caused by incorrect simulation in ISim. Delete such files.
    >

2. Use git commands to add, commit, and push all local changes to your remote repository. Check the repository at GitHub web page for changes.


## Experiments on your own

1. Display 4-bit counter value with onboard LEDs.

2. Implement a second 8-bit counter with a different time base (ie. different clock enable value) and display its value using LEDs on the CPLD expansion board.

3. Modify the structure of the N-bit counter and add the option of synchronously loading the default value.

4. Complete your `README.md` file with notes and screenshots from simulation and implementation.
