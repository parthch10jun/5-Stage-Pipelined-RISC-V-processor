`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:23 03/26/2022 
// Design Name: 
// Module Name:    ProcessorTop 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "InstructionFetch.v"
`include "RegisterFile.v"
`include "ALU.v"
`include "MainControl.v"
`include "SignExtend.v"
`include "MUX2to1.v"
`include "InstructionMemory.v"
module ProcessorTop(
    input clk,
    input reset
    );
wire [31:0] instruction, MUXImmSelOut, MUXShiftOut, reg_output_to_ALU_1, reg_output_to_ALU_2, ALU_res, sign_extended_out;
wire reg_write, zero, imm_sel, shift;
wire [3:0] ALUop;
wire [31:0] regfile_out_r0,regfile_out_r4,regfile_out_r8,regfile_out_r9,regfile_out_r11,regfile_out_r13,regfile_out_r20;
InstructionFetch instruction_fetch(clk, reset, instruction);
RegisterFile register_file(instruction[20:16], instruction[15:11], instruction[25:21], MUXImmSelOut, reg_write, clk, reset,
reg_output_to_ALU_1, reg_output_to_ALU_2, regfile_out_r0,regfile_out_r4,regfile_out_r8,regfile_out_r9,regfile_out_r11,regfile_out_r13,regfile_out_r20);
ALU alu(reg_output_to_ALU_1, MUXShiftOut, ALUop, zero, ALU_res);
MainControl main_control(instruction[31:26], {instruction[5], instruction[2:0]}, reg_write, shift, imm_sel, ALUop);
SignExtend sign_extend(instruction[20:0], sign_extended_out);
MUX2to1 m1(ALU_res, sign_extended_out, MUXImmSelOut, imm_sel);
MUX2to1 m2(reg_output_to_ALU_2, instruction[10:6], MUXShiftOut, shift);

endmodule

