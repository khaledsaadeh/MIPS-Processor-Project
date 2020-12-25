module mux_3to1(z,a,b,c,sel);
	input [31:0]a;
	input [31:0]b;
	input [31:0]c;
	input [1:0]sel;
	output reg[31:0]z;
	
	always@(*)begin 
		if(sel==0)
			z=a;
		else if(sel==01)
			z=b;
		else if(sel==2'b10)
			z=c;
		else z=32'hx;
	end
	
endmodule
/*--------------------------------------------------------------*/
module testbench_mux_3to1();
	reg [31:0]x,y,w;
	reg [1:0]sel;
	wire [31:0]z;

	mux_3to1 myMux(z,x,y,w,sel);
	
initial begin

	x= 32'h 1;
	y= 32'h 10;
	w= 32'h 100;
	
	sel=00;
	#1$display("z is%b",z);
	sel=01;
	#1$display("z is%b",z);
	sel=2'b10;
	#1$display("z is%b",z);
	sel=2'b11;
	#1$display("z is%b",z);
end

endmodule
