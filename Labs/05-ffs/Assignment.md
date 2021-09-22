# Lab 5: YOUR_FIRSTNAME FAMILYNAME

Link to your `Digital-electronics-1` GitHub repository:

   [https://github.com/...](https://github.com/...)


### Preparation tasks

1. Characteristic equations for D, JK, T flip-flops:

   ![your figure]()

2. Truth tables for D and T flip-flops:

   | **clk** | **d** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](Images/eq_uparrow.png) | 0 | 0 |  |  |
   | ![rising](Images/eq_uparrow.png) | 0 | 1 |  |  |
   | ![rising](Images/eq_uparrow.png) | 1 |  |  |  |
   | ![rising](Images/eq_uparrow.png) | 1 |  |  |  |

   | **clk** | **t** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](Images/eq_uparrow.png) | 0 | 0 |  |  |
   | ![rising](Images/eq_uparrow.png) | 0 | 1 |  |  |
   | ![rising](Images/eq_uparrow.png) | 1 |  |  |  |
   | ![rising](Images/eq_uparrow.png) | 1 |  |  |  |


### Flip-flops

1. Listing of VHDL architecture for D-type and T-type flip-flops with syntax highlighting:

D-type FF:

```vhdl
architecture Behavioral of d_ff_rst is
begin
    --------------------------------------------------------
    -- p_d_ff_rst:
    -- D type flip-flop with a high-active sync reset,
    -- rising-edge clk.
    -- q(n+1) = d
    --------------------------------------------------------
    p_d_ff_rst : process(clk)
    begin

        -- WRITE YOUR CODE HERE

    end process p_d_ff_rst;
end architecture Behavioral;
```

T-type FF:

```vhdl
architecture Behavioral of t_ff_rst is
    signal s_q : std_logic;
begin
    --------------------------------------------------------
    -- p_t_ff_rst:
    -- T type flip-flop with a high-active sync reset,
    -- rising-edge clk.
    -- q(n+1) = t./q(n) + /t.q(n)
    --------------------------------------------------------
    p_t_ff_rst : process(clk)
    begin

        -- WRITE YOUR CODE HERE

    end process p_t_ff_rst;

    q     <= s_q;
    q_bar <= not s_q;
end architecture Behavioral;
```

2. Screenshot with simulated time waveforms; try to simulate both flip-flops in a single testbench with a maximum duration of 200 ns:

   ![your figure]()


### Shift register

1. Image of the shift register schematic. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   ![your figure]()
