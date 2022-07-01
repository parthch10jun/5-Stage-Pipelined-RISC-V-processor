`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:35 03/26/2022 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(
    input [4:0] read_reg_1,
    input [4:0] read_reg_2,
    input [4:0] write_reg_num,
    input [31:0] write_data,
    input reg_write,
    input clk,
    input reset,
    output [31:0] read_data_1,
    output [31:0] read_data_2,
	 output [31:0] regfile_out_r0,
  output [31:0] regfile_out_r4,
  output [31:0] regfile_out_r8,
  output [31:0] regfile_out_r9,
  output [31:0] regfile_out_r11,
  output [31:0] regfile_out_r13,
  output [31:0] regfile_out_r20
    );
	reg [31:0] regfile [31:0];
	assign read_data_1 = regfile[read_reg_1];
	assign read_data_2 = regfile[read_reg_2];
	always @ (posedge clk or negedge reset) begin
		if (!reset) begin
			regfile[0]  <= 32'h1;
			regfile[1]  <= 32'h1;
			regfile[2]  <= 32'h1;
			regfile[3]  <= 32'h1;
			regfile[4]  <= 32'h1;
			regfile[5]  <= 32'h1;
			regfile[6]  <= 32'h1;
			regfile[7]  <= 32'h1;
			regfile[8]  <= 32'h1;
			regfile[9]  <= 32'h1;
			regfile[10] <= 32'h1;
			regfile[11] <= 32'h1;
			regfile[12] <= 32'h1;
			regfile[13] <= 32'h1;
			regfile[14] <= 32'h1;
			regfile[15] <= 32'h1;
			regfile[16] <= 32'h1;
			regfile[17] <= 32'h1;
			regfile[18] <= 32'h1;
			regfile[19] <= 32'h1;
			regfile[20] <= 32'h1;
			regfile[21] <= 32'h1;
			regfile[22] <= 32'h1;
			regfile[23] <= 32'h1;
			regfile[24] <= 32'h1;
			regfile[25] <= 32'h1;
			regfile[26] <= 32'h1;
			regfile[27] <= 32'h1;
			regfile[28] <= 32'h1;
			regfile[29] <= 32'h1;
			regfile[30] <= 32'h1;
			regfile[31] <= 32'h1;
		end
		else begin
			if (reg_write)
				regfile[write_reg_num] = write_data;
		end
	end
	assign regfile_out_r0 = regfile[0];
assign regfile_out_r4 = regfile[4];
assign regfile_out_r8 = regfile[8];
assign regfile_out_r9 = regfile[9];
assign regfile_out_r11 = regfile[11];
assign regfile_out_r13 = regfile[13];
assign regfile_out_r20 = regfile[20];
endmodule
