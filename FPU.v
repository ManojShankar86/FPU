module alu_tb_FPU;
  reg a,b,sel;
  wire y;
  
  FPU uut(.a(a),.b(b),.sel(sel),.y(y));
  
  initial begin
    a = 8'b1100;
    b = 8'b0011;
    sel = 2'b00;
    #2;
    a = 8'b1100;
    b = 8'b0011;
    sel = 2'b01;
    #2;
    a = 8'b1100;
    b = 8'b0011;
    sel = 2'b10;
    #2;
    a = 8'b1100;
    b = 8'b0011;
    sel = 2'b11;
    #2;
    a = 16'b11111111;
    b = 16'b11111111;
    sel = 2'bxx;
    #1000 $finish;
  end
initial begin
  $dumpfile("alu.vcd");
  $dumpvars;
end
  
endmodule