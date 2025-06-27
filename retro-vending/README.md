<h3 align="center">Retro Vending Machine</h3>
<p align="center">by Andy Chiem</p>

A Verilog/SystemVerilog based vending machine FSM intended for FPGA simulation. Accepts multiple coin inputs, tracks total value, and triggers a dispense signal once sufficient funds are collected.

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

**Learning Objectives**

- RTL design and FSM implementation
- Modular Verilog code structure
- Edge detection and debounce techniques
- Handling simultaneous asynchronous inputs
- Simulation-based debugging
- RTL-to-hardware mapping and FPGA realization

---

**Simulation Instructions**

- Install GTKWave, Icarus Verilog 12.0, and VS Code
- [Install the module files here](src)
- Run the following command in the Powershell terminal

```powershell
iverilog -g2012 -o sim.out retro-vending-master.sv (testbench-filename-here.sv); vvp sim.out; if (Test-Path "retro_vending.vcd") { Start-Process gtkwave "retro_vending.vcd" }
```

**Making your own testbenches**

You may want to simulate your own scenarios, so an example testbench is attached here with some example code.

```verilog
`timescale 1ns / 1ps 

module retro_vending_tb;

  reg clk;
  reg reset;
  reg coin_5;
  reg coin_10;
  reg coin_25;
  reg select;
  reg next_item;
  wire dispense;

  retro_vending uut (
    .clk(clk),
    .reset(reset),
    .coin_5(coin_5),
    .coin_10(coin_10),
    .coin_25(coin_25),
    .select(select),
    .dispense(dispense),
    .next_item(next_item)
  );

  always #5 clk = ~clk;

  initial begin
    
    $dumpfile("retro_vending.vcd");
    $dumpvars;

    clk = 0;
    reset = 1;
    next_item = 0;
    coin_5 = 0;
    coin_10 = 0;
    coin_25 = 0;
    select = 0;

    #100 reset = 0;

    /* USER CODE GOES HERE 

    //example of inserting a coin
    #50 coin_10 = 1
    #10 coin_10 = 0

    //example of scrolling through items
    #50 next_item = 1
    #10 next_item = 0
 
    // select
    #100 select = 1;
    #100 select = 0;

    */

    // wait a little to observe output
    #100;

    $finish;
  end

endmodule
```
