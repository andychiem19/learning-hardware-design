<h3 align="center">Retro Vending Machine</h3>
<p align="center">by Andy Chiem</p>

A Verilog/SystemVerilog based vending machine FSM intended for FPGA simulation. Accepts multiple coin inputs, tracks total value, and triggers a dispense signal once sufficient funds are collected.

---

**Tools Used**

`Visual Studio Code`
`Verilog/SystemVerilog`
`Icarus Verilog 12.0`
`GTKWave`

---

**Project Features**

- Finite State Machine with IDLE, COLLECTING, and DISPENSING states
- Scrolling item selection; four distinct items with unique prices
- Modular design; cleanly separated logic for vending, coin accumulation, and edge detection processes
- Debounced inputs for hardware synthesis (edge detection)
- Simulated coin inputs (5¢, 10¢, 25¢)

*Planned Features*

- Change return logic
- Pixel-based text video output using onboard SoC CPU and external monitor
- Deployment on Zynq FPGA with stylized UI
  
---

**Simulation Instructions**

- Install GTKWave, Icarus Verilog 12.0, and VS Code
- [Install the files here](retro-vending/src)
- Run the following command in the Powershell terminal

```ruby
iverilog -g2012 -o sim.out retro-vending-master.sv (testbench-filename-here.sv); vvp sim.out; if (Test-Path "retro_vending.vcd") { Start-Process gtkwave "retro_vending.vcd" }
```

---

**Learning Objectives**

This project was designed to reinforce concepts in:
- RTL design and FSM implementation
- Modular Verilog code structure
- Edge detection and debounce techniques
- Handling simultaneous asynchronous inputs
- Simulation-based debugging
- RTL-to-hardware mapping and FPGA realization



