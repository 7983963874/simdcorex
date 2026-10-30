`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 17:17:14
// Design Name: 
// Module Name: lane_arithmetic
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


module lane_arithmetic(
    input wire signed [7:0] a0,a1,a2,a3,
    input wire signed [7:0] b0,b1,b2,b3,
    output wire [7:0] add0,add1,add2,add3,
    output wire [7:0] sub0,sub1,sub2,sub3,
    output wire signed [15:0] mul0,mul1,mul2,mul3
);
    assign add0=a0+b0; assign add1=a1+b1;
    assign add2=a2+b2; assign add3=a3+b3;
    assign sub0=a0-b0; assign sub1=a1-b1;
    assign sub2=a2-b2; assign sub3=a3-b3;
    assign mul0=a0*b0; assign mul1=a1*b1;
    assign mul2=a2*b2; assign mul3=a3*b3;
endmodule
