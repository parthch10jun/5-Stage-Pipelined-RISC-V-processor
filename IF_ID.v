module IF_ID(
		input wire JumpPC,
		input wire clk, rst,
		input wire [7:0] IF_instr,
		input wire [7:0] IF_PC,	
		output reg [7:0] ID_instr,
		output reg [7:0] ID_PC	//forwarding PC 
    );

	always @(posedge clk or negedge rst) begin
		if(!rst) begin
			ID_instr <= 8'bx;	//reset to xxx
			ID_PC <= 0;			//IDPC => 0 
		end
		
		else begin
			ID_instr <= IF_instr;
			ID_PC <= IF_PC;
		end
	end

endmodule
