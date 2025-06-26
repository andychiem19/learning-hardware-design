module edge_detector_25  ( //Edge detector/debouncer for 25¢
  input clk,
  input reset,
  input in_signal_25,
  output reg pulse_25
);

reg prev_signal_25;

always @(posedge clk or posedge reset) begin
  if (reset) begin
    prev_signal_25 <= 0;
    pulse_25 <= 0;
  end 
  else begin
    pulse_25 <= (in_signal_25 && !prev_signal_25);
    prev_signal_25 <= in_signal_25;
  end
end
endmodule

module edge_detector_10  ( //Edge detector/debouncer for 10¢
  input clk,
  input reset,
  input in_signal_10,
  output reg pulse_10
);

reg prev_signal_10;

always @(posedge clk or posedge reset) begin
  if (reset) begin
    prev_signal_10 <= 0;
    pulse_10 <= 0;
  end 
  else begin
    pulse_10 <= (in_signal_10 && !prev_signal_10);
    prev_signal_10 <= in_signal_10;
  end
end
endmodule

module edge_detector_5  ( //Edge detector/debouncer for 5¢
  input clk,
  input reset,
  input in_signal_5,
  output reg pulse_5
);

reg prev_signal_5;

always @(posedge clk or posedge reset) begin
  if (reset) begin
    prev_signal_5 <= 0;
    pulse_5 <= 0;
  end 
  else begin
    pulse_5 <= (in_signal_5 && !prev_signal_5);
    prev_signal_5 <= in_signal_5;
  end
end
endmodule
