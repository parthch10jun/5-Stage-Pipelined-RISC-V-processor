module main_control (
	input rst,
	input [1:0] opcode,
	output reg [3:0] ALUop,
	output reg RegWrite,
	output reg LoadImmediate,
	output reg JumpPC
);

always @(*) begin
	if(!rst) begin
		ALUop <= 4'bx;
		RegWrite <= 1'b0;
		LoadImmediate <= 1'b0;
		JumpPC <= 1'b0;
	end
	
	else begin
		case(opcode)
			2'b01: begin //sll
				ALUop = 4'b1001;
				RegWrite = 1;
				LoadImmediate = 0;
				JumpPC = 0;
			end

			2'b00: begin //load imm
				ALUop = 4'bx;
				RegWrite = 1;
				LoadImmediate = 1;
				JumpPC = 0;
			end

			2'b11: begin // jump
				ALUop = 4'bx; 
				RegWrite = 0;
				LoadImmediate = 0;
				JumpPC = 1;
			end
		endcase
	end
end
endmodule