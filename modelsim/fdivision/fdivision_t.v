`timescale 1 ns/1 ns
`define clk_cycle 50
module fdivision_t;
  reg F10M,RESET;
  wire F500K_clk;
  always #`clk_cycle F10M=~F10M;
  initial
  begin
    RESET=1;
    F10M=0;
    #100 RESET=0;
    #100 RESET=1;
    #10000 $stop;
  end
  fdivision fdivision(.RESET(RESET),.F10M(F10M),.F500K(F500K_clk));
endmodule

