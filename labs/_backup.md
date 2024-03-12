# Pmod

2. See [schematic](https://github.com/tomas-fryza/vhdl-course/blob/master/docs/nexys-a7-sch.pdf) or [reference manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual) of the Nexys A7 board and find out the connection of Pmod ports, ie to which FPGA pins are connected. What is the usage of such connectors?

   ![pmods](images/pmod_table.png)

8. Optional: Use digital oscilloscope or logic analyser and display counter values via Pmod ports of the Nexys A7 board.





<a name="part3"></a>

## Part 3: VHDL code for traffic light controller

Let an intersection contains two one-way streets with a fixed time control system in which traffic lights are configured to turn on the green, yellow, and red color after a given period. If it is red in one direction on the traffic light, it is green in the other, and green in the first direction can only occur when it is red in the other direction, etc.

   > The exercise is inspired by the references [[3]](https://www.youtube.com/watch?v=6_Rotnw1hFM), [[1]](https://www.allaboutcircuits.com/technical-articles/implementing-a-finite-state-machine-in-vhdl/), [[4]](https://vhdlwhiz.com/n-process-state-machine/), while several changes have been made to preserve the programming style from the previous exercises, such as:
   >
   >* Use `numeric_std` package instead of `IEEE.STD_LOGIC_unsigned`,
   >* Types for internal signal/constants changed from `STD_LOGIC_VECTOR(3 downto 0)` to `unsigned`,
   >* Edge detector `clk'event and clk = '1'` changed to `rising_edge(clk)`.

1. Perform the following steps to model the traffic light controller in Vivado.

   1. Create a new Vivado RTL project `traffic` in your `08-traffic_lights` working folder.

   2. Create a VHDL source file `tlc` for the traffic light controller circuit.

   3. Choose default board: `Nexys A7-50T`.

   4. Open the [Traffic light controller](https://www.edaplayground.com/x/5HBi) example and copy/paste the `design.vhd` code to your `tlc.vhd` file.

   5. Copy source file of clock enable circuit from previous labs to `traffic/traffic.srcs/sources_1/new/` folder and add it to the project.

   6. Complete the traffic light code according to the following description.

      The controller contains six states and sets the semaphore outputs according to the following table. It remains in each of the states for a certain time.

      | **Current state** | **Direction South** | **Direction West** | **Delay** |
      | :-- | :-: | :-: | :-: |
      | `WEST_STOP`  | red    | red    | 2 sec |
      | `WEST_GO`    | red    | green  | 4 sec |
      | `WEST_WAIT`  | red    | yellow | 1 sec |
      | `SOUTH_STOP` | red    | red    | 2 sec |
      | `SOUTH_GO`   | green  | red    | 4 sec |
      | `SOUTH_WAIT` | yellow | red    | 1 sec |

2. Draw Moore-based state diagram according to the table. Note that, Moore's output(s) depends only on the present state.

3. In VHDL it is possible to define a new data type, which contains the names of our states.

   ```vhdl
   architecture behavioral of tlc is

     -- Define the FSM states
     type t_state is (
       WEST_STOP,
       WEST_GO,
       WEST_WAIT,
       SOUTH_STOP,
       SOUTH_GO,
       SOUTH_WAIT
     );

     -- Define the signal that uses different states
     signal sig_state : t_state;
   ...
   ```

   The FSM function is divided into two processes, where the first is sequential and it entirely controls state changes by CASE statement. The second is a combinatorial process, it is sensitive to state changes, and sets the output signals accordingly. This is an example of a Moore state machine because the output is set based on the active state. FSM behavior can be written in one to three processes. The differences between these approaches are described in [detail here](https://vhdlwhiz.com/n-process-state-machine/).

4. Complete CASE/WHEN statements in both sequential and combinatorial processes.

   **Sequential process:**

    ```vhdl
    --------------------------------------------------------
    -- p_traffic_fsm:
    -- A sequential process with synchronous reset and
    -- clock_enable entirely controls the sig_state signal
    -- by CASE statement.
    --------------------------------------------------------
    p_traffic_fsm : process (clk) is
    begin

      if (rising_edge(clk)) then
        if (rst = '1') then                    -- Synchronous reset
          sig_state <= WEST_STOP;              -- Init state
          sig_cnt   <= (others => '0');        -- Clear delay counter
        elsif (sig_en = '1') then
          -- Every 250 ms, CASE checks the value of sig_state
          -- local signal and changes to the next state 
          -- according to the delay value.
          case sig_state is

            when WEST_STOP =>
              -- Count to 2 secs
              if (sig_cnt < c_DELAY_2SEC) then
                sig_cnt <= sig_cnt + 1;
              else
                -- Move to the next state
                sig_state <= WEST_GO;
                -- Reset delay counter value
                sig_cnt   <= (others => '0');
              end if;

            when WEST_GO =>
              -- WRITE OTHER STATES HERE


            when others =>
              -- It is a good programming practice to use the
              -- OTHERS clause, even if all CASE choices have
              -- been made.
              sig_state <= WEST_STOP;
              sig_cnt   <= (others => '0');

          end case;

        end if; -- Synchronous reset
      end if; -- Rising edge
    end process p_traffic_fsm;
    ```

   **Combinatorial process:**

    ```vhdl
    --------------------------------------------------------
    -- p_output_fsm:
    -- A combinatorial process is sensitive to state
    -- changes and sets the output signals accordingly.
    -- This is an example of a Moore state machine and
    -- therefore the output is set based on the active
    -- state only.
    --------------------------------------------------------
    p_output_fsm : process (sig_state) is
    begin

      case sig_state is
        when WEST_STOP =>
          south <= c_RED;
          west  <= c_RED;

        when WEST_GO =>
          -- WRITE OTHER STATES HERE


        when others =>
          south <= c_RED;
          west  <= c_RED;
        end case;

      end process p_output_fsm;

    end architecture behavioral;
    ```

<a name="part4"></a>

## Part 4: Traffic light controller simulation

1. Perform the following steps to simulate traffic light controller.

   1. Create a VHDL [simulation source](https://www.edaplayground.com/x/5HBi) `tb_tlc`. Note that the maximum value of clock enable circuit is set to 1 for the simulation, ie the traffic light controller changes its state with a frequency of 100&nbsp;MHz and not 4&nbsp;Hz.
   2. Change the duration of simulation to `2000ns` in Vivado menu **Tools > Settings... > Simulation > Simulation**.
   3. Run the simulation, and verify that the controller works correctly (reset, timing, output lights, states).

      > To display internal signal values perform the followings:
      >
      > 1. Select `uut_tlc` in **Scope** folder.
      > 2. Right click to `sig_state` signal name in **Objects** folder.
      > 3. Add this signal by selecting **Add to Wave Window** command.
      > 4. Click to **Relaunch Simulation** icon.
      >
      >    ![Internal signals simulation](images/vivado_signals.png)

<a name="part5"></a>

## Part 5: Top level VHDL code

1. Perform the following steps to implement the traffic light controller on the Nexys A7 board.

   1. Create a new design source `top` in your project.

   2. Use **Define Module** dialog and define I/O ports of entity `top` as follows.

      | **Port name** | **Direction** | **Type** | **Description** |
      | :-: | :-: | :-- | :-- |
      | `CLK100MHZ` | in | `std_logic` | Main clock |
      | `LED16_R` | out | `std_logic` | South: Red |
      | `LED16_G` | out | `std_logic` | South: Green |
      | `LED16_B` | out | `std_logic` | South: Blue |
      | `LED17_R` | out | `std_logic` | West: Red |
      | `LED17_G` | out | `std_logic` | West: Green |
      | `LED17_B` | out | `std_logic` | West: Blue |
      | `BTNC` | in | `std_logic` | Synchronous reset |

   3. Use direct instantiation and define an architecture of the top level.

      ```vhdl
      ----------------------------------------------------------
      -- Architecture body for top level
      ----------------------------------------------------------

      architecture behavioral of top is

      begin
        --------------------------------------------------------
        -- Instance (copy) of tlc entity
        --------------------------------------------------------
        tlc : entity work.tlc
          port map (
            clk      => CLK100MHZ,
            south(2) => LED16_R,
            -- MAP OTHER RGB LEDS (SOUTH and WEST) HERE


            west(0)  => LED17_B,
            rst      => BTNC
          );

      end architecture behavioral;
      ```

   4. Create a new [constraints XDC](https://raw.githubusercontent.com/Digilent/digilent-xdc/master/Nexys-A7-50T-Master.xdc) file: `nexys-a7-50t` and uncomment used pins according to top entity.

   5. Compile the project and download the generated bitstream `traffic/traffic.runs/impl_1/top.bit` into the FPGA chip.

   6. Observe the functionality of the traffic light controller.

      ![Nexys A7 board](images/nexys_a7_traffic.jpg)

   7. Use **IMPLEMENTATION > Open Implemented Design > Schematic** to see the generated structure.

