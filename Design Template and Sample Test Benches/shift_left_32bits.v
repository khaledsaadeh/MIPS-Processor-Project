module shift_left_32bits(
					output [31:0]y,
					input [31:0]x);
	assign y=x<<2;
endmodule

/*---------------------------------------------*/
module testbench_shift_left_32bits();
	reg [31:0]x;
	wire [31:0]y;
		
	shift_left_32bits my_shift_left_32bits(y,x);
	
	initial begin	
			x=32'h 2;
			
			$monitor("%h",y);
	end
endmodule

		
					