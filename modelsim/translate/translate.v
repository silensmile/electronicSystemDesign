module translate(in, out);
input[3:0] in;
output[6:0] out;
reg[6:0] out;
always @(in)
begin
	case(in)
	4'b0000: out = 7'b1111110;	//show number 0
	4'b0001: out = 7'b0110000;	//show number 1
	4'b0010: out = 7'b1101101;	//show number 2
	4'b0011: out = 7'b1111001;	//show number 3
	4'b0100: out = 7'b0110011;	//show number 4
	4'b0101: out = 7'b1011011;	//show number 5
	4'b0110: out = 7'b0011111;	//show number 6
	4'b0111: out = 7'b1110000;	//show number 7
	4'b1000: out = 7'b1111111;	//show number 8
	4'b1001: out = 7'b1110011;	//show number 9
	default: out = 7'b0000000;
	endcase
end

endmodule