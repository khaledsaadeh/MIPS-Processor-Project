module mux_2to1_5bits(c,a,b,sel);
	input [4:0]a;
	input [4:0]b;
	input sel;
	output [4:0]c;
	assign c = (sel==0)?a:b;
endmodule