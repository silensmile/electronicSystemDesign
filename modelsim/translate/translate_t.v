`timescale 1ns/1ns

module translate_t;
	reg[3:0] in;
	wire[6:0] out;
	reg clock;
	// initial
	// begin
	// 	in = 4'b0000;
	// 	#100 in = 4'b0001;
	// 	#100 in = 4'b0010;
	// 	#100 in = 4'b0011;
	// 	#100 in = 4'b0100;
	// 	#100 in = 4'b0101;
	// 	#100 in = 4'b0111;
	// 	#100 in = 4'b1000;
	// 	#100 in = 4'b1001;
	// 	#100 $stop;
	// end
	initial
	begin
		in = 0;
		clock = 0;
	end
	always #50 clock = ~clock;
	always @(posedge clock)
	begin
		in = in + 1;
		if (in == 4'b1010) begin
			in = 4'b0000;
		end
	end
	translate m(.in(in), .out(out));
endmodule
