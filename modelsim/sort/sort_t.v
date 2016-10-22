`timescale 1ns/1ns

module sort_t;
  reg[7:0] a,b,c,d;
  wire[7:0] ra,rb,rc,rd;

  initial
    begin
      a=0;b=0;c=0;d=0;
      repeat(50)
      begin
        #100      a={$random}%256;
                  b={$random}%256;
                  c={$random}%256;
                  d={$random}%256;
      end

      #100 $stop;
    end
      sort m(.a(a),.b(b),.c(c),.d(d),.ra(ra),.rb(rb),.rc(rc),.rd(rd));

  endmodule
