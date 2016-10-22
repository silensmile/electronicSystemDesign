module div_ex(rst,clk,out);
  input rst, clk;
  reg [6:0] top;
  reg [8:0] down;
  output out;
  reg out;

  always @(posedge clk)
    begin
      if(!rst)
        begin
          top<=0;
          down<=0;
          out<=0;
        end
      else
        begin
          if (out==1)
            begin
              if (top==100)
                begin
                  top<=0;
                  out<=~out;
                end
              else
                begin
                    top<=top+1;
                    out<=out;
                end
            end
          else
            begin
              if (down==400)
                begin
                  down<=0;
                  out<=~out;
                end
              else
                begin
                    down<=down+1;
                    out<=out;
                end
            end
        end
    end
  endmodule

