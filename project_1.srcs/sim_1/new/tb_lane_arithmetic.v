`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 17:26:41
// Design Name: 
// Module Name: tb_lane_arithmetic
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


module tb_lane_arithmetic;
    reg signed [7:0] a0,a1,a2,a3,b0,b1,b2,b3;
    wire [7:0] add0,add1,add2,add3,sub0,sub1,sub2,sub3;
    wire signed [15:0] mul0,mul1,mul2,mul3;
    lane_arithmetic dut(.a0(a0),.a1(a1),.a2(a2),.a3(a3),
        .b0(b0),.b1(b1),.b2(b2),.b3(b3),
        .add0(add0),.add1(add1),.add2(add2),.add3(add3),
        .sub0(sub0),.sub1(sub1),.sub2(sub2),.sub3(sub3),
        .mul0(mul0),.mul1(mul1),.mul2(mul2),.mul3(mul3));
    initial begin
        a0=1; a1=2; a2=3; a3=4; b0=1; b1=2; b2=3; b3=14; #1;
        if ({add3,add2,add1,add0} !== 32'h12060402) $fatal(1,"ADD fail");
        if ({sub3,sub2,sub1,sub0} !== 32'hF6000000) $fatal(1,"SUB fail");
        if ({mul3,mul2,mul1,mul0} !== 64'h0038000900040001) $fatal(1,"MUL fail");
        $display("PASS lane_arithmetic"); $finish;
    end
endmodule
