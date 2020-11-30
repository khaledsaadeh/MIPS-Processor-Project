module PC(output reg[31:0]PC_out,
			 input [31:0]PC_IN,
			 input control,
			 input clk
			 );

	always@(posedge clk)begin
		if(control==0)	//fetch new instruction
			PC_out=PC_IN;
		else
			PC_out=PC_out;
	end
endmodule

/*--------------------------------------------------------------*/
module testbench_PC();
	wire [31:0]PC_out;
	reg control;
	reg clk;
	reg [31:0]PC_IN;
	
	PC my_PC(PC_out,PC_IN,control,clk);
	
initial begin
	$monitor("%h",PC_out);
	/* Case: control 1. stall, don't fetch new instruction
	PC_IN= 32'h 0FFFFFFF;
	control= 0;
	#2 clk<=1;
	#2 clk<=0;
	#2 clk<=1;
	#2 clk<=0;
	control=1;
	PC_IN=0;
	#2 clk<=1;
	#2 clk<=0;
	#2 clk<=1;*/

	//case: control 0, fetch new instruction
	PC_IN= 32'h 0FFFFFFF;
	control= 0;
	#2 clk<=1;
	#2 clk<=0;
	#2 clk<=1;
	#2 clk<=0;
	PC_IN=0;
	#2 clk<=1;
	#2 clk<=0;
	#2 clk<=1;

end
endmodule

	

				