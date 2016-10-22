module light_All(clk10,rst,switch,light);
  input clk10,rst;
  input[2:0]switch;
  output[2:0]light;
  reg[2:0]state1,state2,state3;
  reg[7:0]count1,count2,count3;
  reg[2:0]count_1,count_2,count_3;
  reg[2:0]light;
  parameter
    state1_start=3'b000,state2_start=3'b000,state3_start=3'b000,				//初始状态
    state1_work=3'b001,state2_work=3'b001,state3_work=3'b001,					//亮灯并计时
    state1_up=3'b010,state2_up=3'b010,state3_up=3'b010,							//开始亮灯
    state1_down=3'b011,state2_down=3'b011,state3_down=3'b011,					//灭灯
    state1_other=3'b100,state2_other=3'b100,state3_other=3'b100;				//4秒倒计时及灭灯
  always@(posedge clk10)
    if(!rst)
    begin
       	state1<=state1_start;
       	count1<=8'b0;
       	count_1<=3'b0;
   	end
    else
    	if(switch[0]=='b1&&count_1<4)											//消抖 前0.4秒
        	count_1<=count_1+1;
    	else
        	case(state1)
          		state1_start:													//初始状态
          		if(switch[0]=='b1)
            	begin
              		state1<=state1_up;											//转换到开始亮灯
              		light[0]<='b1;
              		count1<=78;
            	end
          		else
            	begin
              		state1<=state1_start;
              		light[0]<='b0;
            	end
          		state1_work:
		          	if(count1>0)
		           	begin
		              	count1<=count1-1;
		              	if(switch[0]=='b0&&(state2==3'b010||state3==3'b010))	//离开此灯并且已经走到下一个灯
		                begin 													//若已经有另一盏灯打开
		                 	light[0]<='b0;										//为省电考虑关闭此灯
		                  	state1<=state1_down;
		              	end
		            end
		          	else														//8秒超时状态转换
		          	begin
		          		if(switch[0]=='b0)
              			begin
                			state1<=state1_down;								//到关灯状态
              			end
            			else
              			begin
                			state1<=state1_other;								//转换到4秒倒计时状态
                			count1<=39;
              			end
		          	end
          		state1_other:
          			if(switch[0]=='b1)
          			begin
          				if (count1>0)begin
          					count1<=count1-1;
            				state1<=state1_other;
          				end
          				else begin
          					light[0]<='b0;
          				end
          			end
          			else begin
          				state1<=state1_down;
          			end
          		state1_down:
           			begin
              			light[0]<='b0;
              			count_1<=3'b0;
              			state1<=state1_start;
            		end
          		state1_up:
            		begin
              			state1<=state1_work;
            		end
          		default:
            		state1<=state1_start;
        	endcase


  always@(posedge clk10)
    if(!rst)
    begin
        state2<=state2_start;
        count2<=8'b0;
        count_2<=3'b0;
    end
    else
      	if(switch[1]=='b1&&count_2<4)
        	count_2<=count_2+1;
      	else
        	case(state2)
          		state2_start:
          			if(switch[1]=='b1)
            		begin
              			state2<=state2_up;
              			light[1]<='b1;
              			count2<=78;
            		end
          			else
            		begin
              			state2<=state2_start;
              			light[1]<='b0;
            		end
          		state2_work:
          			if(count2>0)
            		begin
              			count2<=count2-1;
              			if(switch[1]=='b0&&(state1==3'b010||state3==3'b010))
                		begin
                  			light[1]<='b0;
                  			state2<=state2_down;
              			end
            		end
          			else
            			if(switch[1]=='b0)
              			begin
                			state2<=state2_down;
              			end
            			else
              			begin
                			state2<=state2_other;
                			count2<=39;
              			end
          		state2_other:
            		if(switch[1]=='b1)
          			begin
          				if (count2>0)begin
          					count2<=count2-1;
            				state2<=state2_other;
          				end
          				else begin
          					light[1]<='b0;
          				end
          			end
          			else begin
          				state2<=state2_down;
          			end

          		state2_down:
            	begin
            	  	light[1]<='b0;
            	  	count_2<=3'b0;
            	  	state2<=state2_start;
            	end
          		state2_up:
          		  	begin
          		  	  	state2<=state2_work;
          		  	end
          		default:
          		  	state2<=state2_start;

        	endcase

  always@(posedge clk10)
    if(!rst)
    begin
        state3<=state3_start;
        count3<=8'b0;
        count_3<=3'b0;
    end
    else
      	if(switch[2]=='b1&&count_3<4)
        	count_3<=count_3+1;
      	else
        	case(state3)
				state3_start:
          			if(switch[2]=='b1)
          			  	begin
          			  	  	state3<=state3_up;
          			  	  	light[2]<='b1;
          			  	  	count3<=78;
          			  	end
          			else
          			  	begin
          			 	   	state3<=state3_start;
          			  	  	light[2]<='b0;
          			  	end

          		state3_work:
		          	if(count3>0)
			        begin
			            count3<=count3-1;
			            if(switch[2]=='b0&&(state1==3'b010||state2==3'b010))
			            begin
			                light[2]<='b0;
			                state3<=state3_down;
			            end
			        end
			          	else
			            	if(switch[2]=='b0)
			              	begin
			                	state3<=state3_down;
			              	end
			            	else
			              	begin
			                	state3<=state3_other;
			                	count3<=39;
			              	end

		        state3_other:
		          	if(switch[2]=='b1)
          			begin
          				if (count3>0)begin
          					count3<=count3-1;
            				state3<=state3_other;
          				end
          				else begin
          					light[2]<='b0;
          				end
          			end
          			else begin
          				state3<=state3_down;
          			end

          		state3_down:
            	begin
              		light[2]<='b0;
              		count_3<=3'b0;
              		state3<=state3_start;
            	end

          		state3_up:
            	begin
              		state3<=state3_work;
            	end

          		default:
            		state3<=state3_start;

        	endcase

endmodule

