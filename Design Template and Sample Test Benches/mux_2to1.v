module mux_2to1(c,a,b,sel);
	input [31:0]a;
	input [31:0]b;
	input sel;
	output reg[31:0]c;
			
	always@(*)begin 
		if(sel==0)
			c=a;
		else if(sel==1)
			c=b;
		else c=32'hx;
	end
	
	
	
endmodule
/*--------------------------------------------------------------*/
module testbench_mux_2to1();
	reg [31:0]x,y;
	reg sel;
	wire [31:0]z;

	mux_2to1 myMux(z,x,y,sel);
	
	
initial begin
	x= 32'h0;
	y= 32'h0fff0;
	sel=0;
	$monitor("z= %b",z);
	#1 sel=1;
	#1 $monitor("z= %b",z);
end

endmodule
