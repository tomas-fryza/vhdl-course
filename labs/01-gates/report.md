# Lab 1: INSERT_YOUR_FIRSTNAME INSERT_YOUR_LASTNAME

### De Morgan's laws

1. Listing of VHDL architecture from design file (`design.vhd`) for all three functions. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture dataflow of gates is
begin

  f_orig <= (not(c and b)) or (not(b) and a);
  f_nand <= b nand a; -- MODIFY THIS FUNCTION
  f_nor  <= b nor a;  -- MODIFY THIS FUNCTION

end architecture dataflow;
```

2. Complete table with logic functions' values:

   | **c** | **b** |**a** | **f_ORIG** | **f_(N)AND** | **f_(N)OR** |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 0 | 0 |  |  |  |
   | 0 | 0 | 1 |  |  |  |
   | 0 | 1 | 0 |  |  |  |
   | 0 | 1 | 1 |  |  |  |
   | 1 | 0 | 0 |  |  |  |
   | 1 | 0 | 1 |  |  |  |
   | 1 | 1 | 0 |  |  |  |
   | 1 | 1 | 1 |  |  |  |

### Distributive laws

1. Screenshot with simulated time waveforms for one selected Distributive law. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![your figure]()

2. Link to your public EDA Playground example with Distributive law:

   [https://www.edaplayground.com/...](https://www.edaplayground.com/...)
