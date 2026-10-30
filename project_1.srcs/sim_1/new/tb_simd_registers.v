`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 17:31:45
// Design Name: 
// Module Name: tb_simd_registers
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


module tb_simd_registers;
    reg clk,rst_n,capture_result;
    reg [63:0] vector_in;
    reg signed [19:0] dot_in;
    wire [63:0] vector_out;
    wire signed [19:0] dot_out;
    wire out_valid;
    simd_registers dut(.clk(clk),.rst_n(rst_n),.capture_result(capture_result),
        .vector_in(vector_in),.dot_in(dot_in),.vector_out(vector_out),
        .dot_out(dot_out),.out_valid(out_valid));
    initial clk=0;
    always #5 clk=~clk;
    initial begin
        rst_n=0; capture_result=0; vector_in=0; dot_in=0;
        @(posedge clk); #1;
        if (out_valid!==0 || vector_out!==0 || dot_out!==0) $fatal(1,"Reset fail");
        @(negedge clk); rst_n=1; capture_result=1;
        vector_in=64'h0038000900040001; dot_in=70;
        @(posedge clk); #1;
        if (out_valid!==1 || vector_out!==64'h0038000900040001 || dot_out!==20'sd70) $fatal(1,"Capture fail");
        @(negedge clk); capture_result=0;
        @(posedge clk); #1;
        if (out_valid!==0) $fatal(1,"Valid deassertion fail");
        $display("PASS simd_registers"); $finish;
    end
endmodule
