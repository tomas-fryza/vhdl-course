# Lab 7: Stopwatch

#### Objectives

In this laboratory exercise you will study XXXX.
You will use a push button on the CoolRunner board as reset device, onboard clock signal with frequency of 10&nbsp;kHz for synchronization, and 7-segment display as output device.


## 1 Synchronize Git and create a new folder

Synchronize the contents of your Digital-electronics-1 working directory with GitHub. and create a new folder `Labs/07-stopwatch`.


## 2 Stopwatch

In VHDL, write a stopwatch counter and simulate it. The counter counts the time in the form of a **second : hundredths** and the maximum value is 59:99 (1 minute), then the time is reset to 00:00. The counter increment must be performed every 10 ms (one hundredth of a second) with the clock enable signal. In addition, the counting is enabled by the input signal `cnt_en_i` and the counter is reset by the synchronous reset input.

Use an approach that uses one BCD counter for each decade and counts from 0 to 9. The lowest of the counters is incremented every 10 ms, and each higher-order counter is incremented if all lower-order counters are equal to the maximum value of 9.

Let the entity has these inputs:
* `clk_i` (clock)
* `srst_n_i` (synchronous reset, active low)
* `ce_100Hz_i` (clock enable)
* `cnt_en_i` (stopwatch enable)

and outputs:
* `sec_h_o[3:0]` (counter for tens of seconds)
* `sec_l_o[3:0]` (counter for seconds)
* `hth_h_o[3:0]` (counter for tenths of seconds)
* `hth_l_o[3:0]` (counter for hundredths of seconds)


## 3 Stopwatch simulation

Design and simulate stopwatch counters in [EDA playground](https://www.edaplayground.com) or Xilinx ISE. Write a testbench that verifies all the functions of your stopwatch.




ukázka přetypování čítače na výstupní vektor
dodržovat coding style




## Synchronize git

Your repository must include the source code for the stopwatch, the testbench code and the screenshot of the correct simulation. Add, commit, and push all local changes to your remote repository.
