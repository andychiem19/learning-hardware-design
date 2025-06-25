**Retro Vending Machine**

A modular Verilog/SystemVerilog based vending machine FSM intended for FPGA simulation. Accepts multiple coin inputs, tracks total value, and triggers a dispense signal once sufficient funds are collected.

---

**Features**
- Finite State Machine with IDLE, COLLECTING, and DISPENSING states
- Modular design: separated coin accumulator and vending logic
- Simulated coin inputs (5¢, 10¢, 25¢)
- Timed dispense when threshold is reached
- Testbench with EPWave signal dump

---

**Future Extensions**

- Implement multiple item selection for real-world analog
- Implement error states and a system for returning change
- Integrate pixel-based text video output using onboard SoC CPU
- Deploy on Zynq FPGA with stylized UI

---

**Why this project?**

This project demonstrates my ability to:
- Design synchronous FSMs in Verilog 2001
- Cleanly separate sequential and combinational logic
- Use testbenches to verify and debug simulated hardware
- Apply modular design principles to ensure hardware is easy to understand and update in future iterations
- Translate RTL designs into FPGA implementations



