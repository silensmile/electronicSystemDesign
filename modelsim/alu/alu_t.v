`timescale  1ns/1ps
`include    "./alu.v"
module alu_t;
    wire[7:0]   out;
    reg[7:0]    a,b;
    reg[2:0]    opcode;
    parameter   times = 5;
    initial
    begin
        a = {$random}%256;
        b = {$random}%256;
        opcode = 3'h0;
        repeat(times)
            begin
            #100    a = {$random}%256;
                    b = {$random}%256;
                    opcode = opcode + 1;
            end
        #100    $stop;
    end

    alu    alu1(out,opcode,a,b);
endmodule
