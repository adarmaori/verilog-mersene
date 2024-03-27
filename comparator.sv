module comparator (
  input a,
  input b,
  output [1:0] result
);
  assign result[1] = ~(a^b);
  assign result[0] = (~a)&b;
endmodule
