module PC (
	input clk,
	input rst,
	input [7:0] jump,
	input JumpPC,
	output reg [7:0] PC
);

always @(posedge clk or negedge rst or JumpPC) begin
	if(!rst) begin	//reset PC to zero
		PC <= 0;
	end

	else if (!JumpPC) begin	//If JumpPC != 1, PC should only increment by 1
		PC <= PC + 1;
	end
	
	else if (JumpPC) begin	//If JumpPC == 1, PC should Jump
		PC <= jump;
	end 
end
endmodule