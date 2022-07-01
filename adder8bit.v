`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2022 02:03:31 AM
// Design Name: 
// Module Name: adder8bit
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


module adder8bit(
    input [7:0] A,
    input [7:0] B,
    output [7:0] q
    );
    assign q = A + B + 1; 
endmodule
