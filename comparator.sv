module comparator (
  input a,
  input b,
  output [1:0] result
);
  result[1] = ~(a^b);
  result[0] = (~a)&b;
endmodule
