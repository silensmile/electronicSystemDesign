`timescale  1ns/1ns
`define clk_cycle 50

module tryfunct_t;
  reg[3:0] n,i;
  reg reset,clk;
  wire[31:0]  result;
  
  initial
  begin
    clk=0;
    n=0;
    reset=1;
    #100  reset=0;
    #100  reset=1;
    for(i=0;i<=15;i=i+1)
    //begin
      #200  n=i;
    //end
    #100  $stop;
  end
  
  always #`clk_cycle  clk=~clk;
  
  tryfunct tryfunct(clk,n,result,reset);
  
endmodule
