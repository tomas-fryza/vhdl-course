# Lab 7: Latches and Flip-flops

<!--
![Logo](../../logolink_eng.jpg)
-->


<!--
### Learning objectives

TBD
-->

<!--
In this laboratory exercise, you will study the ...

![Nexys A7 board](Images/nexys_a7_driver.jpg)
-->


## Preparation tasks (done before the lab at home)

Write characteristic equations and complete truth tables for D, JK, T flip-flops where `Qn` represents main output value before clock edge and `Q(n+1)` represents value after the edge.

   | **D** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-- |
   | 0 | 0 |  |  |
   | 0 | 1 |  |  |
   | 1 |  |  |  |
   | 1 |  |  |  |

   | **J** | **K** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | 0 | 0 | 0 | 0 | No change |
   | 0 | 0 | 1 | 1 | No change |
   | 0 |  |  |  |  |
   | 0 |  |  |  |  |
   | 1 |  |  |  |  |
   | 1 |  |  |  |  |
   | 1 |  |  |  |  |
   | 1 |  |  |  |  |

   | **T** | **Qn** | **Q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-- |
   | 0 | 0 |  |  |
   | 0 | 1 |  |  |
   | 1 |  |  |  |
   | 1 |  |  |  |


<!--
Dokreslit průběhy pro D-latch a D-type FF.

![Timing of seven-segment display](Images/wavedrom_7-segment.png)

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


## Part 1: Synchronize repositories and create a new folder

Run Git Bash (Windows) of Terminal (Linux), navigate to your working directory, and update local repository. Create a new working folder `Labs/07-ffs` for this exercise.


## Part 2: VHDL code for D latch

<!--
TODO: Popis co je to Latch.
-->
A latch is a level triggered element.

Perform the following steps to model the latch and flip-flop circuits.

   1. Create a new Vivado RTL project `flip_flops` in your `Labs/07-ffs` working folder.
   2. Create a VHDL source file `d_latch` for D latch circuit.
   3. Choose default board: `Nexys A7-50T`.
   4. Define entity with `en`, `d`, `arst`, `q`, `q_bar`, use example from lecture and complete the latch with asynchronous reset.
   5. Create a simulation source `tb_d_latch`, set input conditions and run the simulation. Verify the reset and enable functionality.


## Part 3: VHDL code for flip-flops

Create entities for D flip-flop (with an async reset, with a sync reset), JK flip-flop (with a sync reset), T flip-flop (with a sync reset).

Simulate each entity separately.

   | **Entity** | **Inputs** | **Outputs** | **Description** |
   | :-- | :-- | :-- | :-- |
   | `d_ff_arst` | `clk`, `d`, `arst` | `q`, `q_bar` | D type flip-flop with an async reset |
   | `d_ff_rst` | `clk`, `d`, `rst` | `q`, `q_bar` | D type flip-flop with a sync reset |
   | `jk_ff_rst` | `clk`, `j`, `k`, `rst` | `q`, `q_bar` | JK type flip-flop with a sync reset |
   | `t_ff_rst` | `clk`, `t`, `rst` | `q`, `q_bar` | T type flip-flop with a sync reset |


## Synchronize repositories

Use [git commands](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Useful-Git-commands) to add, commit, and push all local changes to your remote repository. Check the repository at GitHub web page for changes.


## Experiments on your own: Shift register

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
    -- Four instances (copies) of D type FF entity
    d_ff_0 : entity work.d_ff_rst
        port map(
            clk        => BTNU,
            reset      => BTNC,
            -- WRITE YOUR CODE HERE
        );

    d_ff_1 : entity work.d_ff_rst
        port map(
            clk        => BTNU,
            reset      => BTNC,
            -- WRITE YOUR CODE HERE
        );

    -- WRITE YOUR CODE HERE

end architecture Behavioral;
```

   4. Create a testbench file `tb_top` and simulate it or create a new [constraints XDC](https://github.com/Digilent/digilent-xdc/blob/master/Nexys-A7-50T-Master.xdc) file: `nexys-a7-50t` and uncomment used pins according to the entity.
   5. Compile the project and download the generated bitstream `flip_flops/flip_flops.runs/impl_1/top.bit` into the FPGA chip.
   6. Test the functionality of the shift register by pressing the push buttons and observing LEDs.
   7. Use **IMPLEMENTATION > Open Implemented Design > Schematic** to see the generated structure.


## Lab assignment

1. Preparation tasks (done before the lab at home). Submit:
    * Characteristic equations and completed tables for D, JK, T flip-flops.

2. D latch. Submit:
    * VHDL code listing of the process `p_d_latch` with syntax highlighting,
    * Listing of VHDL reset and stimulus processes from the testbench `tb_d_latch` file with syntax highlighting and asserts,
    * Screenshot with simulated time waveforms; always display all inputs and outputs. The full functionality of the entity must be verified.

3. Flip-flops. Submit:
    * VHDL code listing of the processes `p_d_ff_arst`, `p_d_ff_rst`, `p_jk_ff_rst`, `p_t_ff_rst` with syntax highlighting,
    * Listing of VHDL clock, reset and stimulus processes from the testbench files with syntax highlighting and asserts,
    * Screenshot, with simulated time waveforms; always display all inputs and outputs. The full functionality of the entities must be verified.

4. Shift register. Submit:
    * Image of the shift register schematic. The image can be drawn on a computer or by hand. Name all inputs, outputs, components and internal signals.

*Prepare all parts of the assignment on a computer (not by hand), insert them in your README file `Digital-electronics-1/Labs/07-ffs/README.md`, export the formated output (not the listing in markdown language) from [HTML to PDF](https://github.com/tomas-fryza/Digital-electronics-1/wiki/Export-README-to-PDF), use [BUT e-learning](https://moodle.vutbr.cz/) web page and submit a single PDF file. The deadline for submitting the task is the day before the next laboratory exercise.*
