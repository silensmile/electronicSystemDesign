module compare_8bit_t;
  reg[7:0] a,b;
  reg clock;
  wire equal;
  initial
  begin
    a=0;
    b=0;
    clock=0;
  end
  always #50 clock = ~clock;
  always @ (posedge clock)
  begin
    a[0]={$random}%2;
    a[1]={$random}%2;
    a[2]={$random}%2;
    a[3]={$random}%2;
    a[4]={$random}%2;
    a[5]={$random}%2;
    a[6]={$random}%2;
    a[7]={$random}%2;
    b[0]={$random}%2;
    b[1]={$random}%2;
    b[2]={$random}%2;
    b[3]={$random}%2;
    b[4]={$random}%2;
    b[5]={$random}%2;
    b[6]={$random}%2;
    b[7]={$random}%2;
  end
  initial
  begin #100000 $stop;end
    compare_8bit m(.equal(equal),.a(a),.b(b));
  endmodule
