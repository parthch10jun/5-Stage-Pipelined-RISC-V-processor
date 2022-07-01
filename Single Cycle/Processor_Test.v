`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:31:30 03/27/2022
// Design Name:   ProcessorTop
// Module Name:   C:/Users/parth/OneDrive/Desktop/Diary/digital_design/MIPS_SingleCycleProcessor/Processor_Test.v
// Project Name:  MIPS_SingleCycleProcessor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ProcessorTop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Processor_Test;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	ProcessorTop uut (
		.clk(clk), 
		.reset(reset)
	);

	initial begin 
		$dumpfile("output.vcd");
		$dumpvars;
		clk = 0;
		forever #5 clk = !clk;
	end
	
	initial begin 
		reset = 1;
		#1;
		reset = 0;
		#1;
		reset = 1;
		#200 $finish;
	end
      
endmodule

