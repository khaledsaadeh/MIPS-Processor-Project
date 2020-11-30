module mux_4to1(z,a,b,c,d,sel);
	input [31:0]a;
	input [31:0]b;
	input [31:0]c;
	input [31:0]d;
	input [1:0]sel;
	output reg[31:0]z;
	
	always@(sel)begin 
		if(sel==0)
			z=a;
		else if(sel==01)
			z=b;
		else if(sel==2'b10)
			z=c;
		else if(sel==2'b11)
			z=d;
		else z=32'hx;
	end
	
endmodule
/*--------------------------------------------------------------*/
module testbench_mux_4to1();
	reg [31:0]a,b,c,d;
	reg [1:0]sel;
	wire [31:0]z;

	mux_4to1 myMux(z,a,b,c,d,sel);
	
initial begin

	a= 32'h 1;
	b= 32'h 10;
	c= 32'h 100;
	d= 32'h 10000;
	
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
