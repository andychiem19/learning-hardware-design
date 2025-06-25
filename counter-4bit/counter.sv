module counter(
  input wire 		clock,
  input wire 		reset,
  input wire 		enable,
  output reg [3:0] 	counter_out
);
  
  always @(posedge clock) begin: COUNTER
      if (reset == 1'b1) begin
        counter_out <= 4'b0000;
      end
      else if (enable == 1'b1) begin
        counter_out <= counter_out + 1;
      end
    end
endmodule
