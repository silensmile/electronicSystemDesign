`timescale 10ms/10ms
module test_light_All;
	reg clk10,rst;
	reg[2:0] up,down;
	wire[2:0] swh;
	wire[2:0] light;

	parameter HALF_PERIOD = 5;

	always #HALF_PERIOD clk10=~clk10;		//0.1秒一个周期

	initial
		begin
			clk10 = 0;
			rst = 1;
			up = 3'b000;down = 3'b000;
			#1 rst = 0;
			#10 rst = 1;
			#200 up = 3'b001;
			#200 up = 3'b010;
			#200 up = 3'b100;
			#200 up = 3'b000;
			#2000 up = 3'b001; down = 3'b000;
			#500 up = 3'b010; down = 3'b100;
			#600 up = 3'b011; down = 3'b010;
			#30 up = 3'b010;
			#30 up = 3'b011;
			#900 up = 3'b010; down = 3'b001;
			#500 up = 3'b101; down = 3'b001;
			#600 up = 3'b000; down = 3'b101;
			#80 down = 3'b111;
			#30 down = 3'b101;
			#100 up = 3'b011; down = 3'b010;
			#500 up = 3'b100; down = 3'b101;
			#500 up = 3'b101; down = 3'b000;
			#600 up = 3'b010; down = 3'b110;
			#100 up = 3'b111; down = 3'b001;
			#2000 up = 3'b000; down = 3'b000;
			#100 $stop;
		end

	assign swh = up | down;

	light_All m5(clk10,rst,swh,light);
endmodule

