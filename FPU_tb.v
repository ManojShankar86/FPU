module FPU(a, b, sel, y,overflow ,underflow ,invalid_op);
  input [7:0] a, b;
  input [1:0] sel;
  output reg [15:0] y;
  output reg overflow ,underflow ,invalid_op;
  initial begin
    overflow = 0;
    underflow = 0;
    invalid_op = 0;
  end
  parameter MAX_EXP = 8'hFE;
  parameter MIN_EXP = 8'h01;
  
  always @(*) begin
    overflow = 0;
    underflow = 0;
    invalid_op = 0;
    case(sel) 
      2'b00:y = a+b;
      2'b01:y = a-b;
      2'b10:y = a*b;
      2'b11:y = a/b;
      default: begin y = 0;invalid_op = 1;end
    endcase
    if( a > MAX_EXP) begin
      overflow = 1;
    end else begin
      overflow = 0;
    end
    if( a < MIN_EXP && b != 0) begin
        underflow = 1;
      end else begin
        underflow = 0;
      end
  end
  
  
endmodule
