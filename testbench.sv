module testbench (
  
);
  
  reg clk = 0;

  divisibility_checker uut (
    .clk (clk)
    );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
    #10000 $finish;
  end

  always #5 clk <= ~clk;
endmodule
