module ledtop(clk,led);
output[7:0]led;
input clk;

LED LED_1(
	.clkf(clk_out),
	.led(led)
	);
clk_div clk_div_1(
	.clk_out(clk_out),
	.clk_in(clk)
	);
endmodule

module LED(clkf,led);
output[7:0] led;
input clkf;

reg[7:0] led;
reg[3:0] state;

always@(posedge clkf)
begin 
   state=state+4'b0001;
   case(state)
	4'b0000: led<=8'b11111110;
	4'b0001: led<=8'b11111101;
	4'b0010: led<=8'b11111011;
	4'b0011: led<=8'b11110111;
	4'b0100: led<=8'b11101111;
	4'b0101: led<=8'b11011111;
	4'b0110: led<=8'b10111111;
	4'b0111: led<=8'b01111111;

	4'b1000: led<=8'b01111111;
	4'b1001: led<=8'b10111111;
	4'b1010: led<=8'b11011111;
	4'b1011: led<=8'b11101111;
	4'b1100: led<=8'b11110111;
	4'b1101: led<=8'b11111011;
	4'b1110: led<=8'b11111101;
	4'b1111: led<=8'b11111110;

	default:state=4'b0000;
	endcase
end
endmodule	


// 分频器部分 ，获得便于试验观察的时钟信号
module clk_div(clk_out,clk_in);
   input clk_in;
   output clk_out;
   reg clk_out;
   reg[25:0] counter;  //10_000_000=1001_1000_1001_0110_1000_0000

parameter cnt=50_000_000;  ///  the sys clk is 50MHz ,here got the 5HZ as output
   always @(posedge clk_in)
     begin
		counter<=counter+1;
            if(counter==cnt/2-1)
		begin
			  clk_out<=!clk_out;
			  counter<=0;
		end			
      end
endmodule