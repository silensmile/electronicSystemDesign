`timescale 1ns/1ns
`define clk_cycle 50

module sort_way2_t;
  reg [7:0] a;
  wire [7:0] ra,rb,rc,rd;
  reg clk,reset;

  always #`clk_cycle clk= ~clk;
  initial
    begin
      a=0;
      clk=0;
      reset =1;
      #10  reset=0;
      #110 reset=1;

      repeat(50)
        begin
          #100 a={$random}%256;
        end
      #100  $stop;
    end

    sort_way2 sort_way2(clk,reset,ra,rb,rc,rd,a);

  endmodule

