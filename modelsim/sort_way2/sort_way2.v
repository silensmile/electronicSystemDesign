module sort_way2(clk,reset,ra,rb,rc,rd,a);

output[7:0] ra,rb,rc,rd;
input[7:0] a;
input clk,reset;
reg[7:0] ra,rb,rc,rd;
reg[7:0] va,vb,vc,vd;

always @ (posedge clk)
 begin
    if(!reset)
      begin
        va<=0;vb<=0;vc<=0;vd<=0;
      end
    else
      va<=a;
 end

always @ (posedge clk)
 begin
      sort2(va,vc);
      sort2(vb,vd);
      sort2(va,vb);
      sort2(vc,vd);
      sort2(vb,vc);
    {ra,rb,rc,rd}={va,vb,vc,vd};
 end

task sort2;
inout[7:0] x,y;
reg[7:0] tmp;
   if(x>y)
     begin
       tmp=x;
       x=y;
       y=tmp;
     end
endtask

endmodule

