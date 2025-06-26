**Retro Vending Machine**  
*Verilog/SystemVerilog implementation*

A modular Verilog/SystemVerilog based vending machine FSM intended for FPGA simulation. Accepts multiple coin inputs, tracks total value, and triggers a dispense signal once sufficient funds are collected.

---

**Tools Used**

- Verilog/SystemVerilog
- Icarus Verilog 12.0
- GTKWave
- Visual Studio Code

---

**⚙Project Features**

- Finite State Machine with IDLE, COLLECTING, and DISPENSING states
- Modular design; cleanly separated logic for vending, coin accumulation, and edge detection processes
- Debounced inputs for hardware synthesis (edge detection)
- Simulated coin inputs (5¢, 10¢, 25¢)
- Testbench with edge cases

---

**Planned Features**

- Multiple item selection with unique prices
- Error states and change return logic
- Pixel-based text video output using onboard SoC CPU and external monitor
- Deployment on Zynq FPGA with stylized UI

---

**Learning Objectives**

This project was designed to reinforce concepts in:
- RTL design and FSM implementation
- Modular Verilog code structure
- Edge detection and debounce techniques
- Handling simultaneous asynchronous inputs
- Simulation-based debugging
- RTL-to-hardware mapping and FPGA realization



