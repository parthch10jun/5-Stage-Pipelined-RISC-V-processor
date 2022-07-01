`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:19:40 03/26/2022 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ctrl,
    output Zero,
    output [31:0] rslt 
    );
reg [31:0] res;
always @ (*) begin
	case(ctrl)
		4'b0000: res = A & B;
		4'b0001: res = A | B;
		4'b0010: res = A + B;
		4'b0100: res = A - B;
		4'b1001: res = A << B;
		4'b1010: res = A >> B;
		default: res = 32'b0;
	endcase
end
assign rslt = res;
assign Zero = (rslt == 0);
endmodule
