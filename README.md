# 🚦 Traffic Light Controller (Verilog)

This project implements a simple finite state machine (FSM)-based traffic light controller using Verilog HDL. It simulates a single-road signal system with three lights: Red, Yellow, and Green. The controller cycles through these lights with fixed timing intervals.

---

## 🔧 Features

- FSM-based design with three states: RED, GREEN, YELLOW
- Fixed timing intervals using a counter
- Modular and readable Verilog code
- Testbench with waveform generation (`.vcd`)
- Easily extensible to multi-road or sensor-based systems

---

## 🧠 FSM Design

### States:
- `RED_STATE`: Red light ON for 5 clock cycles
- `GREEN_STATE`: Green light ON for 5 clock cycles
- `YELLOW_STATE`: Yellow light ON for 2 clock cycles

### Transitions:
```
RED_STATE → GREEN_STATE → YELLOW_STATE → RED_STATE
```

### FSM Diagram:

```
        +-----------+       +------------+       +--------------+
        |           |       |            |       |              |
        | RED_STATE | ----> | GREEN_STATE| ----> | YELLOW_STATE |
        |           |       |            |       |              |
        +-----------+       +------------+       +--------------+
             ↑                                          |
             |__________________________________________|


---
```
## 📂 File Structure

```
traffic_light_controller/
├── traffic_light_controller.v   # Main FSM module
├── tb_traffic_light_controller.v # Testbench
├── traffic_light.vcd            # Waveform output (after simulation)
└── README.md                    # Project documentation
```

---

## 🚀 Simulation Instructions

1. Open [EDA Playground](https://www.edaplayground.com/) or use ModelSim/GTKWave.
2. Paste `traffic_light_controller.v` and `tb_traffic_light_controller.v` into respective panes.
3. Run the simulation and view `traffic_light.vcd` waveform.
4. Observe transitions every few clock cycles:
   - RED → GREEN → YELLOW → RED

---

## 📈 Extensibility Ideas

- Add pedestrian signals or countdown timers
- Use sensors for adaptive timing
- Expand to 4-way intersection with priority logic
- Integrate with FPGA board for real-world demo
