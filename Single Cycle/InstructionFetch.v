`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:24 03/26/2022 
// Design Name: 
// Module Name:    InstructionFetch 
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
module InstructionFetch(
    input clk,
    input reset,
    output [31:0] instruction_code
    );
reg [31:0] PC;
InstructionMemory im(PC, reset, instruction_code);
always @ (posedge clk, negedge reset) begin
	if (!reset)
		PC <= 0;
	else
		PC <= PC + 4;
end
endmodule
