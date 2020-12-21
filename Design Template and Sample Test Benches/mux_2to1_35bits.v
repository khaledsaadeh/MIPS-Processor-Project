module mux_2to1_35bits(c,a,b,sel);
	input [35:0]a;
	input [35:0]b;
	input sel;
	output [35:0]c;
	assign c = (sel==0)?a:b;
endmodule