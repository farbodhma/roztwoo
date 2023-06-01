module predictor(
  input wire request,  // Prediction request
  input wire result,   // Result to predict
  input wire clk,      // Clock
  input wire taken,    // Whether the previous result was taken or not
  output reg prediction // Predicted result
);

  reg prev_taken;      // Previous result

  always @(posedge clk) begin
    if (request) begin
      if (prev_taken) begin
        prediction <= 1; // Predict taken
      end else begin
        prediction <= 0; // Predict not taken
      end
      prev_taken <= taken; // Store the current result
    end
  end

endmodule
