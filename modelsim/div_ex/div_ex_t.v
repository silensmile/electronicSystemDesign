`timescale 1ns/1ns
`define clk_cycle 50
module div_ex_t;
  reg clk,rst;
  wire out;
  
  always  #`clk_cycle clk=~clk;
  initial
    begin
        clk=0;
        rst=1;
      #10 rst=0;
      #110 rst=1;
      #600000  $stop;
    end
    
    div_ex m(.rst(rst),.clk(clk),.out(out));
  endmodule


