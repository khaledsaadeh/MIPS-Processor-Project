module sign_extend(
				output [31:0]y,
				input [15:0]x);
	assign y={{16{x[15]}},x};
endmodule
/*-------------------------*/
module testbench_sign_extend();
	
	reg [15:0]x;
	wire [31:0]y;
	
	sign_extend my_sign_extend(y,x);

	initial begin
	//case1: x is anehative number
	#2 x=16'h FFFF;
	$monitor("%h",y);
	//case2: x is apositive number
	#2 x=16'h 5;
	$monitor("%h",y);
	end	 
endmodule

