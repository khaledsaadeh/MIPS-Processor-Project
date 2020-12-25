module mux_2to1_5bits(c,a,b,sel);
	input [4:0]a;
	input [4:0]b;
	input sel;
	output reg[4:0]c;

			
	always@(*)begin 
		if(sel==0)
			c=a;
		else if(sel==1)
			c=b;
		else c=5'hx;
	end
	
endmodule
