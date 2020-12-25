module clock(clk);
	output clk;
	reg clk;
	initial begin
		clk <= 0;
	end
	always
		begin
		#50
		clk <= ~clk;	
	end
endmodule
/*-------------------*/
module testbench_clock();
wire Clk;

clock My_clock(Clk);

initial begin
	#1 $monitor("clock: %b",Clk);
end
endmodule
