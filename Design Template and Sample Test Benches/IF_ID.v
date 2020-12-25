module IF_ID(
				input Clk,
				input [31:0]PC_4,
				input [31:0]Inst,
				input IF_Flush,
				input IF_stall,
				output reg[5:0]Op_code,		
				output reg[4:0]Rs_ID,		
				output reg[4:0]Rt_ID,		
				output reg[4:0]Rd_ID,		
				output reg[4:0]Shamt_ID,		
				output reg[5:0]Funct_ID,		
				output reg[15:0]Imm16_ID,		
				output reg[25:0]Jmp_Adrs_ID,
				output reg[4:0]Fmt,			
				output reg[4:0]Fs,				
				output reg[4:0]Fd,				
				output reg[31:0]PC_ID			
				);

initial begin
	Op_code=6'h0;	
	Rs_ID=5'h0;
	Rt_ID=5'h0;
	Rd_ID=5'h0;	
	Shamt_ID=5'h0;
	Funct_ID=6'h0;
	Imm16_ID=16'h0;	
	Jmp_Adrs_ID=26'h0;
	Fmt=5'h0;
	Fs=5'h0;	
	Fd=5'h0;		
	PC_ID=32'h0;		
end

always@(posedge Clk)begin //read
if(!IF_Flush && !IF_stall)begin
	Op_code=	Inst[31:26];
	Rs_ID=Inst[25:21];		
   Rt_ID=Inst[20:16];
   Rd_ID=Inst[15:11];		
   Shamt_ID=Inst[10:6];		
   Funct_ID=Inst[5:0];		
   Imm16_ID=Inst[15:0];		
   Jmp_Adrs_ID=Inst[25:0];
   Fmt=Inst[25:21];			
   Fs=Inst[15:11];				
   Fd=Inst[10:6];				
   PC_ID=PC_4;
end else if(IF_Flush)begin
	Op_code=6'b0;
	Rs_ID=5'b0;		
   Rt_ID=5'b0;
   Rd_ID=5'b0;		
   Shamt_ID=5'b0;		
   Funct_ID=6'b0;		
   Imm16_ID=16'b0;		
   Jmp_Adrs_ID=26'b0;
   Fmt=5'b0;			
   Fs=5'b0;				
   Fd=5'b0;				
   PC_ID=PC_4;
end else if(IF_stall)begin
end
end
endmodule
/*----------------------------------------------------------------------------------------------------*/
module testbench_IF_ID();
		reg clk;
		reg [31:0]PC_4;
		reg [31:0]Inst;
		reg IF_Flush;
		reg IF_stall;
		wire [5:0]Op_code;		
		wire [4:0]Rs_ID;	
		wire [4:0]Rt_ID;		
		wire [4:0]Rd_ID;		
		wire [4:0]Shamt_ID;		
		wire [5:0]Funct_ID;		
		wire [15:0]Imm16_ID;		
		wire [25:0]Jmp_Adrs_ID;
		wire [4:0]Fmt;			
		wire [4:0]Fs;				
		wire [4:0]Fd;					
		wire [31:0]PC_ID;			

IF_ID my_IF_ID(clk, PC_4, Inst, IF_Flush, IF_stall, Op_code, Rs_ID, Rt_ID, Rd_ID, Shamt_ID, Funct_ID, Imm16_ID, Jmp_Adrs_ID, Fmt, Fs, Fd, PC_ID);

initial begin
	clk <= 0;
	#1 
	clk <= ~clk;		
	#1
	//case1: I want to flush
	clk <= ~clk;
	IF_Flush=1;
	#1
	clk <= ~clk;
	#1
	$display("instruction is %b", Inst);
	clk <= ~clk;
	#1
	//case2: I want to read instruction
	IF_Flush=0;
	IF_stall=0;
	Inst=32'b 11111100000111110000011111000000;
	$display("Rs is %b", Rs_ID);
	$display("Rt is %b", Rt_ID);
	$display("Rd is %b", Rd_ID);
	$display("Fs is %b", Fs);
	$display("Fd is %b", Fd);
	$display("Shamt is %b", Shamt_ID);
	$display("Funct is %b", Funct_ID);
	$display("immediet is %b", Imm16_ID);
	$display("jump address is %b", Jmp_Adrs_ID);
	$display("Fmt is %b", Fmt);
	clk <= ~clk;
	#1
	clk <= ~clk;
	#1
	clk <= ~clk;
	#1
	clk <= ~clk;
	
	
end
endmodule
	