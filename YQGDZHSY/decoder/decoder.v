module decoder(y,en,a);
output [7:0]y;
input en;
input [2:0]a;
reg[7:0]y;
always @(en or a)
if(!en)
y=8'b1111_1111;
else
case(a)
3'b000 : y=8'b1111_1110;
3'b001 : y=8'b1111_1101;
3'b010 : y=8'b1111_1011;
3'b011 : y=8'b1111_0111;
3'b100 : y=8'b1110_1111;
3'b101 : y=8'b1101_1111;
3'b110 : y=8'b1011_1111;
3'b111 : y=8'b0111_1111;
default : y=8'bx;
endcase
endmodule