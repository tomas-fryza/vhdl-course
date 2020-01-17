# VHDL cheat sheet


#### Table of contents

1. [Library](#library)
2. [Data types](#data-types)
3. [Entity port generic](#entity-port-generic)
4. [Architecture](#architecture)
5. [Logic operators](#logic-operators)
6. [Structural description](#structural-description)
7. [Processes](#processes)
8. [Signal assignments](#signal-assignments)


## Library

Always start each VHDL file with following two lines. The **package** from IEEE **library** allow us to add additional types, operators, functions, etc. to VHDL.

```vhdl
library ieee;
use ieee.std_logic_1164.all;
```

If you need arithmetic operations add following line as well.

```vhdl
use ieee.std_logic_unsigned.all;    -- For +/- arithmetic operations
```


## Data types

Two most common **data types** (defined in the `std_logic_1164` package) are:

```vhdl
std_logic
std_logic_vector(<N-1> downto 0)
```

The `std_logic` type represents an one-bit element and consists mainly of values '0' and '1'. (There are nine values in this type, but we are going to use only two of them.) The `std_logic_vector` data type is defined as an array of `std_logic` elements. Always define the range of an array in form `N-1 downto 0`.

Note, you can also define your own type:

```vhdl
type t_my_states is (UP, RIGHT, DOWN, LEFT);
signal s_my_state: t_my_state;
```


## Entity port generic

**Entity** defines an input/output interface for your module:

```vhdl
entity identifier is
    generic (generic_name: data type := default_value;
             generic_name: data type := default_value;
             ...
             generic_name : data type := default_value);
    port (port_name: mode data_type;
          port_name: mode data_type;
          ...
          port_name: mode data_type);
end entity identifier;
```

The `mode` term can be `in` or `out`, which indicates that the corresponding signals flow "into" or "out" of the circuit. Example of simple entity can be:

```vhdl
------------------------------------------------------------------------
-- Entity declaration for top level
------------------------------------------------------------------------
entity top is
    generic (g_LEDS: natural := 4);
    port (a_i:   in  std_logic;
          b_i:   in  std_logic;
          c_o:   out std_logic;
          dec_o: out std_logic_vector(g_LEDS-1 downto 0));
end entity top;
```

`Generic` allows us to pass information into an entity and component. Since a generic cannot be modified inside the architecture, it is like a constant.


## Architecture

**Architecture** describes operation of the circuit. The architecture body may include an optional declaration section, which specifies constants, internal signals, etc.

```vhdl
architecture identifier of entity_name is
    signal signal_name: data_type;
    ...
begin
    <blah>
end architecture identifier;
```

Example of simple architecture with two internal signals can be:

```vhdl
------------------------------------------------------------------------
-- Architecture declaration for top level
------------------------------------------------------------------------
architecture Behavioral of top is
    signal s_p0, s_p1: std_logic;
begin
    -- Product terms
    s_p0 <= not(a_i) and not(b_i);
    s_p1 <= a_i and b_i;

    -- Sum of two product terms
    c_o  <= s_p0 or s_p1;

end architecture Behavioral;
```

Note, the main description between `begin` and `end` contains **concurrent statements**. Unlike a program in C language (where statements are executed sequentially), concurrent statements are like circuit parts that operate in parallel.


## Logic operators

Several logic operators are defined over the `std_logic` and `std_logic_vector` data type, such as `not`, `and`, `or`, `xor`, `nand`, etc.

**Concurrent assignment**. Describes a wired connection:

```vhdl
c_o <= a_i and b_i;
d_o <= a_i or not(y_i);
```

**Vector concatenation**. To merge vectors, use `&` operator:

```vhdl
y_o <= '0' & x_i(3 downto 0);   -- y_o = "0 x_i3 x_i2 x_i1 x_i0"
```


## Structural description

A digital system is often composed of several smaller blocks. VHDL provides a mechanism how to build a larger system from simpler or predesigned components. It is called a **component instantiation**. The syntax is

```vhdl
unit_label: entity lib_name.entity_name(arch_name)
    generic map (generic_name => value)
    port map (component_signal => actual_signal,
              component_signal => actual_signal,
              ...
              component_signal => actual_signal);
```

where `unit_label` gives a unique ID for an instance, `lib_name` indicates in which library the component is defined, and `entity_name` and `arch_name` terms indicate names of entity and architecture. Note, architecture name is optional.

Let 1-of-4 decoder entity is defined in `one_of_four.vhd` source file as follows

```vhdl
entity one_of_four is
    port (a_i: in  std_logic_vector(2-1 downto 0);
          y_o: out std_logic_vector(4-1 downto 0));
end entity one_of_four;
```

Then the instance (sub-block) of such an entity could be used in `top.vhd` file as follows

```vhdl
-- Sub-block of one_of_four entity
ONEOFFOUR: entity work.one_of_four
    port map (a_i => s_hex(3 downto 2),
              y_o => disp_dig_o);
```

where `work` library is the default library in which the compiled entity and architecture units are stored.


## Processes

Combinational process is another way to describe combinational logic. A process is **combinational** if it does not infer any registers:

```vhdl
------------------------------------------------------------------------
-- Begin of process_name
------------------------------------------------------------------------
-- Read:  <input signals>
-- Write: <output signals>
-- R/W:   <modified signals>
p_label: process (<sensitivity list>)
begin
    <blah>
end process p_label;
```

Sequential processes describes sequential logic. A process is **sequential** if it infers at least one register:

```vhdl
p_label: process (clk_i)
begin
    if rising_edge(clk_i) then
        <blah>
    end if;
end process p_label;
```


## Signal assignments

The following two assignments can only be written **outside** a process. Assignment `With`-`Select` is so called **selected signal assignment**:

```vhdl
with addr_i select
    y_o <= a_i when "000",  -- If addr_i = "000" then y_o = a_i
           b_i when "001",
           c_i when "010",
           d_i when others; -- All other combinations
```

Assignment `When`-`Else` is called **conditional signal assignment**:

```vhdl
y_o <= a_i when (addr_i = "000" and en_i = '1') else
       b_i when (addr_i = "001" and en_i = '1') else
       c_i when (addr_i = "010" and en_i = '1') else
       d_i;                 -- All other combinations
```

The following two assignments can only be written **inside** a process. Assignment `If`-`Then`-`Else`:

```vhdl
p_label: process (a)
begin
    if a = '0' then
        q <= '0';
    else
        q <= '1';
    end if;
end process p_label;
```

Assignment `Case`-`When`:

```vhdl
p_label: process (a)
begin
    case a is
    when '0' =>
        q <= '0';
    when others =>
        q <= '1';
    end case;
end process p_label;
```
