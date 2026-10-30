`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 17:19:52
// Design Name: 
// Module Name: opcode_decoder
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


module opcode_decoder(
    input wire in_valid,
    input wire [1:0] opcode,
    output wire add_en, sub_en, mul_en, dot_en, out_valid
);
    assign add_en = in_valid && (opcode == 2'b00);
    assign sub_en = in_valid && (opcode == 2'b01);
    assign mul_en = in_valid && (opcode == 2'b10);
    assign dot_en = in_valid && (opcode == 2'b11);
    assign out_valid = in_valid;
endmodule

