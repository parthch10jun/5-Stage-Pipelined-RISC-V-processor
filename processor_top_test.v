module processor_top_test ();

reg clk, rst;
	processor_top proc(clk, rst);
	initial begin 
		clk = 0;
		forever #5 clk = !clk;
	end

	initial begin 
		rst = 1;
		#1;
		rst = 0;
		#1;
		rst = 1;
		#200 $finish;
	end

endmodule