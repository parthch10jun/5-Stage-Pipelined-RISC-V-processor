module sign_extend (
	input [2:0] in_imm,
	input [5:0] in_jump,
	output [7:0] out_imm,
	output [7:0] out_jump
);

assign out_jump[7:6] = {2{in_jump[5]}}; //not concatenated together
assign out_jump[5:0] = in_jump;	//concatenation gave errors
assign out_imm[7:3] = {5{in_imm[2]}};
assign out_imm [2:0] = in_imm;

endmodule