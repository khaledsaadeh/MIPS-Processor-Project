/*

stage4 : memory stage (MEM)
stage5 : writeback stage (WB)
*/
module Top(PC_VALUE);// testbench holds the PC Value.
	input PC_VALUE;
	wire Clk;
	wire [31:0]PC_out;
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
	wire [1:0]HILO_write_control;
	wire [34:0]control_signal;
	wire [27:0]Jmp_Adrs_ID_sl2;
	wire [4:0]RegRead_ID;
	wire [31:0]WB_data;
	wire [31:0]Write_data_MUX;
	wire [31:0]HILO_write_WB;
	wire [31:0]Write_data;
	wire [31:0]RegWr_WB;
	wire [31:0]RegWr_ID;
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
	wire load_control; // 3 or 1?
	wire ID_stall;
	wire control_signal_ID;
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
	wire [31:0]RegWr_EXE;
	wire [31:0]IN_ALU_1;
	wire [31:0]IN_ALU_2;
	wire [31:0]Adrs_MEM;
	wire ZF_ALU;
	wire [31:0]OUT_ALU32;
	wire [63:0]OUT_ALU64;
	wire [1:0]Forward_MUX1;
	wire [1:0]Forward_MUX2;
	wire [4:0]RegWr_MEM;
	wire RegWrite_EXE_MEM;
	wire RegWrite_MEM_WB;
	wire bc1f_out;
	wire bc1t_outl;
	wire Branch_FP;
	wire Branch_notEq;
	wire Branch_Eq;
	wire Branch_out;
	wire Branch;
	wire Flush;
	
	
	
	
	clock Clock(Clk);
	//stage1 : instruction fetch (IF)
	PC top_PC(PC_out, PC_IN, PC_stall, Clk);
	Adder PC_Adder(PC_4, PC_out, 32'h4);
	instructionMemory top_Instruction_memory(Inst, PC_out);
	
	or o1_IF(Flush, Branch, IF_Flush);//whether to flush or not. in case of jump/branch
	
	IF_ID Top_IF_ID(Clk,
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
					Rt_ID);
					
	shift_left_26bits Top_shift_left26(Jmp_Adrs_ID_sl2, Jmp_Adrs_ID);
	
	mux_2to1 MUX_ID1(RegRead_ID, Rs_ID, Fs, float_control_read); //to read first register (Rs or Fs)
	mux_2to1 MUX_ID2(Write_data_MUX, WB_data , PC_ID , Jal_control); //to select PC in jump and link case
	mux_2to1 MUX_ID3(Write_data, Write_data_MUX, HILO_write_WB, HILO_write_control); //to select HI/LO data in move from HI/LO case
	mux_2to1 MUX_ID4(RegWr_ID, RegWr_WB, Fd, float_control_write); //to write in floating point registers or core instruction registers
	
	sign_extend Top_sign_extend(Imm32_ID, Imm16_ID);
	zero_extend Top_zero_extend(Imm32_zero_ID, Imm16_ID);
	
	registerFile Top_registerFile(
							Rs_data_ID,
							Rs_MSG,
							Rt_data_ID,
							Rt_MSG,
							HI,
							LO,
							FP,
							Clk,
							Rs_ID,
							Rt_ID,
							RegWr_ID,
							Write_data,
							Write_data64,
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
							Rd_EXE,
							load_control);
	
	or or_ID1(ID_stall, ID_stall_hazard, ID_Flush, Branch); //determine whether to flush ID
	
	mux_2to1_35bits MUX_ID6(control_signal_ID, control_signal, 35'h0, ID_stall); //determine whether to flush ID/EXE register
	
	//stage3 : execuction stage (EXEC)
	ID_EXE	Top_ID_EXE(
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
						Clk,
						control_signal,
						FP,
						PC_ID,
						read_data_ID,
						Rs_MSG,
						Rt_data_ID,
						Rt_MSG,
						Imm32_ID,
						Imm32_zero_ID,
						Shamt_ID,
						Rd_ID,
						Rt_ID,
						Rs_ID);
						
						
		shift_left_32bits Top_shift_left_32(Imm_sl2_EXE, Imm_EXE); //to calculate branch address
		
		Adder Branch_Add(Branch_adrs, PC_EXE, Imm_sl2_EXE);//to calculate branch address
		
		mux_2to1 MUX_EXE1(RtRd_data_EXE, Rt_data_EXE, Rd_EXE, Rt_Rd_control);//to select between Rt/Rd to be the input of ALU
		
		mux_4to1 MUX_EXE2(IN_ALU_MUX, RtRd_data_EXE, Imm_EXE, Imm_zero_EXE, Shamt_EXE, ALUsrc);//to select second input of ALU 
	
		mux_2to1 MUX_EXE3(RegWr_EXE, Rd_EXE, Rt_EXE, REG_dst);//to select the register that we want to write in (in the WB stage)
		
		mux_3to1 MUX_EXE4(IN_ALU_1, Rs_data_EXE, Adrs_MEM, WB_data, Forward_MUX1);//forwarding mux Rs
	
		mux_3to1 MUX_EXE5(IN_ALU_2, IN_ALU_MUX, Adrs_MEM, WB_data, Forward_MUX2);//forwarding mux Rt
		
		ALU Top_ALU(OUT_ALU32, OUT_ALU64, ZF_ALU, IN_ALU_MSG1, IN_ALU_1, IN_ALU_2, IN_ALU_MSG2, ALU_control);
		
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
		
endmodule 
