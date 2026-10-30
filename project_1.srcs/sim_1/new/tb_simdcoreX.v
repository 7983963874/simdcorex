`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 17:32:54
// Design Name: 
// Module Name: tb_simdcoreX
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


module tb_simdcoreX;
    reg clk,rst_n,in_valid;
    reg [1:0] opcode;
    reg [31:0] A,B;
    wire [63:0] vector_result;
    wire signed [19:0] dot_result;
    wire out_valid;

    simdcoreX dut(.clk(clk),.rst_n(rst_n),.in_valid(in_valid),
        .opcode(opcode),.A(A),.B(B),.vector_result(vector_result),
        .dot_result(dot_result),.out_valid(out_valid));

    initial clk=0;
    always #5 clk=~clk;

    task apply_and_check;
        input [1:0] op;
        input [63:0] expected_vector;
        input signed [19:0] expected_dot;
        begin
            @(negedge clk);
            opcode=op; A=32'h04030201; B=32'h0E030201; in_valid=1;
            @(negedge clk); in_valid=0;
            @(posedge clk); #1;
            if (out_valid !== 1'b1) $fatal(1,"out_valid fail opcode=%b",op);
            if (vector_result !== expected_vector || dot_result !== expected_dot)
                $fatal(1,"Mismatch opcode=%b vector=%h dot=%0d",op,vector_result,dot_result);
            $display("PASS opcode=%b vector=%h dot=%0d",op,vector_result,dot_result);
        end
    endtask

    initial begin
        rst_n=0; in_valid=0; opcode=0; A=0; B=0;
        repeat(2) @(posedge clk);
        @(negedge clk); rst_n=1;
        apply_and_check(2'b00,64'h0000000012060402,20'sd0);
        apply_and_check(2'b01,64'h00000000F6000000,20'sd0);
        apply_and_check(2'b10,64'h0038000900040001,20'sd0);
        apply_and_check(2'b11,64'h0000000000000000,20'sd70);
        $display("ALL SIMD-COREX TESTS PASSED");
        $finish;
    end
endmodule

