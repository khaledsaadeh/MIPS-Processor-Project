module mux_2to1(c,a,b,sel);
	input [31:0]a;
	input [31:0]b;
	input sel;
	output [31:0]c;
	assign c = (sel==0)?a:b;
endmodule
/*--------------------------------------------------------------*/
module testbench_mux_2to1();
	reg [31:0]x,y;
	reg sel;
	wire [31:0]z;

	mux_2to1 myMux(z,x,y,sel);
	
	
initial begin
	$monitor("z= %b",z);
	x= 32'h 1;
	y=0;
	sel=0;
	
end

endmodule
