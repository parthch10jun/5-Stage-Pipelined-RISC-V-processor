module processor_top (
	input clk,
	input rst
);
//Wires in IF BLOCK
wire JumpPC;
wire [7:0] PC, Jump_From_ID;
wire [7:0] IF_instr, IF_PC;
//Wires in ID Block
wire [7:0] ID_instr, ID_r1_out, ID_PC, ID_ImmediateData, SignExtendJump, regfile_mux_out;
wire [3:0] ID_ALUop;
wire ID_RegWrite, ID_LoadImmediate;
assign IF_PC = PC;
//Wires in EX Block
wire [7:0] EX_r1_out, EX_ImmediateData, EX_ALU_res, EX_instr, ForwardFromMUX;
wire [2:0] EX_write_reg_num;
wire EX_LoadImmediate, EX_RegWrite;
wire [3:0] EX_ALUop;
wire ForwardControl;
//Wires in WB Block
wire [7:0] WB_alu_res, WB_ImmediateData, WB_instr; 
wire WB_RegWrite, WB_LoadImmediate;
wire [2:0] WB_write_reg_num;

PC pc(clk, rst, Jump_From_ID, JumpPC, PC);
instruction_memory InstrMem(PC, rst, IF_instr);
IF_ID IFID(JumpPC, clk, rst, IF_instr, IF_PC, ID_instr, ID_PC);
mux2_1 MUXRegFile(WB_alu_res, WB_ImmediateData, WB_LoadImmediate, regfile_mux_out);
sign_extend SignExtend(ID_instr[2:0], ID_instr[5:0], ID_ImmediateData, SignExtendJump);
reg_file RegFile(clk, rst, WB_RegWrite, ID_instr[5:3], WB_write_reg_num, regfile_mux_out, ID_r1_out);
adder8bit AdderJump(SignExtendJump, ID_PC, Jump_From_ID);
main_control ControlUnit(rst, ID_instr[7:6], ID_ALUop, ID_RegWrite, ID_LoadImmediate, JumpPC);
ID_EX IDEX(clk, rst, ID_instr, ID_ALUop, ID_RegWrite, ID_LoadImmediate, ID_r1_out, 
ID_instr[5:3], ID_ImmediateData, EX_ALUop, EX_RegWrite, EX_LoadImmediate, 
EX_r1_out, EX_write_reg_num, EX_ImmediateData, EX_instr);
mux2_1 MUXForwarding(EX_r1_out, WB_ImmediateData, ForwardControl, ForwardFromMUX);
ALU ALUMain(ForwardFromMUX, {5'b0,EX_instr[2:0]}, EX_ALUop, EX_ALU_res);
forwading_unit ForwardingUnit(EX_instr, WB_instr, ForwardControl);
EX_WB EXWB(clk, rst, EX_instr, EX_RegWrite, EX_LoadImmediate, EX_ALU_res, EX_ImmediateData, 
EX_write_reg_num, WB_RegWrite, WB_LoadImmediate, WB_alu_res, WB_ImmediateData, 
WB_write_reg_num, WB_instr);
endmodule