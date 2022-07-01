`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:14 03/24/2022 
// Design Name: 
// Module Name:    ID_EX 
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
module ID_EX(
	input wire clk, rst,
	input wire [7:0] ID_instr,
	input wire [3:0] ID_ALUop, 
	input wire ID_RegWrite, ID_LoadImmediate,
	input wire [7:0] ID_RegData1,
	input wire [2:0] ID_writeReg, 
	input wire [7:0] ID_ImmediateData,
	output reg [3:0] EX_ALUop, 
	output reg EX_RegWrite, EX_LoadImmediate,
	output reg [7:0] EX_RegData1,
	output reg [2:0] EX_writeReg,
	output reg [7:0] EX_ImmediateData,
	output reg [7:0] EX_instr
    );
	 
	 always @(posedge clk, negedge rst) begin
		if(!rst) begin
			EX_ALUop <= 0;
			EX_RegWrite <= 0;
			EX_RegData1 <= 0;
			EX_writeReg <= 0;
			EX_LoadImmediate <= 0;
			EX_ImmediateData <= 0;
			EX_instr <= 0;
		end
		else begin
			EX_ALUop <= ID_ALUop;
			EX_RegWrite <= ID_RegWrite;
			EX_RegData1 <= ID_RegData1;
			EX_writeReg <= ID_writeReg;
			EX_LoadImmediate <= ID_LoadImmediate;
			EX_ImmediateData <= ID_ImmediateData;
			EX_instr <= ID_instr;
		end
	 end


endmodule
