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
