module predictor(input wire request, result, clk, taken, output reg prediction);

  reg [1:0] str_conter = 2'd3;
  always @(posedge clk) begin
    if (request)begin
      if (str_conter <2'd2)begin
        prediction = 0;
      end
      else begin 
        prediction = 1;
      end
    end
    else
      begin
        if(result)begin
          if(taken && str_conter < 2'd3)begin
            str_conter <=str_conter +1;
          end
          else if(str_conter != 2'd0 && !taken)
            begin
              str_conter <=str_conter -1;
            end
        end
      end
    end

endmodule
