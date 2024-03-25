module adder #(parameter WIDTH = 1) (
  input clk,
  input c_in,
  input [WIDTH-1:0] a,
  input [WIDTH-1:0] b,
  output [WIDTH-1:0] sum,
  output c_out
  );
  
  wire [WIDTH:0] result;
  assign result = a + b + c_in;

  assign sum = result[WIDTH-1:0];
  assign c_out = result[WIDTH];
endmodule
