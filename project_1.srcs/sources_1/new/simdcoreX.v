`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 17:24:08
// Design Name: 
// Module Name: simdcoreX
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


module simdcoreX(
    input wire clk, rst_n, in_valid,
    input wire [1:0] opcode,
    input wire [31:0] A, B,
    output wire [63:0] vector_result,
    output wire signed [19:0] dot_result,
    output wire out_valid
);
    reg [31:0] A_q, B_q;
    reg [1:0] opcode_q;
    reg valid_q;

    always @(posedge clk) begin
        if (!rst_n) begin
            A_q<=32'b0; B_q<=32'b0;
            opcode_q<=2'b00; valid_q<=1'b0;
        end else begin
            valid_q<=in_valid;
            if (in_valid) begin
                A_q<=A; B_q<=B; opcode_q<=opcode;
            end
        end
    end

    wire signed [7:0] a0,a1,a2,a3,b0,b1,b2,b3;
    lane_split u_split (
        .A(A_q),.B(B_q),
        .a0(a0),.a1(a1),.a2(a2),.a3(a3),
        .b0(b0),.b1(b1),.b2(b2),.b3(b3)
    );

    wire add_en,sub_en,mul_en,dot_en,decoded_valid;
    opcode_decoder u_decode (
        .in_valid(valid_q),.opcode(opcode_q),
        .add_en(add_en),.sub_en(sub_en),.mul_en(mul_en),
        .dot_en(dot_en),.out_valid(decoded_valid)
    );

    wire [7:0] add0,add1,add2,add3,sub0,sub1,sub2,sub3;
    wire signed [15:0] mul0,mul1,mul2,mul3;
    lane_arithmetic u_arith (
        .a0(a0),.a1(a1),.a2(a2),.a3(a3),
        .b0(b0),.b1(b1),.b2(b2),.b3(b3),
        .add0(add0),.add1(add1),.add2(add2),.add3(add3),
        .sub0(sub0),.sub1(sub1),.sub2(sub2),.sub3(sub3),
        .mul0(mul0),.mul1(mul1),.mul2(mul2),.mul3(mul3)
    );

    wire signed [19:0] dot_sum;
    dot_reduction u_dot (
        .p0(mul0),.p1(mul1),.p2(mul2),.p3(mul3),
        .dot_result(dot_sum)
    );

    wire [63:0] packed_vector;
    output_packing u_pack (
        .opcode(opcode_q),
        .add0(add0),.add1(add1),.add2(add2),.add3(add3),
        .sub0(sub0),.sub1(sub1),.sub2(sub2),.sub3(sub3),
        .mul0(mul0),.mul1(mul1),.mul2(mul2),.mul3(mul3),
        .vector_result(packed_vector)
    );

    wire signed [19:0] selected_dot = dot_en ? dot_sum : 20'sd0;
    simd_registers u_regs (
        .clk(clk),.rst_n(rst_n),.capture_result(decoded_valid),
        .vector_in(packed_vector),.dot_in(selected_dot),
        .vector_out(vector_result),.dot_out(dot_result),
        .out_valid(out_valid)
    );
endmodule
