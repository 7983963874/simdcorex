`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2026 17:28:58
// Design Name: 
// Module Name: tb_opcode_decoder
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


module tb_opcode_decoder;
    reg in_valid; reg [1:0] opcode;
    wire add_en,sub_en,mul_en,dot_en,out_valid;
    opcode_decoder dut(.in_valid(in_valid),.opcode(opcode),
        .add_en(add_en),.sub_en(sub_en),.mul_en(mul_en),
        .dot_en(dot_en),.out_valid(out_valid));
    initial begin
        in_valid=1;
        opcode=0; #1; if ({add_en,sub_en,mul_en,dot_en,out_valid}!==5'b10001) $fatal(1,"ADD decode fail");
        opcode=1; #1; if ({add_en,sub_en,mul_en,dot_en,out_valid}!==5'b01001) $fatal(1,"SUB decode fail");
        opcode=2; #1; if ({add_en,sub_en,mul_en,dot_en,out_valid}!==5'b00101) $fatal(1,"MUL decode fail");
        opcode=3; #1; if ({add_en,sub_en,mul_en,dot_en,out_valid}!==5'b00011) $fatal(1,"DOT decode fail");
        in_valid=0; #1; if ({add_en,sub_en,mul_en,dot_en,out_valid}!==5'b00000) $fatal(1,"valid gating fail");
        $display("PASS opcode_decoder"); $finish;
    end
endmodule

