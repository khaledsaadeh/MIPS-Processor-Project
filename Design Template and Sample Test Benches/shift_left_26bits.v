module shift_left_26bits(
					output [27:0]y,
					input [25:0]x);
	assign y=x<<2;
endmodule

/*---------------------------------------------*/
module testbench_shift_left_26bits();
	reg [25:0]x;
	wire [27:0]y;
		
	shift_left_26bits my_shift_left_26bits(y,x);
	
	initial begin	
			x=26'h 2;
			
			$monitor("%h",y);
	end
endmodule

		
					