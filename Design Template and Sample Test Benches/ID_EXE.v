module ID_EXE(
				output reg Rs_Rt_control,
				output reg [9:0]WB_control_EXE,
				output reg [2:0]MEM_control_EXE,
				output reg bc1f_control,
				output reg bc1t_control,
				output reg Branch_Eq_control,
				output reg Branch_notEq_control,
				output reg Jmp_Rgst_control,
				output reg Jmp_control,
				output reg [1:0]Alusrc,
				output reg Rt_Rd_control,
				output reg REG_dst,
				output reg [11:0]ALU_control,
				output reg FP_EXE,
				output reg [31:0]PC_EXE,
				output reg [31:0]Rs_data_EXE,
				output reg [31:0]IN_ALU_MSG1,
				output reg [31:0]Rt_data_EXE,
				output reg [31:0]IN_ALU_MSG2,
				output reg [31:0]Imm_EXE,
				output reg [31:0]Imm_zero_EXE,
				output reg [4:0]Shamt_EXE,
				output reg [4:0]Rd_EXE,
				output reg [4:0]Rt_EXE,
				output reg [4:0]Rs_EXE,
				output reg [31:0]Rd_data_EXE,
				input Clk,
				input [35:0]control_signal,
				input	FP,
				input [31:0]PC_ID,
				input [31:0]read_data_ID,
				input [31:0]Rs_MSG,
				input [31:0]Rt_data_ID,
				input [31:0]Rt_MSG,
				input [31:0]Rd_data_ID,
				input [31:0]Imm32_ID,
				input [31:0]Imm32_zero_ID,
				input [4:0]Shamt_ID,
				input [4:0]Rd_ID,
				input [4:0]Rt_ID,
				input [4:0]Rs_ID);

initial begin
	Rs_Rt_control=0;
	WB_control_EXE=10'h0;
	MEM_control_EXE=3'h0;
	bc1f_control=0;
	bc1t_control=0;
	Branch_Eq_control=0;
	Branch_notEq_control=0;
	Jmp_Rgst_control=0;
	Jmp_control=0;
	Alusrc=2'b0;
	Rt_Rd_control=0;
	REG_dst=0;
	ALU_control=12'h0;
	FP_EXE=0;
	PC_EXE=32'h0;
	Rs_data_EXE=32'h0;
	IN_ALU_MSG1=32'h0;
	Rt_data_EXE=32'h0;
	IN_ALU_MSG2=32'h0;
	Imm_EXE=32'h0;
	Imm_zero_EXE=32'h0;
	Shamt_EXE=5'h0;
	Rd_EXE=5'h0;
	Rt_EXE=5'h0;
	Rs_EXE=5'h0;
	Rd_data_EXE=32'h0;
end

always@(posedge Clk)begin //read on negative edge
	Alusrc = control_signal[1:0];
	ALU_control = control_signal[13:2];
	Jmp_Rgst_control = control_signal[14];
	Jmp_control = control_signal[15];
	Branch_Eq_control = control_signal[16];
	Branch_notEq_control = control_signal[17];
	REG_dst = control_signal[18];
	Rt_Rd_control = control_signal[19];
	bc1f_control = control_signal[20];
	bc1t_control = control_signal[21];
	MEM_control_EXE = control_signal[24:22];
	WB_control_EXE = control_signal[34:25];
	Rs_Rt_control = control_signal[35];
	FP_EXE = FP;
	PC_EXE = PC_ID;
	Rs_data_EXE = read_data_ID;
	IN_ALU_MSG1 = Rs_MSG;
	Rt_data_EXE = Rt_data_ID;
	IN_ALU_MSG2 = Rt_MSG;
	Imm_EXE = Imm32_ID;
	Imm_zero_EXE = Imm32_zero_ID;
	Shamt_EXE = Shamt_ID;
	Rd_EXE = Rd_ID;
	Rt_EXE = Rt_ID;
	Rs_EXE = Rs_ID;
end
endmodule
