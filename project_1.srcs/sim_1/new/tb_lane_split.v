`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 17:27:55
// Design Name: 
// Module Name: tb_lane_split
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


module tb_lane_split;
    reg [31:0] A,B;
    wire signed [7:0] a0,a1,a2,a3,b0,b1,b2,b3;
    lane_split dut(.A(A),.B(B),.a0(a0),.a1(a1),.a2(a2),.a3(a3),
                   .b0(b0),.b1(b1),.b2(b2),.b3(b3));
    initial begin
        A=32'h04030201; B=32'h0E030201; #1;
        if ({a3,a2,a1,a0} !== A || {b3,b2,b1,b0} !== B)
            $fatal(1,"FAIL lane_split");
        $display("PASS lane_split"); $finish;
    end
endmodule

