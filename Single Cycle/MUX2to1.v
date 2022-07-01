`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:39:41 03/27/2022 
// Design Name: 
// Module Name:    MUX2to1 
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
module MUX2to1(
	input [31:0] in1,
	input [31:0] in2,
	output [31:0] out,
	input sel
    );
	assign out = sel ? in2 : in1;
endmodule
