module mux_2to1_64bits(c,a,b,sel);
	input [63:0]a;
	input [63:0]b;
	input sel;
	output reg[63:0]c;
			
	always@(*)begin 
		if(sel==0)
			c=a;
		else if(sel==1)
			c=b;
		else c=64'hx;
	end
	
endmodule
