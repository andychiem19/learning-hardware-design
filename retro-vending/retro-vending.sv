module retro_vending (
  input clk,
  input reset,
  input coin_5,
  input coin_10,
  input coin_25,
  input select,
  output reg [0:0] dispense
);
  
  wire [6:0] total;
  
  parameter 	IDLE = 2'b00, 
				COLLECTING = 2'b01,
  				DISPENSING = 2'b10;
  
  coin_accumulator coin_inst (
    .clk(clk),
    .reset(reset),
    .coin_5(coin_5),
    .coin_10(coin_10),
    .coin_25(coin_25),
    .clear(state == DISPENSING),
    .total(total)
  );

  reg [1:0] state, next_state;
  
  always @(posedge clk or posedge reset) begin
    if (reset)
      state <= IDLE;
    else
      state <= next_state;
  end
  
  always @(*) begin
    next_state = state;
    
    case(state)
      IDLE:
        if (coin_5 || coin_10 || coin_25)
          next_state <= COLLECTING; 
      
      COLLECTING:
        if (select && total >= 50) 
          next_state <= DISPENSING; 
      
      DISPENSING: 
      	next_state = IDLE; 
      
    endcase
  end
  
  always @(posedge clk or posedge reset) begin
  	if (reset)
    	dispense <= 0;
    else if (state == DISPENSING)
    	dispense <= 1;
    else
      	dispense <= 0;
  end
endmodule

module coin_accumulator (
  input clk,
  input reset,
  input clear,
  input coin_5,
  input coin_10,
  input coin_25,
  output reg [6:0] total
);
  
  always @(posedge clk or posedge reset) begin
    if (reset || clear)
      total <= 0;
    else if (coin_5)
      total <= total + 5;
    else if (coin_10)
      total <= total + 10;
    else if (coin_25)
      total <= total + 25;
  end
endmodule
 
    
