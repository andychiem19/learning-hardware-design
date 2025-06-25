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
    $dumpvars(0, retro_vending_tb.clk);
  	$dumpvars(0, retro_vending_tb.reset);
  	$dumpvars(0, retro_vending_tb.coin_25);
  	$dumpvars(0, retro_vending_tb.select);
    $dumpvars(0, retro_vending_tb.dispense);
    $dumpvars(0, retro_vending_tb.uut.coin_inst.total);
    $dumpvars(0, retro_vending_tb.uut.state);
    $dumpvars(0, retro_vending_tb.uut.next_state);

    clk = 0;
    reset = 1;
    coin_5 = 0;
    coin_10 = 0;
    coin_25 = 0;
    select = 0;

 //coin signals must be held for 10 ns for now
    #100 reset = 0;

    #100 coin_25 = 1;
    #10 coin_25 = 0;

    #100 coin_25 = 1;
    #10 coin_25 = 0;

    #100 select = 1;
    #100 select = 0;

    // wait a little to observe output
    #100;

    $finish;
  end

endmodule
