`timescale 1ns/1ns

module band8_selector_t;
  reg[3:0] in0,in1,in2,in3,in4,in5,in6,in7;
  reg[2:0] ctrl;
  wire[3:0] out;
  reg clk;
  initial
    begin
     clk=0;
     ctrl={$random}%8;
     in0={$random}%16;
     in1={$random}%16;
     in2={$random}%16;
     in3={$random}%16;
     in4={$random}%16;
     in5={$random}%16;
     in6={$random}%16;
     in7={$random}%16;
     #10000  $stop;
    end
    always #50 clk=~clk; 
  always @(posedge clk)
    begin
      ctrl={$random}%8;
      in0={$random}%16;
     in1={$random}%16;
     in2={$random}%16;
     in3={$random}%16;
     in4={$random}%16;
     in5={$random}%16;
     in6={$random}%16;
     in7={$random}%16;
     end
     
  band8_selector m(in0,in1,in2,in3,in4,in5,in6,in7,out,ctrl);
endmodule 

