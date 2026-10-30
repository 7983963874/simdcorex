`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 17:25:18
// Design Name: 
// Module Name: tb_dot_reduction
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


module tb_dot_reduction;
    reg signed [15:0] p0,p1,p2,p3;
    wire signed [19:0] dot_result;
    dot_reduction dut(.p0(p0),.p1(p1),.p2(p2),.p3(p3),.dot_result(dot_result));
    initial begin
        p0=1; p1=4; p2=9; p3=56; #1;
        if (dot_result !== 20'sd70) $fatal(1,"DOT fail: %0d",dot_result);
        p0=-1; p1=4; p2=-9; p3=56; #1;
        if (dot_result !== 20'sd50) $fatal(1,"Signed DOT fail: %0d",dot_result);
        $display("PASS dot_reduction"); $finish;
    end
endmodule

