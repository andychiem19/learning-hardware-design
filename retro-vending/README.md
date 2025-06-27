### Retro Vending Machine
A Verilog/SystemVerilog based vending machine FSM intended for FPGA simulation. Accepts multiple coin inputs, tracks total value, and triggers a dispense signal once sufficient funds are collected.

**Tools Used**

`Visual Studio Code`
`Verilog/SystemVerilog`
`Icarus Verilog 12.0`
`GTKWave`

---

#### **Project Features**

| Feature | Description |
|--------|-------------|
| Finite State Machine | Implements `IDLE`, `COLLECTING`, and `DISPENSING` states |
| Item Selection | Scrolling selector with four unique item-price pairs |
| Modular Design | Separated logic for vending, coin accumulation, and edge detection |
| Debounced Inputs | Edge-detected coin/button inputs for hardware synthesis compatibility |
| Simulated Coins | Accepts 5¢, 10¢, and 25¢ pulses via testbench |

*Planned Features* 
| Feature | Description |
|--------|-------------|
| Change Return | Implement logic for dispensing leftover change |
| Pixel Display | Text-based video output using onboard SoC CPU + external monitor |
| FPGA Deployment | Final implementation on Zynq board with a stylized UI |

  
---

#### **Learning Objectives**

`RTL design and FSM implementation`
`Modular Verilog code structure`
`Edge detection and debounce techniques`\
`Handling simultaneous asynchronous inputs`
`Simulation-based debugging`
`RTL-to-hardware mapping and FPGA realization`

---

#### **Simulation Instructions**

1. Install GTKWave, Icarus Verilog 12.0, and VS Code
2. [Install the module files here](src)
3. [Install a testbench](tb) or [make your own](#make-your-own)
4. Run the following command in the Powershell terminal

```powershell
# List all module files and your desired testbench file names as shown (removing parentheses)
iverilog -g2012 -o sim.out (other-filename-here.sv testbench-filename-here.sv); vvp sim.out; if (Test-Path "retro_vending.vcd") { Start-Process gtkwave "retro_vending.vcd" }
```
<a>
<a name="make-your-own"></a>
  
#### **Making your own testbenches**

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
