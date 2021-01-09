module Top(PC_VALUE);// testbench holds the PC Value.
	input wire[31:0]PC_VALUE;
	
	wire clk;
	wire [31:0]program_counter;
	wire [31:0]Inst;
	wire [31:0]PC_4;
	wire IF_Flush;
	wire IF_stall;  
	wire Store_FP;
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
	wire Store_Byte_control;
	wire float_control_read;
	wire float_control_write;
	wire [1:0]HILO_read_control;
	wire HILO_write_control;
	wire [35:0]control_signal;
	wire [27:0]Jmp_Adrs_ID_sl2;
	wire [31:0]Jmp_adrs;
	wire [4:0]RegRead_ID;
	wire [31:0]WB_data;
	wire [31:0]Write_data_MUX;
	wire [31:0]HILO_write_WB;
	wire [31:0]Write_data;
	wire [4:0]RegWr_WB;
	wire [4:0]RegWr_ID;
	wire [31:0]Imm32_ID;
	wire [31:0]Imm32_zero_ID;
	wire ID_Flush;
	wire [63:0]WB_data64;
	wire Write32_64;
	wire Load_Byte_control;
	wire MulDiv_control;
	wire FPwrite_control;
	wire RegWrite;
	wire FP;
	wire [31:0]Rs_data_ID;
	wire [31:0]HI;
	wire [31:0]LO;
	wire [31:0]Rs_MSG;
	wire [31:0]Rt_data_ID;
	wire [31:0]Rt_MSG;
	wire [31:0]read_data_ID;
	wire PC_stall;
	wire ID_stall_hazard;
	wire load_control;
	wire ID_stall;
	wire [35:0]control_signal_ID;
	wire [9:0]WB_control_EXE;
	wire [2:0]MEM_control_EXE;
	wire bc1f_control;
	wire bc1t_control;        
	wire Branch_Eq_control; 
	wire Branch_notEq_control;
	wire Jmp_Rgst_control;    
	wire Jmp_control;    
	wire [1:0]Alusrc;         
	wire Rt_Rd_control;       
	wire REG_dst;        
	wire [11:0]ALU_control;   
	wire FP_EXE;             
	wire [31:0]PC_EXE;        
	wire [31:0]Rs_data_EXE;
	wire [31:0]IN_ALU_MSG1;
	wire [31:0]Rt_data_EXE;
	wire [31:0]IN_ALU_MSG2;
	wire [31:0]Imm_EXE;   
	wire [31:0]Imm_zero_EXE;
	wire [4:0]Shamt_EXE;  
	wire [4:0]Rd_EXE;      
	wire [4:0]Rt_EXE;         
	wire [4:0]Rs_EXE;         
	wire [31:0]Imm_sl2_EXE;
	wire [31:0]Branch_adrs;
	wire [31:0]RtRd_data_EXE;
	wire [31:0]IN_ALU_MUX;
	wire [4:0]RegWr_EXE;
	wire [31:0]IN_ALU_1;
	wire [31:0]IN_ALU_2;
	wire [31:0]Adrs_MEM;
	wire ZF_ALU;
	wire [31:0]ALUOut_EXEC;
	wire [63:0]OUT_ALU64;
	wire [1:0]Forward_MUX1;
	wire [1:0]Forward_MUX2;
	wire [4:0]RegWr_MEM;
	wire RegWrite_EXE_MEM;
	wire RegWrite_MEM_WB;
	wire bc1f_out;
	wire bc1t_out;
	wire Branch_FP;
	wire Branch_notEq;
	wire Branch_Eq;
	wire Branch_out;
	wire Branch;
	wire Flush;
	wire Rs_Rt_control;
	wire [31:0]IN_ALU_MUX2;
	wire [9:0]WB_control_MEM;
	wire MemWrite;
	wire MemWrite64;
	wire MemRead;
	wire [63:0]OUT_ALU64_MEM;
	wire [31:0]Rt_data_MEM;
	wire [63:0]Rt_data64_MEM;
	wire [31:0]HILO_write_MEM;
	wire [31:0]OUT_data_MEM;
	wire [31:0]OUT_nextdata_MEM;
	wire [63:0]OUT_data64_MEM;
	wire [63:0]Rt_data64_EXE;
	wire [63:0]OUT_ALU64_WB;
	wire [63:0]OUT_data64_WB;
	wire [31:0]Memory_WB;
	wire [31:0]ALU_WB;
	wire  MemToReg;
	wire  MemToReg64;
	wire  Jal_control;
	wire [31:0]PC_IN1;
	wire [31:0]PC_IN2;
	wire [31:0]PC_IN;
	wire [31:0]Rd_data_ID;
	wire [31:0]Rd_data_EXE;	
	wire [31:0]PC_wire;
	reg c1;
	/*wire FP_out;
	wire [31:0]Rs_MSG_out;
	wire [31:0]Rt_data_ID_out;
	wire [31:0]Rt_MSG_out;
	wire [31:0]Rd_data_ID_out;*/
	
