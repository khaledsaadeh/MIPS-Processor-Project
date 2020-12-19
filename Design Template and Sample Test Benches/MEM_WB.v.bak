module MEM_WB(
input Clk,
input [63:0]OUT_ALU64_MEM,
input [63:0]OUT_data64_MEM,
input [31:0]OUT_data_MEM,
input [31:0]Adrs_MEM,
input [31:0]RegWr_MEM,
input [31:0]HILO_write_MEM,
input [9:0]WB_control_MEM;
output reg[63:0]OUT_ALU64_WB,
output reg[63:0]OUT_data64_WB,
output reg[31:0]Memory_WB,
output reg[31:0]ALU_WB,
output reg[31:0]RegWr_WB,
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
output reg Write32_64,
);

always@(negedge Clk)begin

Jal_control = WB_control_MEM[0];
Load_Byte_control = WB_control_MEM[1];
FPwrite_control = WB_control_MEM[2];
HilO_write_control = WB_control_MEM[3];
MulDiv_control = WB_control_MEM[4];
float_control_write = WB_control_MEM[5];
MemToReg64 = WB_control_MEM[6];
MemToReg = WB_control_MEM[7];
RegWrite = WB_control_MEM[8];
Write32_64 = WB_control_MEM[9];

OUT_ALU64_WB=OUT_ALU64_MEM;
OUT_data64_MEM=Out_data64_WB;
Memory_WB=OUT_data_MEM;
ALU_WB=Adrs_MEM;
RegWr_WB=RegWr_MEM;
HILO_write_WB=HILO_write_MEM;




end
endmodule
