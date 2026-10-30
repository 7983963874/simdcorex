`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 17:21:15
// Design Name: 
// Module Name: output_packing
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


module output_packing(
    input wire [1:0] opcode,
    input wire [7:0] add0,add1,add2,add3,
    input wire [7:0] sub0,sub1,sub2,sub3,
    input wire signed [15:0] mul0,mul1,mul2,mul3,
    output reg [63:0] vector_result
);
    always @* begin
        case (opcode)
            2'b00: vector_result={32'b0,add3,add2,add1,add0};
            2'b01: vector_result={32'b0,sub3,sub2,sub1,sub0};
            2'b10: vector_result={mul3,mul2,mul1,mul0};
            2'b11: vector_result=64'b0;
            default: vector_result=64'b0;
        endcase
    end
endmodule

