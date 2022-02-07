# Lab 1: YOUR_FIRSTNAME FAMILYNAME

### De Morgan's laws

1. Equations of all three versions of logic function f(c,b,a):

   ![Logic function](images/equations.png)

2. Listing of VHDL architecture from design file (`design.vhd`) with syntax highlighting for all three functions:

```vhdl
architecture dataflow of demorgan is
begin
    f_o      <= -- WRITE YOUR CODE HERE
    f_nand_o <= -- WRITE YOUR CODE HERE
    f_nor_o  <= -- WRITE YOUR CODE HERE
end architecture dataflow;
```

3. Completed table with logic functions' values:

| **c** | **b** |**a** | **f(c,b,a)** | **f_NAND(c,b,a)** | **f_NOR(c,b,a)** |
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

1. Screenshot with simulated time waveforms; always display all inputs and outputs (inputs first):

   ![Screenshot example](images/basicgates_waveform.png)

2. Link to your public EDA Playground example:

   [https://www.edaplayground.com/...](https://www.edaplayground.com/...)
