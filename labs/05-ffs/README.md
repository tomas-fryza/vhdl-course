# Lab 5: Latches and Flip-flops

<!--
![Logo](../../logolink_eng.jpg)
<p align="center">
  The Study of Modern and Developing Engineering BUT<br>
  CZ.02.2.69/0.0/0.0/18_056/0013325
</p>
-->

<!--
![Nexys A7 board](Images/nexys_a7_driver.jpg)
-->

### Learning objectives

After completing this lab you will be able to:

* Use latches and flip-flops
* Use VHDL synchronous processes
* Understand the asynchronous and synchronous resets

In this laboratory exercise, you will study the differences between a statically controlled latch and flip-flops that are synchronized with a clock signal. In VHDL, combinational and synchronous processes will be used and the difference between asynchronous and synchronous reset will be illustrated.

### Table of contents

* [Preparation tasks](#preparation)
* [Part 1: Synchronize Git and create a new folder](#part1)
* [Part 2: VHDL code for D latch](#part2)
* [Part 3: VHDL code for flip-flops](#part3)
* [Experiments on your own](#experiments)
* [Lab assignment](#assignment)
* [References](#references)

<a name="preparation"></a>

## Preparation tasks (done before the lab at home)

1. Write characteristic equations and complete truth tables for D, JK, T flip-flops where `q(n)` represents main output value before the clock edge and `q(n+1)` represents value after the clock edge.

![Characteristic equations](images/eq_flip_flops.png)
<!--
\begin{align*}
    q_{n+1}^D =&~ \\
    q_{n+1}^{JK} =&\\
    q_{n+1}^T =&\\
\end{align*}
-->

   | **clk** | **d** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](images/eq_uparrow.png) | 0 | 0 |  |  |
   | ![rising](images/eq_uparrow.png) | 0 | 1 |  |  |
   | ![rising](images/eq_uparrow.png) | 1 |  |  |  |
   | ![rising](images/eq_uparrow.png) | 1 |  |  |  |

   | **clk** | **j** | **k** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-: | :-- |
   | ![rising](images/eq_uparrow.png) | 0 | 0 | 0 | 0 | No change |
   | ![rising](images/eq_uparrow.png) | 0 | 0 | 1 | 1 | No change |
   | ![rising](images/eq_uparrow.png) | 0 |  |  |  |  |
   | ![rising](images/eq_uparrow.png) | 0 |  |  |  |  |
   | ![rising](images/eq_uparrow.png) | 1 |  |  |  |  |
   | ![rising](images/eq_uparrow.png) | 1 |  |  |  |  |
   | ![rising](images/eq_uparrow.png) | 1 |  |  |  |  |
   | ![rising](images/eq_uparrow.png) | 1 |  |  |  |  |

   | **clk** | **t** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](images/eq_uparrow.png) | 0 | 0 |  |  |
   | ![rising](images/eq_uparrow.png) | 0 | 1 |  |  |
   | ![rising](images/eq_uparrow.png) | 1 |  |  |  |
   | ![rising](images/eq_uparrow.png) | 1 |  |  |  |

<!--
Dokreslit průběhy pro D-latch a D-type FF.

![Timing of seven-segment display](images/wavedrom_7-segment.png)

> The figure above was created in [WaveDrom](https://wavedrom.com/) digital timing diagram online tool. The figure source code is as follows:
>
```javascript
{
  signal:
  [
    ['Digit position',
      {name: 'Common anode: AN(3)', wave: 'xx01..01..01'},
      {name: 'AN(2)', wave: 'xx1'},
      {name: 'AN(1)', wave: 'xx1'},
      {name: 'AN(0)', wave: 'xx1'},
    ],
    ['Seven-segment data',
      {name: '4-digit value to display', wave: 'xx3333555599', data: ['3','1','4','2','3','1','4','2','3','1']},
      {name: 'Cathod A: CA', wave: 'xx01.0.1.0.1'},
      {name: 'CB', wave: 'xx0'},
      {name: 'CC', wave: 'xx0'},
      {name: 'CD', wave: 'xx0'},
      {name: 'CE', wave: 'xx1'},
      {name: 'CF', wave: 'xx1'},
      {name: 'CG', wave: 'xx0'},
    ],
    {name: 'Decimal point: DP', wave: 'xx01..01..01'},
  ],
  head:
  {
    text: '                    4ms   4ms   4ms   4ms   4ms   4ms   4ms   4ms   4ms   4ms',
  },
}
```
-->

<a name="part1"></a>

## Part 1: Synchronize repositories and create a new folder

1. Run Git Bash (Windows) of Terminal (Linux), navigate to your working directory, and update local repository. Create a new working folder `labs/05-ffs` for this laboratory exercise.

<a name="part2"></a>

## Part 2: VHDL code for D latch

<!--
TODO: Popis co je to Latch.
-->
1. A latch is a level triggered element. Perform the following steps to model the D latch circuit.

   1. Create a new Vivado RTL project `flip_flops` in your `labs/05-ffs` working folder.
   2. Create a VHDL source file `d_latch` for D latch circuit.
   3. Choose default board: `Nexys A7-50T`.
   4. Define entity with `en`, `arst`, `d`, `q`, `q_bar`, use example from lecture *5 Sequential logic circuit* and complete the latch with asynchronous reset.
   5. Create a simulation source `tb_d_latch`, set input conditions and run the simulation. Verify the reset and enable functionality.

<a name="part3"></a>

## Part 3: VHDL code for flip-flops

<!--
TODO: Popis co je to Flip-flop.
-->
1. Create at least two entities for flip-flop D (with asynchronous reset, with synchronization reset), flip-flop JK (with synchronization reset), or T flip-flop (with synchronization reset). Prefered combination is `d_ff_rst` and `t_ff_rst`.

   | **Entity** | **Inputs** | **Outputs** | **Description** |
   | :-- | :-- | :-- | :-- |
   | `d_ff_arst` | `clk`, `arst`, `d` | `q`, `q_bar` | D type flip-flop with an async reset |
   | `d_ff_rst` | `clk`, `rst`, `d` | `q`, `q_bar` | D type flip-flop with a sync reset |
   | `jk_ff_rst` | `clk`, `rst`, `j`, `k` | `q`, `q_bar` | JK type flip-flop with a sync reset |
   | `t_ff_rst` | `clk`, `rst`, `t` | `q`, `q_bar` | T type flip-flop with a sync reset |

2. Try to simulate both flip-flops together in a single testbench `tb_ff_rst.vhd` with a maximum duration of 200 ns. Verify the synchronous reset as well.

  ```vhdl
  library ieee;
  use ieee.std_logic_1164.all;

  ------------------------------------------------------------
  -- Entity declaration for testbench
  ------------------------------------------------------------
  entity tb_ff_rst is
    -- Entity of testbench is always empty
  end entity tb_ff_rst;

  ------------------------------------------------------------
  -- Architecture body for testbench
  ------------------------------------------------------------
  architecture testbench of tb_ff_rst is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_rst        : std_logic;
    signal s_data       : std_logic;
    signal s_d_q        : std_logic;
    signal s_d_q_bar    : std_logic;
    signal s_t_q        : std_logic;
    signal s_t_q_bar    : std_logic;

  begin
    -- Connecting testbench signals with d_ff_rst entity
    -- (Unit Under Test)
    uut_d_ff_rst : entity work.d_ff_rst
        port map(
            clk   => s_clk_100MHz,
            rst   => s_rst,
            d     => s_data,
            q     => s_d_q,
            q_bar => s_d_q_bar
        );

    -- Connecting testbench signals with t_ff_rst entity
    -- (Unit Under Test)
    uut_t_ff_rst : entity work.t_ff_rst
        port map(
            clk   => s_clk_100MHz,
            rst   => s_rst,
            t     => s_data,
            q     => s_t_q,
            q_bar => s_t_q_bar
        );

    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 200 ns loop -- 20 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                   -- Process is suspended forever
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    p_reset_gen : process
    begin

        -- WRITE YOUR RESET HERE

        wait;
    end process p_reset_gen;

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        -- WRITE YOUR TEST CASES HERE

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
  end architecture testbench;
  ```

## Synchronize repositories

Use [git commands](https://github.com/tomas-fryza/digital-electronics-1/wiki/Useful-Git-commands) to add, commit, and push all local changes to your remote repository. Check the repository at GitHub web page for changes.

<a name="experiments"></a>

## Experiments on your own

Use D type flip-flops with synchronous reset and perform the following steps to implement the 4-bit shift register on the Nexys A7 board.

  1. Create a new design source `top` in your project.
  2. Use **Define Module** dialog and define I/O ports of entity `top` as follows.

  | **Port name** | **Direction** | **Type** | **Description** |
  | :-: | :-: | :-- | :-- |
  | `BTNU` | in | `std_logic` | Clock emulator |
  | `BTNC` | in | `std_logic` | Synchronous reset |
  | `SW` | in  | `std_logic_vector(1 - 1 downto 0)` | Shift register serial input |
  | `LED` | out | `std_logic_vector(4 - 1 downto 0)` | Shift register parallel outputs |

  3. Use direct instantiation and define an architecture of the top level.

  ```vhdl
  ------------------------------------------------------------------------
  -- Architecture body for top level
  ------------------------------------------------------------------------
  architecture Behavioral of top is

    -- Internal signals between flip-flops
    -- WRITE YOUR CODE HERE

  begin

    --------------------------------------------------------------------
    -- Four instances (copies) of D-type FF entity
    d_ff_0 : entity work.d_ff_rst
        port map(
            clk   => BTNU,
            rst   => BTNC,
            -- WRITE YOUR CODE HERE
        );

    d_ff_1 : entity work.d_ff_rst
        port map(
            clk   => BTNU,
            rst   => BTNC,
            -- WRITE YOUR CODE HERE
        );

    -- WRITE YOUR CODE HERE

  end architecture Behavioral;
  ```

   4. Create a testbench file `tb_top` and simulate it or create a new [constraints XDC](https://github.com/Digilent/digilent-xdc/blob/master/Nexys-A7-50T-Master.xdc) file: `nexys-a7-50t` and uncomment used pins according to the entity.
   5. Compile the project and download the generated bitstream `flip_flops/flip_flops.runs/impl_1/top.bit` into the FPGA chip.
   6. Test the functionality of the shift register by pressing the push buttons and observing LEDs.
   7. Use **IMPLEMENTATION > Open Implemented Design > Schematic** to see the generated structure.

<a name="assignment"></a>

## Lab assignment

*Copy the [assignment template](assignment.md) to your GitHub repository. Complete all parts of this file in Czech, Slovak, or English and submit a link to it via [BUT e-learning](https://moodle.vutbr.cz/). The deadline for submitting the task is the day before the next computer exercise.*

*Vložte [šablonu úkolu](assignment.md) do vašeho GitHub repozitáře. Vypracujte všechny části z tohoto souboru v českém, slovenském, nebo anglickém jazyce a odevzdejte link na něj prostřednictvím [e-learningu VUT](https://moodle.vutbr.cz/). Termín odevzdání úkolu je den před dalším počítačovým cvičením.*

<a name="references"></a>

## References

1. Digilent. [General .xdc file for the Nexys A7-50T](https://github.com/Digilent/digilent-xdc/blob/master/Nexys-A7-50T-Master.xdc)
