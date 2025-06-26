module coin_accumulator ( // Logic for accumulation of currency
  input clk,
  input reset,
  input clear,
  input coin_5,
  input coin_10,
  input coin_25,
  output reg [6:0] total
);

  reg pulse_25;

  // Ports of edge detectors
  edge_detector_25 edge_25 (
    .clk(clk),
    .reset(reset),
    .in_signal_25(coin_25),
    .pulse_25(pulse_25)
  );

  edge_detector_10 edge_10 (
    .clk(clk),
    .reset(reset),
    .in_signal_10(coin_10),
    .pulse_10(pulse_10)
  );

  edge_detector_5 edge_5 (
    .clk(clk),
    .reset(reset),
    .in_signal_5(coin_5),
    .pulse_5(pulse_5)
  );
  
  always @(posedge clk or posedge reset) begin
    if (reset || clear)
      total <= 0;
    else 
      total <= total  + (pulse_5 ? 7'd5 : 7'd0) 
                      + (pulse_10 ? 7'd10 : 7'd0)
                      + (pulse_25 ? 7'd25 : 7'd0); //Constantly adds the enabled pulses on positive clock edges
                      
  end
endmodule
