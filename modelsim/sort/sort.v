module sort(a,b,c,d,ra,rb,rc,rd);
  input[7:0] a,b,c,d;
  output[7:0] ra,rb,rc,rd;
  reg[7:0] ra,rb,rc,rd;
  reg[7:0] va,vb,vc,vd;

  always @ (a or b or c or d)
    begin
      {va,vb,vc,vd}={a,b,c,d};
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


