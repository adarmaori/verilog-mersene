module divisibility_checker (
  input clk
);
  
  // State Machine params
  parameter S_COMP = 0; // Comparing the divisor and divident
  parameter S_SUB = 1; // Subtracting whatever from whatever else
  parameter S_END = 2; // The final verdict

  reg [1:0] state = 0;


  parameter NUMBER_LENGTH = 9;

  // Divisor and divident are representen in reverse (so MSB is actually LSB).
  reg [NUMBER_LENGTH-1:0] divisor = 9'd14;
  reg [NUMBER_LENGTH-1:0] divident = 9'd503;
  
  reg [10:0] index = 0; // This will eventually be chunk index

  reg comp_bit_divident;
  reg comp_bit_divisor;
  reg [1:0] comp_result;

  reg sub_res = 0;
  reg borrow = 0;
  reg sub_a = 0;
  reg sub_b = 0;

  always @ (posedge clk) begin
    case (state)
      S_COMP: begin
        comp_bit_divident = divident[NUMBER_LENGTH-index-1]; // This will eventually be a memory fetch
        comp_bit_divisor = divisor[NUMBER_LENGTH-index-1]; // This will eventually be a memory fetch
        comp_result = {comp_bit_divisor == comp_bit_divident, comp_bit_divident > comp_bit_divisor};
        case (comp_result)
          2'b01: begin 
            $display("Switching to SUB mode");
            index = 0;
            state = S_SUB;
          end
          2'b00: begin 
            $display("Switching to END mode");
            state = S_END;
            index <= 0;
          end
          default : begin
            index <= index + 1;
          end
        endcase

      end
      S_SUB: begin
        sub_a = divident[index];
        sub_b = divisor[index];

        sub_res = (sub_a^sub_b)^borrow;
        borrow = (~sub_a)&sub_b | borrow&(~(sub_a^sub_b));
        divident[index] = sub_res;
        if (index == NUMBER_LENGTH-1) begin
          state = S_COMP;
          $display("Switching to COMP mode");
          index = 0;
        end else begin
          index = index + 1;
        end
      end
      default : begin
        $display("Total mod: %d", divident);
      end

    endcase
  end
  
endmodule
