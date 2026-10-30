`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 17:15:45
// Design Name: 
// Module Name: dot_reduction
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


module dot_reduction(
    input wire signed [15:0] p0,p1,p2,p3,
    output wire signed [19:0] dot_result
);
    wire signed [19:0] p0_ext={{4{p0[15]}},p0};
    wire signed [19:0] p1_ext={{4{p1[15]}},p1};
    wire signed [19:0] p2_ext={{4{p2[15]}},p2};
    wire signed [19:0] p3_ext={{4{p3[15]}},p3};
    assign dot_result=p0_ext+p1_ext+p2_ext+p3_ext;
endmodule
