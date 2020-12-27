module EXE_MEM(   
	input Clk,
	input [63:0]OUT_ALU64,
	input [31:0]OUT_ALU32,
	input [63:0]Rt_data64_EXE,
	input [31:0]Rt_data_EXE,
	input [4:0]RegWr_EXE,
	input [31:0]Rs_data_EXE,
	input [9:0]WB_control_EX,
	input [2:0]MEM_control_EX,
	output reg[63:0]OUT_ALU64_MEM,
	output reg[31:0]Adrs_MEM,
	output reg[31:0]Rt_data_MEM,
	output reg[63:0]Rt_data64_MEM,
	output reg[4:0]RegWr_MEM,
	output reg[31:0]HILO_write_MEM,
	output reg [9:0]WB_control_MEM,
	output reg MemWrite64,
	output reg MemWrite,
	output reg MemRead
);

initial begin
	OUT_ALU64_MEM	<=64'h0;
	Adrs_MEM			<=32'h0;
	Rt_data_MEM		<=32'h0;
	Rt_data64_MEM	<=64'h0;
	RegWr_MEM		<=5'h0;
	HILO_write_MEM	<=32'h0;
	WB_control_MEM	<=10'h0;
	MemWrite64		<=0;
	MemWrite			<=0;
	MemRead			<=0;
end

always@(posedge Clk)begin
WB_control_MEM<=WB_control_EX;
MemRead<=MEM_control_EX[2];
MemWrite<=MEM_control_EX[1];
MemWrite64<=MEM_control_EX[0];


OUT_ALU64_MEM<=OUT_ALU64;
Adrs_MEM<=OUT_ALU32;
Rt_data_MEM<=Rt_data_EXE;
Rt_data64_MEM<=Rt_data64_EXE;
RegWr_MEM<=RegWr_EXE;
HILO_write_MEM<=Rs_data_EXE;



end
endmodule
