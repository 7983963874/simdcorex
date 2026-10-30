`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 17:23:04
// Design Name: 
// Module Name: simd_registers
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


module simd_registers(
    input wire clk, rst_n, capture_result,
    input wire [63:0] vector_in,
    input wire signed [19:0] dot_in,
    output reg [63:0] vector_out,
    output reg signed [19:0] dot_out,
    output reg out_valid
);
    always @(posedge clk) begin
        if (!rst_n) begin
            vector_out<=64'b0;
            dot_out<=20'sd0;
            out_valid<=1'b0;
        end else begin
            out_valid<=capture_result;
            if (capture_result) begin
                vector_out<=vector_in;
                dot_out<=dot_in;
            end
        end
    end
endmodule

