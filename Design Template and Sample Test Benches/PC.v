module PC(output reg[31:0]PC_out,
			 input [31:0]PC_INITIAL,
			 input [31:0]PC_IN,
			 input control,
			 input clk
			 );

initial begin
	 #1 PC_out=PC_INITIAL;
end

 always@(posedge clk)begin
	if(control==0)	//fetch new instruction
		PC_out=PC_IN;
	else if(control==1)
		PC_out=PC_out;//stall
end
endmodule

/*--------------------------------------------------------------*/
module testbench_PC();
	wire [31:0]PC_out;
	reg [31:0]PC_INITIAL;
	reg control;
	reg clk;
	reg [31:0]PC_IN;
	
	
	PC my_PC(PC_out,PC_INITIAL,PC_IN,control,clk);
	
initial begin
	$monitor("%h",PC_out);
	PC_INITIAL=32'h 0FFFFFFF;
	control= 0;
	#1 clk<=0;
	#1 clk<=1;
	#1 clk<=0;
	#1 clk<=1;
	#1 clk<=0;
	PC_IN=0;
	#1 clk<=1;
	#1 clk<=0;
	#1 clk<=1;
	#1 clk<=0;
	#1 clk<=1;
	PC_IN=32'h0FFF;
	#1 clk<=1;
	#1 clk<=0;
	#1 clk<=1;
	#1 clk<=0;
	#1 clk<=1;
	PC_IN=32'h1;
	#1 clk<=1;
	#1 clk<=0;
	#1 clk<=1;
	#1 clk<=0;
	#1 clk<=1;
	PC_IN=32'h0B;
	#1 clk<=1;
	#1 clk<=0;
	#1 clk<=1;
	#1 clk<=0;
	#1 clk<=1;

end
endmodule

	

				