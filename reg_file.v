module reg_file (
	input clk,
	input rst,
	input RegWrite,
	input [2:0] read_reg_num_1,
	input [2:0] write_reg_num,
	input [7:0] write_data,
	output [7:0] read_data_1
);

reg [7:0] regfile [7:0];
assign read_data_1 = regfile[read_reg_num_1];

always @(*) begin 
	if(!rst) begin
		regfile[0] <= 0;
		regfile[1] <= 1;
		regfile[2] <= 2;
		regfile[3] <= 3;
		regfile[4] <= 4;
		regfile[5] <= 5;
		regfile[6] <= 6;
		regfile[7] <= 7;
	end
	
	else if (RegWrite) regfile[write_reg_num] = write_data;
end

endmodule