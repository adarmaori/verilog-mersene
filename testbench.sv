module testbench (
  
);
  
  reg [7:0] val_a;
  reg [7:0] val_b;
  reg [7:0] sum;
  reg [3:0] bit_count;
  reg clk;

  reg carry_in;
  wire carry;
  wire inp_a;
  wire inp_b;
  wire out_sum;

  assign inp_a = val_a[0];
  assign inp_b = val_b[0];

  adder uut (
      .clk (clk),
      .a (inp_a),
      .b (inp_b),
      .c_in (carry_in),
      .sum (out_sum),
      .c_out (carry)
    );

  initial begin
    carry_in <= 0;
    clk <= 0;
    val_a <= 8'd55;
    val_b <= 8'd17;
    sum <= 0;
    bit_count <= 0;
    #100 $finish;
  end

  always #5 clk <= ~clk;

  always @ (posedge clk) begin
    $display("A: %b, B: %b, C_IN: %b -> SUM: %b, C_OUT: %b", inp_a, inp_b, carry_in, out_sum, carry);
    if (bit_count != 8) begin
      sum = sum | (out_sum << 7);
      sum = sum >> 1;
      val_a = val_a >> 1;
      val_b = val_b >> 1;
      bit_count = bit_count + 1;
      carry_in = carry;
    end else begin
      $display("DONE: %b", sum);
    end
  end
  
endmodule
