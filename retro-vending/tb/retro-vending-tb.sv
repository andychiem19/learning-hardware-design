`timescale 1ns / 1ps 

module retro_vending_tb;

  reg clk;
  reg reset;
  reg coin_5;
  reg coin_10;
  reg coin_25;
  reg select;

  wire dispense;

  retro_vending uut (
    .clk(clk),
    .reset(reset),
    .coin_5(coin_5),
    .coin_10(coin_10),
    .coin_25(coin_25),
    .select(select),
    .dispense(dispense)
  );

  always #5 clk = ~clk;

  initial begin
    
    $dumpfile("retro_vending.vcd");
    $dumpvars;

    clk = 0;
    reset = 1;
    coin_5 = 0;
    coin_10 = 0;
    coin_25 = 0;
    select = 0;

    #100 reset = 0;

    // Back-to-back pulses
    #100 coin_10 = 1;
    #10 coin_10 = 0;
    #10 coin_10 = 1;
    #10 coin_10 = 0;

    #100 reset = 1;
    #10 reset = 0;

    // Overlapping coins
    #100 coin_5 = 1;
    #0   coin_10 = 1; // Both go high on same time
    #10  coin_5 = 0;
    #0   coin_10 = 0;

    #100 reset = 1;
    #10 reset = 0;

    // Simulating noise
    #200 coin_25 = 1;
    #2   coin_25 = 0;
    #2   coin_25 = 1;
    #2   coin_25 = 0;
    #2   coin_25 = 1;
    #10  coin_25 = 0;

    #100 reset = 1;
    #10 reset = 0;

    // Selecting early
    #100 coin_25 = 1; #10 coin_25 = 0;
    #50 select = 1;   // select before second coin
    #50 coin_25 = 1; #10 coin_25 = 0;
    #50 select = 0;

    #100 reset = 1;
    #10 reset = 0;

    #100 select = 1;
    #100 select = 0;

    // wait a little to observe output
    #100;

    $finish;
  end

endmodule
