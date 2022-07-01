`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:48:35 03/26/2022 
// Design Name: 
// Module Name:    MainControl 
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
module MainControl(
	 input [5:0] opcode,
    input [3:0] funct,
    output reg reg_write,
	 output reg shift,
	 output reg imm_sel,
    output reg [3:0] ALUop
    );
always @ (*) begin
	case(opcode)
		6'b111111: begin 
			ALUop = 4'h0;
			reg_write = 1;
			shift = 0;
			imm_sel = 1;
		end
		6'b000000: begin
			reg_write = 1;
			imm_sel = 0;
			ALUop[0] = (~funct[3] & ~funct[2] & ~funct[1] & ~funct[0]) | (funct[3] & funct[2] & ~funct[1] & funct[0]);
			ALUop[1] = (~funct[3] & ~funct[2] & funct[1] & ~funct[0]) | (funct[3] & ~funct[2] & ~funct[1] & ~funct[0]);
			ALUop[2] = (funct[3] & ~funct[2] & funct[1] & ~funct[0]);
			ALUop[3] = (~funct[3] & ~funct[2] & ~funct[0]);
			shift = ALUop[3];
		end
		default : 	{ALUop, reg_write, shift, imm_sel} = 0;
	endcase
end
endmodule
