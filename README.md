
# 🚦 Traffic Light Controller Using Verilog

## Overview  
This repository contains a Verilog implementation of a finite state machine (FSM) to control a traffic light system. The design simulates the operation of a single-road signal system with three lights: Red, Green, and Yellow. The controller cycles through these lights with fixed timing intervals. The project includes a comprehensive testbench to verify the FSM's behavior under various timing scenarios, with waveform generation for debugging.  
- For this project we are using a **Moore Model**.

## Access Project at EDAPlayground  
Visit the [EDA Playground link](https://edaplayground.com/x/iN2U) to directly access the code.

## Project Structure  
- **Design File**: `traffic_light_controller.v`  
  - Contains the main module `traffic_light_controller`, which implements the FSM.
- **Testbench File**: `tb_traffic_light_controller.v`  
  - Contains the testbench module `tb_traffic_light_controller`, which tests the design under multiple timing scenarios and generates a VCD file for waveform viewing.
- **Timescale**: ``timescale 10ns / 1ps``  
  - Time unit: 10 ns (10,000 ps), precision: 1 ps.

## State Diagram  
The state diagram visually represents the **finite state machine (FSM)** controlling the traffic light. Each state corresponds to a **specific light phase**, and **transitions occur** based on a timing counter. By examining the diagram, one can easily understand the flow of operations and the logic behind each transition.  
[STATE DIAGRAM](https://photos.app.goo.gl/GGowGGgkB6E9eaRC7)

## Module Description

### `traffic_light_controller`  
- **Purpose**: Controls a traffic light system using an FSM with fixed timing intervals.

- **Inputs**:

| Signal   | Description                             |
|----------|-----------------------------------------|
| `clk`    | Clock signal for synchronous operation  |
| `reset`  | Active-high reset to initialize the FSM |

- **Outputs**:

| Signal   | Description                             |
|----------|-----------------------------------------|
| `red`    | Red light ON when in RED state          |
| `yellow` | Yellow light ON when in YELLOW state    |
| `green`  | Green light ON when in GREEN state      |

- **States**:

| State         | Code   | Description                      |
|---------------|--------|----------------------------------|
| `RED_STATE`   | 2'b00  | Red light ON for 5 cycles        |
| `GREEN_STATE` | 2'b01  | Green light ON for 5 cycles      |
| `YELLOW_STATE`| 2'b10  | Yellow light ON for 2 cycles     |

### `tb_traffic_light_controller`  
- **Purpose**: Tests the `traffic_light_controller` module under various timing scenarios.

- **Features**:
  - Generates a VCD file (`traffic_light.vcd`) for waveform viewing.
  - Monitors internal state (`current_state`) and all outputs.
  - Tests multiple timing transitions and reset behavior.

- **Test Cases**:
  1. **Normal Cycle**: RED → GREEN → YELLOW → RED, with correct timing intervals.
  2. **Reset During RED**: Reset asserted during RED state, FSM returns to RED.
  3. **Reset During GREEN**: Reset asserted during GREEN state, FSM returns to RED.
  4. **Reset During YELLOW**: Reset asserted during YELLOW state, FSM returns to RED.
  5. **Multiple Cycles**: FSM completes multiple full cycles with correct light transitions.

## Waveform  
The following is a reference waveform generated from the `tb_traffic_light_controller` testbench using Siemens QuestaSim on EDA Playground. It shows the behavior of all signals and the internal state (`current_state`) across the test cases.  

[Waveform Reference](https://photos.app.goo.gl/mE155VKnE6wHFDzP8)

## Analyze Waveforms  
- Verify key events:
  - **Test Case 1**: Observe RED → GREEN → YELLOW → RED transitions every few clock cycles.
  - **Test Case 2–4**: FSM resets to RED state regardless of current state.
  - **Test Case 5**: FSM completes multiple cycles with correct timing.

- Use EPWave’s time axis (set to ps) to zoom into specific transitions and verify light durations.
- Here i used new site for VCD viewer by uploading `traffic_light.vcd` on [Site](https://vc.drom.io/).

### 📁 Using Input Files on EDA Playground

To simulate with external data (e.g., test vectors or expected outputs), EDA Playground allows you to upload and read text files directly in your testbench.

### 🔹 Steps to Add an Input File

1. Click **“Add file”** in the EDA Playground editor.
2. Name the file (e.g., `input.txt`) and paste your data:
   ```
   Time(ns)   Red   Yellow   Green
   0          1     0        0
   100        0     0        1
   200        0     1        0
   ```
3. In your testbench, use `$fopen` and `$fscanf` to read the file:
   ```verilog
   integer data_file;
   data_file = $fopen("input.txt", "r");
   scan_file = $fscanf(data_file, "%d %d %d %d\n", time_ns, expected_red, expected_yellow, expected_green);
   ```

4. Use the read values to drive or verify your DUT behavior.

> ✅ Tip: Always check if the file opened successfully and skip header lines if needed.

[OUTPUT WAVEFORM](https://photos.app.goo.gl/uFUbvNWqBUbHmPVF8)


## Usage  
- Clone or download this repository.
- Open EDA Playground via the provided [link](https://edaplayground.com/x/iN2U) or upload the Verilog files.
- Follow the simulation steps above to run and analyze the testbench.
- Use the waveform viewer to debug state transitions and output behavior.

## Notes  
- The design assumes a 10 ns clock period (5 ns high, 5 ns low).
- The testbench is designed to be comprehensive, covering normal operation and reset conditions.
- For further customization, modify the testbench delays or add new test cases in `tb_traffic_light_controller`.
