module MEM_WB(
	input Clk,
	input [63:0]OUT_ALU64_MEM,
	input [63:0]OUT_data64_MEM,
	input [31:0]OUT_data_MEM,
	input [31:0]Adrs_MEM,
	input [4:0]RegWr_MEM,
	input [31:0]HILO_write_MEM,
	input [9:0]WB_control_MEM,
	output reg[63:0]OUT_ALU64_WB,
	output reg[63:0]OUT_data64_WB,
	output reg[31:0]Memory_WB,
	output reg[31:0]ALU_WB,
	output reg[4:0]RegWr_WB,
	output reg[31:0]HILO_write_WB,
	output reg RegWrite,
	output reg MemToReg,
	output reg MemToReg64,
	output reg MulDiv_control,
	output reg HILO_write_control,
	output reg Jal_control,
	output reg FPwrite_control,
	output reg Load_Byte_control,
	output reg float_control_write,
	output reg Write32_64
);

initial begin 
	 OUT_ALU64_WB=64'h0;
	 OUT_data64_WB=64'h0;
	 Memory_WB=32'h0;
	 ALU_WB=32'h0;
	 RegWr_WB=5'h0;
	 HILO_write_WB=32'h0;
	 RegWrite=0;
	 MemToReg=0;
	 MemToReg64=0;
	 MulDiv_control=0;
	 HILO_write_control=0;
	 Jal_control=0;
	 FPwrite_control=0;
	 Load_Byte_control=0;
	 float_control_write=0;
	 Write32_64=0;
end
always@(posedge Clk)begin

Jal_control = WB_control_MEM[0];
Load_Byte_control = WB_control_MEM[1];
FPwrite_control = WB_control_MEM[2];
HILO_write_control = WB_control_MEM[3];
MulDiv_control = WB_control_MEM[4];
float_control_write = WB_control_MEM[5];
MemToReg64 = WB_control_MEM[6];
MemToReg = WB_control_MEM[7];
RegWrite = WB_control_MEM[8];
Write32_64 = WB_control_MEM[9];

OUT_ALU64_WB=OUT_ALU64_MEM;
OUT_data64_WB=OUT_data64_MEM;
Memory_WB=OUT_data_MEM;
ALU_WB=Adrs_MEM;
RegWr_WB=RegWr_MEM;
HILO_write_WB=HILO_write_MEM;




end
endmodule
