module EX_WB(
	input wire clk, rst,
	input wire [7:0] EX_instr,
	input wire EX_RegWrite, EX_LoadImmediate,
	input wire [7:0] EX_ALUres, EX_ImmData,
	input wire [2:0] EX_writeReg,
	output reg WB_RegWrite, WB_LoadImmediate,
	output reg [7:0] WB_ALUres, WB_ImmData,
	output reg [2:0] WB_writeReg,
	output reg [7:0] WB_instr
    );
	
	always @(posedge clk, negedge rst) begin
		if(!rst) begin
			WB_instr <= 0;
			WB_RegWrite <= 0;
			WB_ALUres <= 0;
			WB_writeReg <= 0;
			WB_LoadImmediate <= 0;
			WB_ImmData <= 0;
		end
		else begin
			WB_instr <= EX_instr;
			WB_RegWrite <= EX_RegWrite;
			WB_ALUres <= EX_ALUres;
			WB_writeReg <= EX_writeReg;
			WB_LoadImmediate <= EX_LoadImmediate;
			WB_ImmData <= EX_ImmData;
		end
	end
endmodule
