module instruction_memory (
  input [7:0] PC,
  input rst,
  output [7:0] instr_code
);

reg [7:0] mem [7:0]; // 8 - 8 bit registers
//x = 4 mod 8 = 4
//y = 3 mod 8 = 3
//z = 7 mod 8 = 7

always @(rst) begin 
  if(!rst) begin 
		mem[0] = 8'b00100011; // li R4, 3
		mem[1] = 8'b01100001; // sll R4, 1
		mem[2] = 8'b00011010; // li R3, 2
		mem[3] = 8'b11000001; // j L1
		mem[4] = 8'b01011011; // sll R3, 3
		mem[5] = 8'b00111100; // L1: li R7, 4
  end
end
assign instr_code = mem[PC];
endmodule