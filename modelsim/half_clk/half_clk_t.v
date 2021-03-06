`timescale 1ns/100ps
`define clk_cycle 50

module half_clk_t;
reg clk, reset;
wire clk_out;

always #`clk_cycle clk = ~clk;

initial
	begin
				clk = 0;
				reset = 1;
		# 10 reset = 0;
		# 110 reset = 1;
		# 100000 $stop;
	end

	half_clk m0(.reset(reset), .clk_in(clk), .clk_out(clk_out));
endmodule
