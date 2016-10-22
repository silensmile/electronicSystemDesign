module compare_8bit(equal,a,b);
  input[7:0] a,b;
  output equal;
  assign equal=(a>b)?1:0;
 endmodule

