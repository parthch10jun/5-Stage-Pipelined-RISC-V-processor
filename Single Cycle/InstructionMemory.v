`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:56 03/26/2022 
// Design Name: 
// Module Name:    InstructionMemory 
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
module InstructionMemory(
    input [31:0] PC,
    input reset,
    output [31:0] instruction_code
    );
reg [7:0] mem [35:0];
assign instruction_code = {mem[PC + 3], mem[PC + 2], mem[PC + 1], mem[PC]};
always @ (reset) begin
	if (!reset) begin
		{mem[3],mem[2],mem[1],mem[0]} = 32'h00011020;
		{mem[7],mem[6],mem[5],mem[4]} = 32'h00853022;
		{mem[11],mem[10],mem[9],mem[8]} = 32'h01095024;
		{mem[15],mem[14],mem[13],mem[12]} = 32'h01285025;
		{mem[19],mem[18],mem[17],mem[16]} = 32'h01660180;
		{mem[23],mem[22],mem[21],mem[20]} = 32'h01a90282; 
		{mem[27],mem[26],mem[25],mem[24]} = 32'hFE81707A;

	end
end
endmodule
