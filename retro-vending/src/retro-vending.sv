module retro_vending ( // Main vending logic
  input clk,
  input reset,
  input coin_5,
  input coin_10,
  input coin_25,
  input select,
  output reg [0:0] dispense
);

  wire [6:0] total;
  reg [1:0] state, next_state;

	// Defines the states for the FSM
  parameter 	IDLE = 2'b00, COLLECTING = 2'b01, DISPENSING = 2'b10;

	// Creates an instance of coin_accumulator in retro_vending
  coin_accumulator coin_inst (
    .clk(clk),
    .reset(reset),
    .coin_5(coin_5),
    .coin_10(coin_10),
    .coin_25(coin_25),
    .clear(state == DISPENSING),
    .total(total)
  );
  
	// State transition logic
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
  
	// Sends dispense signal
  always @(posedge clk or posedge reset) begin
  	if (reset)
    	dispense <= 0;
    else if (state == DISPENSING)
    	dispense <= 1;
    else
      	dispense <= 0;
  end
endmodule
