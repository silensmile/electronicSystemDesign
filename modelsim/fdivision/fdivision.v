module fdivision(RESET,F10M,F500K);
  input F10M,RESET;
  output F500K;
  reg F500K;
  reg[8:0] j;
  always@(posedge F10M)
    if(!RESET)
      begin
        F500K <= 0;
        j <= 0;
      end
    else
      begin
        if(j==9)
          begin
            j<=0;
            F500K<= ~F500K;
          end
        else
          j<=j+1;
      end
endmodule