initial begin
	c1=1;
end
always@(clk)begin
		#100 c1=0;
end

	clock TOP_Clock(clk);
	mux_2to1 PC_MUX(PC_wire,PC_IN,PC_VALUE,c1);//determines initial PC value
	//stage1 : instruction fetch (IF)
	//PC top_PC(program_counter, PC_VALUE, PC_IN, PC_stall, clk);
	PC top_PC(program_counter, PC_wire, PC_stall, clk);
	
	Adder PC_Adder(PC_4, program_counter, 32'h4);

	instructionMemory top_Instruction_memory(Inst, program_counter);
	
	or o1_IF(Flush, Branch, IF_Flush);//whether to flush or not. in case of jump/branch
	
	IF_ID Top_IF_ID(clk,
						PC_4,
						Inst, 
						Flush, 
						IF_stall, 
						Op_code, 
						Rs_ID,  
						Rt_ID,	 
						Rd_ID,	
						Shamt_ID,
						Funct_ID,
						Imm16_ID,
						Jmp_Adrs_ID,
						Fmt,
						Fs,
						Fd,
						PC_ID);
						
	//stage2 : instruction decode and register fetch (ID)
	control_unit Top_control_unit(
					Store_FP,
					ID_Flush,
					IF_Flush,
					Store_Byte_control,
					float_control_read,
		    		HILO_read_control,
					control_signal,
					Op_code,
					Funct_ID,
					Fmt,
					Rt_ID);//ft
					
	shift_left_26bits Top_shift_left26(Jmp_Adrs_ID_sl2, Jmp_Adrs_ID);
	
	assign Jmp_adrs={PC_ID[31:28], Jmp_Adrs_ID_sl2[27:0]};
	
	mux_2to1_5bits MUX_ID1(RegRead_ID, Rs_ID, Fs, float_control_read); //to read first register (Rs or Fs)
	mux_2to1 MUX_ID2(Write_data_MUX, WB_data , PC_ID , Jal_control); //to select PC in jump and link case
	mux_2to1 MUX_ID3(Write_data, Write_data_MUX, HILO_write_WB, HILO_write_control); //to select HI/LO data in move from HI/LO case
	mux_2to1_5bits MUX_ID4(RegWr_ID, RegWr_WB, Fd, float_control_write); //to write in floating point registers or core instruction registers
	
	sign_extend Top_sign_extend(Imm32_ID, Imm16_ID);
	zero_extend Top_zero_extend(Imm32_zero_ID, Imm16_ID);
		
	registerFile regFile(
							Rs_data_ID,
							Rs_MSG,
							Rt_data_ID,
							Rt_MSG,
							Rd_data_ID,
							HI,
							LO,
							FP,
							clk,
							Rs_ID,
							Rt_ID,
							Rd_ID,
							RegWr_ID,
							Write_data,
							WB_data64,
							Load_Byte_control,
							Store_Byte_control,
							RegWrite,
							float_control_read,
							float_control_write,
							FPwrite_control,
							MulDiv_control,
							Write32_64,
							Jal_control,
							Store_FP);	
	
	
	mux_3to1 MUX_ID5(read_data_ID, Rs_data_ID, HI, LO, HILO_read_control); //determine Rs/HI/LO in case of move from HI/LO
	
	Hazard_Detection_Unit Top_hazard_Detection_unit(
							IF_stall,
							PC_stall,
							ID_stall_hazard,
							Rt_ID,
							Rs_ID,
							RegWr_EXE,
							load_control);
	
	or or_ID1(ID_stall, ID_stall_hazard, ID_Flush, Branch); //determine whether to flush ID
	
	mux_2to1_35bits MUX_ID6(control_signal_ID, control_signal, 36'h0, ID_stall); //determine whether to flush ID/EXE register
	
	//stage3 : execuction stage (EXEC)
	ID_EXE Top_ID_EXE(
						Rs_Rt_control,
						WB_control_EXE,
						MEM_control_EXE,
						bc1f_control,            
						bc1t_control,           
						Branch_Eq_control,         
						Branch_notEq_control,
						Jmp_Rgst_control,       
						Jmp_control,                
						Alusrc,                
						Rt_Rd_control,              
						REG_dst,                   
						ALU_control,     
						FP_EXE,                 
						PC_EXE,          
						Rs_data_EXE,
						IN_ALU_MSG1,
						Rt_data_EXE,
						IN_ALU_MSG2,
						Imm_EXE,           
						Imm_zero_EXE,
						Shamt_EXE,          
						Rd_EXE,              
						Rt_EXE,           
						Rs_EXE, 
						Rd_data_EXE,
						clk,
						control_signal_ID,//*****///
						FP_out,
						PC_ID,
						read_data_ID,
						Rs_MSG,
						Rt_data_ID,
						Rt_MSG,
						Rd_data_ID,
						Imm32_ID,
						Imm32_zero_ID,
						Shamt_ID,
						Rd_ID,
						Rt_ID,
						Rs_ID);
	
		assign load_control=MEM_control_EXE[2];
		
		shift_left_32bits Top_shift_left_32(Imm_sl2_EXE, Imm_EXE); //to calculate branch address
		
		Adder Branch_Add(Branch_adrs, PC_EXE, Imm_sl2_EXE);//to calculate branch address
		
		mux_2to1 MUX_EXE1(IN_ALU_MUX2, Rs_data_EXE, Rt_data_EXE, Rs_Rt_control);//to select between Rs/Rt to be the first input of ALU
		
		mux_2to1 MUX_EXE2(RtRd_data_EXE, Rt_data_EXE, Rd_data_EXE, Rt_Rd_control);//to select between Rt/Rd to be the second input of ALU
		
		mux_4to1 MUX_EXE3(IN_ALU_MUX, RtRd_data_EXE, Imm_EXE, Imm_zero_EXE, Shamt_EXE, Alusrc);//to select second input of ALU 
	
		mux_2to1_5bits MUX_EXE4(RegWr_EXE, Rd_EXE, Rt_EXE, REG_dst);//to select the register that we want to write in (in the WB stage)
		
		mux_3to1 MUX_EXE5(IN_ALU_1, Rs_data_EXE, Adrs_MEM, WB_data, Forward_MUX1);//forwarding mux Rs
	
		mux_3to1 MUX_EXE6(IN_ALU_2, IN_ALU_MUX, Adrs_MEM, WB_data, Forward_MUX2);//forwarding mux Rt
		
		ALU Top_ALU(ALUOut_EXEC, OUT_ALU64, ZF_ALU, IN_ALU_MSG1, IN_ALU_1, IN_ALU_2, IN_ALU_MSG2, ALU_control);
		
		Forwarding_unit Top_Forwarding_unit(
								Forward_MUX1,
								Forward_MUX2,
								RegWr_MEM,
								RegWr_WB,
								Rt_EXE,
								Rs_EXE,
								RegWrite_EXE_MEM,
								RegWrite_MEM_WB);
		
		wire not_FP_EXE;
		not n1_EXE(not_FP_EXE, FP_EXE);		//
		and a1_EXE(bc1f_out, bc1f_control, not_FP_EXE); //branch on FP false
		and a2_EXE(bc1t_out, bc1t_control, FP_EXE); //branch on FP true	
		or o1_EXE(Branch_FP, bc1f_out, bc1t_out);//branch on FP condition
		
		wire not_ZF_ALU;
		not n2_EXE(not_ZF_ALU, ZF_ALU);
		and a3_EXE(Branch_notEq, Branch_notEq_control, not_ZF_ALU);//branch not equal
		and a4_EXE(Branch_Eq, Branch_Eq_control, ZF_ALU);//branch equal 
		or o2_EXE(Branch_out, Branch_notEq, Branch_Eq);//branch comparison condition 
		
		or o3_EXE(Branch, Branch_FP, Branch_out);//branch or not

		assign Rt_data64_EXE = {IN_ALU_MSG2, Rt_data_EXE};
		
		//stage4 : memory stage (MEM)
		EXE_MEM Top_EXE_MEM(   
					clk,
					OUT_ALU64,
					ALUOut_EXEC,
					Rt_data64_EXE,
					Rt_data_EXE,
					RegWr_EXE,
					Rs_data_EXE,
					WB_control_EXE,
					MEM_control_EXE,
					OUT_ALU64_MEM,
					Adrs_MEM,
					Rt_data_MEM,
					Rt_data64_MEM,
					RegWr_MEM,
					HILO_write_MEM,
					WB_control_MEM,
					MemWrite64,
					MemWrite,
					MemRead);
		
		assign RegWrite_EXE_MEM = WB_control_MEM[8];
		
		DataMemory TOP_DataMemory(
					OUT_data_MEM,
					OUT_nextdata_MEM,
					Adrs_MEM,
					Rt_data_MEM,
					Rt_data64_MEM,
					MemRead,
					MemWrite,
					MemWrite64,
					clk);	
		
		assign OUT_data64_MEM = {OUT_data_MEM, OUT_nextdata_MEM};
		
		//stage5 : writeback stage (WB)		
		MEM_WB TOP_MEM_WB(
					clk,
					OUT_ALU64_MEM,
					OUT_data64_MEM,
					OUT_data_MEM,
					Adrs_MEM,
					RegWr_MEM,
					HILO_write_MEM,
					WB_control_MEM,
					OUT_ALU64_WB,
					OUT_data64_WB,
					Memory_WB,
					ALU_WB,
					RegWr_WB,
					HILO_write_WB,
					RegWrite,
					MemToReg,
					MemToReg64,
					MulDiv_control,
					HILO_write_control,
					Jal_control,
					FPwrite_control,
					Load_Byte_control,
					float_control_write,
					Write32_64);
					
		mux_2to1_64bits MUX_WB1(WB_data64, OUT_ALU64_WB, OUT_data64_WB, MemToReg64);//64 bit mux to select data to write back (ALU or Memory)
		
		mux_2to1 MUX_WB2(WB_data, Memory_WB, ALU_WB, MemToReg);//32 bit mux to select data to write back (ALU or Memory)
		
		assign RegWrite_MEM_WB = RegWrite;
		
		
		mux_2to1 MUX_WB3(PC_IN1, PC_4, Branch_adrs, Branch);//select branch adrs or next instruction
		mux_2to1 MUX_WB4(PC_IN2, PC_IN1, Jmp_adrs, Jmp_control);//select jump adrs or next instruction
		mux_2to1 MUX_WB5(PC_IN , PC_IN2, Rt_data_EXE, Jmp_Rgst_control);//select jump register adrs or next instruction
	
endmodule 

