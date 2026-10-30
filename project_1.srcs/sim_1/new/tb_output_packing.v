`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 17:30:11
// Design Name: 
// Module Name: tb_output_packing
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_output_packing;
    reg [1:0] opcode;
    reg [7:0] add0,add1,add2,add3,sub0,sub1,sub2,sub3;
    reg signed [15:0] mul0,mul1,mul2,mul3;
    wire [63:0] vector_result;
    output_packing dut(.opcode(opcode),
        .add0(add0),.add1(add1),.add2(add2),.add3(add3),
        .sub0(sub0),.sub1(sub1),.sub2(sub2),.sub3(sub3),
        .mul0(mul0),.mul1(mul1),.mul2(mul2),.mul3(mul3),
        .vector_result(vector_result));
    initial begin
        add0=2; add1=4; add2=6; add3=18;
        sub0=0; sub1=0; sub2=0; sub3=8'hF6;
        mul0=1; mul1=4; mul2=9; mul3=56;
        opcode=0; #1; if (vector_result !== 64'h0000000012060402) $fatal(1,"ADD pack fail");
        opcode=1; #1; if (vector_result !== 64'h00000000F6000000) $fatal(1,"SUB pack fail");
        opcode=2; #1; if (vector_result !== 64'h0038000900040001) $fatal(1,"MUL pack fail");
        opcode=3; #1; if (vector_result !== 64'b0) $fatal(1,"DOT pack fail");
        $display("PASS output_packing"); $finish;
    end
endmodule

