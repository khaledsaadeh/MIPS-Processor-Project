module Adder(c,a,b);
	input [31:0]a,b;
	output reg[31:0]c;

always@(*)begin
	c=a+b;
end
endmodule
/*--------------------------------------------------------------*/
module testbench_Adder();
	reg [31:0]a,b;
	wire [31:0]c;
	
	Adder myadder(c,a,b);
	
initial begin
	$monitor("%h",c);
	a= 32'h 10;
	b= 32'h 2;
	
end
	
endmodule
