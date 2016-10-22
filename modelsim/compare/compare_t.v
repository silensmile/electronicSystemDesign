//test way 1
// `timescale 1ns/1ns
// `include "./compare.v"

// module compare_t;
// 	reg a,b;
// 	wire equal;
// 	initial
// 		begin
// 			a=0;
// 			b=0;
// 		#100	a=0; b=1;
// 		#100	a=1; b=1;
// 		#100	a=1; b=0;
// 		#100	a=0; b=0;
// 		end

// 		compare m(.equal(equal), .a(a), .b(b));

// endmodule


//test way 2
`timescale 1ns/1ns
`include "./compare.v"

module compare_t;
	reg a,b;
	reg clock;
	wire equal;
	initial
		begin
			a = 0;
			b = 0;
			clock = 0;
		end
		always #50 clock = ~clock;
		always @(posedge clock)
			begin
				a = {$random}%2;
				b = {$random}%2;
			end
		initial
			begin
				#100000 $stop;
			end

	compare m(.equal(equal), .a(a), .b(b));

endmodule