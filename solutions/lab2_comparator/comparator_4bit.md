# Entity: comparator_4bit 

- **File**: comparator_4bit.vhd
- **Copyright:** 2020-Present Tomas Fryza
 Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
 This work is licensed under the terms of the MIT license.

## Diagram

![Diagram](comparator_4bit.svg "Diagram")
## Description

 Example of 4-bit binary comparator using the when/else
 assignments.
## Ports

| Port name     | Direction | Type                         | Description          |
| ------------- | --------- | ---------------------------- | -------------------- |
| b_i           | in        | std_logic_vector(3 downto 0) | Input data B         |
| a_i           | in        | std_logic_vector(3 downto 0) | Input data A         |
| B_greater_A_o | out       | std_logic                    | Output is `1` if B>A |
| B_equals_A_o  | out       | std_logic                    | Output is `1` if B=A |
| B_less_A_o    | out       | std_logic                    | Output is `1` if B<A |
