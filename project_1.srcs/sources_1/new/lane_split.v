`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 17:18:35
// Design Name: 
// Module Name: lane_split
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


module lane_split(
    input wire [31:0] A, B,
    output wire signed [7:0] a0, a1, a2, a3,
    output wire signed [7:0] b0, b1, b2, b3
);
    assign a0=A[7:0];   assign a1=A[15:8];
    assign a2=A[23:16]; assign a3=A[31:24];
    assign b0=B[7:0];   assign b1=B[15:8];
    assign b2=B[23:16]; assign b3=B[31:24];
endmodule

