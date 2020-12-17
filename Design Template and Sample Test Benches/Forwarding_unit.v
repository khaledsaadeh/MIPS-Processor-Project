module Forwarding_unit(
								output reg[1:0]Forward_MUX1,
								output reg[1:0]Forward_MUX2,
								input [4:0]RegWr_MEM,
								input [4:0]RegWr_WB,
								input [4:0]Rt_EXE,
								input [4:0]Rs_EXE,
								input RegWrite_EXE_MEM,
								input RegWrite_MEM_WB);
								
always@(*)begin
	/*default case*/
	Forward_MUX1=2'b00;
	Forward_MUX2=2'b00;
	
	/*ALU-ALU forwarding*/
	if(RegWrite_EXE_MEM 	&&  	//check if will update any registers
			RegWr_MEM!=0 	&&		//check for error of writting in zero register
			RegWr_MEM==Rs_EXE) 	//check if we will read from a newly updated register 
					Forward_MUX1=2'b01;
					
	if(RegWrite_EXE_MEM 	&&		//check if will update any registers
		RegWr_MEM!=0 		&&    //check for error of writting in zero register
		RegWr_MEM==Rt_EXE)      //check if we will read from a newly updated register 
					Forward_MUX2=2'b01;
					
	/*MEM-ALU forwarding*/	
	if(RegWrite_MEM_WB 	&&		//check if will update any registers
		RegWr_WB!=0			&&    //check for error of writting in zero register
		RegWr_WB==Rs_EXE	&&    //check if we will read from a newly updated register 
		!(RegWrite_EXE_MEM && RegWr_MEM!=0 && (RegWr_MEM==Rs_EXE)))  //check case of both hazards occuring at the same time, priority is given to the most recent value (ALU-ALU forwarding)
					Forward_MUX1=2'b10;
					
	if(RegWrite_MEM_WB 	&&		//check if will update any registers
		RegWr_WB!=0 		&&    //check for error of writting in zero register
		RegWr_WB==Rt_EXE	&&    //check if we will read from a newly updated register 
		!(RegWrite_EXE_MEM && RegWr_MEM!=0 && (RegWr_MEM==Rt_EXE)))	//check case of both hazards occuring at the same time, priority is given to the most recent value (ALU-ALU forwarding)
					Forward_MUX2=2'b10;
	
end
endmodule
/*---------------------------------------------------------*/
module testbench_Forwarding_unit();
		wire [1:0]Forward_MUX1;
		wire [1:0]Forward_MUX2;
		reg [4:0]RegWr_MEM;
		reg [4:0]RegWr_WB;
		reg [4:0]Rt_EXE;
		reg [4:0]Rs_EXE;
		reg RegWrite_EXE_MEM;
		reg RegWrite_MEM_WB;
		
Forwarding_unit My_Forwarding_unit(Forward_MUX1, Forward_MUX2, RegWr_MEM, RegWr_WB, Rt_EXE, Rs_EXE, RegWrite_EXE_MEM, RegWrite_MEM_WB);
		
		reg Clk;
		
initial begin
	Clk <= 0;
	#1 Clk <= ~Clk;		
	#1 //case1: NO forwarding 
	Clk <= ~Clk;
	RegWr_MEM=5'h1;
	RegWr_WB=5'h5;
	Rt_EXE=5'h4;
	Rs_EXE=5'h3;
	RegWrite_EXE_MEM=0;
	RegWrite_MEM_WB=0;
	#1 Clk <= ~Clk;
	#1 $display("Rs MUX is %b ", Forward_MUX1);
		$display("Rt MUX is %b \n\n", Forward_MUX2);
	Clk <= ~Clk;
	
	#1 //case2: NO forwarding (same register but no register write control)
	Clk <= ~Clk;
	RegWr_MEM=5'h1;
	RegWr_WB=5'h5;
	Rt_EXE=5'h1;
	Rs_EXE=5'h1;
	RegWrite_EXE_MEM=0;
	RegWrite_MEM_WB=0;
	#1 Clk <= ~Clk;
	#1 $display("Rs MUX is %b ", Forward_MUX1);
		$display("Rt MUX is %b \n\n", Forward_MUX2);
	Clk <= ~Clk;
	
	#1 //case3: ALU-ALU forwarding Rs
	Clk <= ~Clk;
	RegWr_MEM=5'h1;
	RegWr_WB=5'h5;
	Rt_EXE=5'h0;
	Rs_EXE=5'h1;
	RegWrite_EXE_MEM=1;
	RegWrite_MEM_WB=0;
	#1 Clk <= ~Clk;
	#1 $display("Rs MUX is %b ", Forward_MUX1);
		$display("Rt MUX is %b \n\n", Forward_MUX2);
	Clk <= ~Clk;
		
	#1 //case4: ALU-ALU forwarding Rt
	Clk <= ~Clk;
	RegWr_MEM=5'h1;
	RegWr_WB=5'h5;
	Rt_EXE=5'h1;
	Rs_EXE=5'h0;
	RegWrite_EXE_MEM=1;
	RegWrite_MEM_WB=0;
	#1 Clk <= ~Clk;
	#1 $display("Rs MUX is %b ", Forward_MUX1);
		$display("Rt MUX is %b \n\n", Forward_MUX2);
	Clk <= ~Clk;
	
	#1 //case5: MEM-ALU forwarding Rs
	Clk <= ~Clk;
	RegWr_MEM=5'h1;
	RegWr_WB=5'h5;
	Rt_EXE=5'h0;
	Rs_EXE=5'h5;
	RegWrite_EXE_MEM=1;
	RegWrite_MEM_WB=1;
	#1 Clk <= ~Clk;
	#1 $display("Rs MUX is %b ", Forward_MUX1);
		$display("Rt MUX is %b \n\n", Forward_MUX2);
	Clk <= ~Clk;
	
	#1 //case6: MEM-ALU forwarding Rt
	Clk <= ~Clk;
	RegWr_MEM=5'h1;
	RegWr_WB=5'h5;
	Rt_EXE=5'h5;
	Rs_EXE=5'h0;
	RegWrite_EXE_MEM=1;
	RegWrite_MEM_WB=1;
	#1 Clk <= ~Clk;
	#1 $display("Rs MUX is %b ", Forward_MUX1);
		$display("Rt MUX is %b \n\n", Forward_MUX2);
	Clk <= ~Clk;
	
	#1 //case7: both MEM-ALU & ALU-ALU forwarding at the same time, Rt
	Clk <= ~Clk;
	RegWr_MEM=5'h1;
	RegWr_WB=5'h1;
	Rt_EXE=5'h1;
	Rs_EXE=5'h0;
	RegWrite_EXE_MEM=1;
	RegWrite_MEM_WB=1;
	#1 Clk <= ~Clk;
	#1 $display("Rs MUX is %b ", Forward_MUX1);  
		$display("Rt MUX is %b \n\n", Forward_MUX2); //expect 01
	Clk <= ~Clk;
	
	#1 //case8: both MEM-ALU & ALU-ALU forwarding at the same time, Rs
	Clk <= ~Clk;
	RegWr_MEM=5'h1;
	RegWr_WB=5'h1;
	Rt_EXE=5'h0;
	Rs_EXE=5'h1;
	RegWrite_EXE_MEM=1;
	RegWrite_MEM_WB=1;
	#1 Clk <= ~Clk;
	#1 $display("Rs MUX is %b ", Forward_MUX1);  
		$display("Rt MUX is %b \n\n", Forward_MUX2); //expect 01
	Clk <= ~Clk;
end
endmodule
	
















