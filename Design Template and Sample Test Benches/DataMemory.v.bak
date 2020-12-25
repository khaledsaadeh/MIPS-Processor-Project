//MIPS archeticture is big-endian.
//A big-endian system stores the most significant byte of a word at the smallest memory address and the least significant byte at the largest.
//Example: storing the word ABCD in address 0 will result as shown below (each letter is a byte)
// 			Reading from adress 4 will result in: data = XYZW
/*
|Adrs| Dat|
|---------|
|0	|	A	 |
|---------|
|1	|	B	 |
|---------|
|2	|	C	 |
|---------|
|3	|	D	 |
|---------|
|4	|	X 	 |
|---------|
|5	|	Y	 |
|---------|
|6	|	Z	 |
|---------|
|7	|	W	 |
|---------|
|8	|		 |
----------|
|.	|		 |
|---------|
|.	|		 |
|---------|
|.	|		 |
|---------|
|1023	|	 |
|---------|

*/
module DataMemory (
						output reg [31:0]OUT_data_MEM,
						output reg[31:0]OUT_nextdata_MEM,
						input [31:0]Adrs_MEM,
						input [31:0]Rt_data_MEM,
						input [63:0]Rt_data64_MEM,
						input MemRead,
						input MemWrite,
						input MemWrite64,
						input Clk);	

///  Intitialization for the memory 	
reg [7:0] mem [1023:0]; // building a 1k memory //
integer i;

initial
	begin
		for(i = 0; i <1024; i = i + 1)
			begin
				mem[i] <=  0;
				if((i+1)%4 == 0)
				mem[i] <= i+1;
			end
		
	end

//read from memory 
always@(negedge Clk)begin 							//always output two words, whether reading a word or double. Top module will be able to choose which to use.
	if(MemRead)begin									//
		OUT_data_MEM[31:24]=mem[Adrs_MEM];		//read word (most significant word in case of reading 'double')
		OUT_data_MEM[23:16]=mem[Adrs_MEM+1];
		OUT_data_MEM[15:8] =mem[Adrs_MEM+2];
		OUT_data_MEM[7:0]	 =mem[Adrs_MEM+3];
		
		OUT_nextdata_MEM[31:24]=mem[Adrs_MEM+4];		//read least significant word when reading 'double')
		OUT_nextdata_MEM[23:16]=mem[Adrs_MEM+5];
		OUT_nextdata_MEM[15:8] =mem[Adrs_MEM+6];
		OUT_nextdata_MEM[7:0]  =mem[Adrs_MEM+7];
	end
end

//Write to memory
always@(posedge Clk)begin
	if(MemWrite)begin //write word
		mem[Adrs_MEM]	=Rt_data_MEM[31:24]; //MSGB in base address 
		mem[Adrs_MEM+1]=Rt_data_MEM[23:16];
		mem[Adrs_MEM+2]=Rt_data_MEM[15:8];
		mem[Adrs_MEM+3]=Rt_data_MEM[7:0];  //LSGB in base+3
	end
	if(MemWrite64)begin//write double
		mem[Adrs_MEM]	=Rt_data64_MEM[63:56]; //MSGB in base address 
		mem[Adrs_MEM+1]=Rt_data64_MEM[55:48];
		mem[Adrs_MEM+2]=Rt_data64_MEM[47:40];
		mem[Adrs_MEM+3]=Rt_data64_MEM[39:32];
		mem[Adrs_MEM+4]=Rt_data64_MEM[31:24];
		mem[Adrs_MEM+5]=Rt_data64_MEM[23:16];
		mem[Adrs_MEM+6]=Rt_data64_MEM[15:8];
		mem[Adrs_MEM+7]=Rt_data64_MEM[7:0];	//LSGB in base+7
	end
end
endmodule
/*-----------------------------------------------------------------------------------*/
module testbench_memory();
		wire [31:0]OUT_data_MEM;
		wire [31:0]OUT_nextdata_MEM;
		reg [31:0]Adrs_MEM;
		reg [31:0]Rt_data_MEM;
		reg [63:0]Rt_data64_MEM;
		reg MemRead;
		reg MemWrite;
		reg MemWrite64;
		reg Clk;

DataMemory My_memory(OUT_data_MEM, OUT_nextdata_MEM, Adrs_MEM, Rt_data_MEM, Rt_data64_MEM, MemRead, MemWrite, MemWrite64, Clk);

initial begin
	Clk <= 0;
	#1 Clk <= ~Clk;		
	#1 //case1: Mem Write word in address 8
	Clk <= ~Clk;
	Adrs_MEM=32'd 8;
	Rt_data_MEM=32'h 1111;
	MemRead=0;
	MemWrite=1;
	MemWrite64=0;
	#1 Clk <= ~Clk;
	#1 $display("data in address 8 is %h%h%h%h \n", My_memory.mem[8], My_memory.mem[9], My_memory.mem[10], My_memory.mem[11]);
	Clk <= ~Clk;
	
	#1 //case2: Mem Write double in address 16
	Clk <= ~Clk;
	Adrs_MEM=32'd 16;
	Rt_data_MEM=32'h 1111;
	Rt_data64_MEM= 32'h ffffffffffffffe;
	MemRead=0;
	MemWrite=1;
	MemWrite64=1;
	#1 Clk <= ~Clk;
	#1 $display("data in address 16 is %h%h%h%h%h%h%h%h \n", My_memory.mem[16], My_memory.mem[17], My_memory.mem[18], My_memory.mem[19], My_memory.mem[20], My_memory.mem[21], My_memory.mem[22], My_memory.mem[23]);
	Clk <= ~Clk;
	
	#1 //case3: Mem read word from address 8
	Clk <= ~Clk;
	Adrs_MEM=32'd 8;
	MemRead=1;
	MemWrite=0;
	MemWrite64=0;
	#1 Clk <= ~Clk;
	#1 $display("data in address 8 is %h %h \n", OUT_data_MEM, OUT_nextdata_MEM);
	Clk <= ~Clk;
	
		
	#1 //case4: Mem read double from address 16
	Clk <= ~Clk;
	Adrs_MEM=32'd 16;
	MemRead=1;
	MemWrite=0;
	MemWrite64=0;
	#1 Clk <= ~Clk;
	#1 $display("data in address 16 is %h %h \n", OUT_data_MEM, OUT_nextdata_MEM);
	Clk <= ~Clk;
end
endmodule
	