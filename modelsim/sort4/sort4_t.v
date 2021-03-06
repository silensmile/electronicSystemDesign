`timescale 1ns/1ns

module sort4_t;
  reg[3:0]  a,b,c,d;
  wire[3:0] ra,rb,rc,rd;
  
  initial
  begin
    a=0;
    b=0;
    c=0;
    d=0;
    repeat(50)
    begin
      #100  a={$random}%15;
            b={$random}%15;
            c={$random}%15;
            d={$random}%15;
    end    
    #100  $stop;
  end
    
    sort4 sort4(.a(a),.b(b),.c(c),.d(d),.ra(ra),.rb(rb),.rc(rc),.rd(rd));
    
endmodule
