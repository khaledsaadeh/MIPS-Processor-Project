module mux_2to1_35bits(c,a,b,sel);
	input [35:0]a;
	input [35:0]b;
	input sel;
	output reg[35:0]c;
			
	always@(*)begin 
		if(sel==0)
			c=a;
		else if(sel==1)
			c=b;
		else c=36'hx;
	end
	
endmodule
