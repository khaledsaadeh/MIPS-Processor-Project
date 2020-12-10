/*Control signal=
/ ALUSrc 2 / 
/ ALU_control 12 (Op_code 6 / Funct_ID 6)
/ JMP_Rgst_control 1 / Jmp_control 1
/ Branch_Eq_control 1/ Branch_notEq_control 1
/ REG_dst 1
/ MEM_control_EX  2(MemWrite 1/ MemRead 1) 
/ WB_control_EX 2 (MemToReg 1/ RegWrite 1)
/ Rt_Rd_control
/ float_control
/ MemToReg64 
*/

module control_unit(
					output reg Jal_control,
					output reg ID_Flush,
					output reg IF_Flush,
					output reg Store_Byte_control,
					output reg Load_Byte_control,
					output reg float_control,
					output reg [23:0]control_signal,
					output reg [1:0]HILO_read_control,
					output reg [1:0]HILO_write_control,
					output reg MemToReg64,
					output reg MemWrite64,
					input [5:0]Op_code,
					input [5:0]Funct_ID,
					input [4:0]Fmt);

initial begin 
	float_control=0;
	HILO_read_control = 2'b00;
	HILO_write_control=0;
	MemToReg64=0;
	MemWrite64=0;
end
				
always@(*)begin
	if(Op_code==6'h 3)begin /*R type inst*/
			case(Funct_ID)
				6'h 1a:begin //DIVIDE
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						float_control=1;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b01;//WB_control_EX   
						control_signal[22:21]=2'b00;//MEM_control_EX	 
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 10:begin //MOVE FROM HI
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						float_control=0;
						HILO_read_control=2'b01;
						HILO_write_control=1;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b01;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control

					end
				6'h 12:begin //MOVE FROM LO
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						float_control=0;
						HILO_read_control=2'b10;
						HILO_write_control=1;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b01;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 18:begin //MULTIPLY
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						float_control=1;
						HILO_read_control=2'b00;
						HILO_write_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b01;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 18:begin //SHIFT_RIGHT_ARTH
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						float_control=0;
						HILO_read_control=2'b00;
						HILO_write_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end				
				6'h 14:begin //AND
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b11;//WB_control_EX
						control_signal[22:21]=2'b00;//MEM_control_EX	
						control_signal[23]=0;//Rt_Rd_control
					end
					
				6'h 20:begin //ADD
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b11;//WB_control_EX
						control_signal[22:21]=2'b00;//MEM_control_EX	
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 08:begin //Jump Register
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=1;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=0;//JMP_Rgst_control
						control_signal[15]=0;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b10;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 21:begin //Load word new
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=1;//REG_dst
						control_signal[20:19]=2'b01;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b01;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=1;//Rt_Rd_control
					end
				6'h 27:begin //NOR
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 25:begin //OR
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 2A:begin //SET LESS THAN
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 2B:begin //SET LESS THAN UNSIGNED
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 0:begin //SHIFT LEFT LOGICAL
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 02:begin //SHIFT RIGHT LOGICAL
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 13:begin //STORE word new
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=1;//REG_dst
						control_signal[20:19]=2'b00;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b10;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=1;//Rt_Rd_control
					end
				6'h 24:begin //SUBTRACT
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b11;//WB_control_EX
						control_signal[22:21]=2'b00;//MEM_control_EX	
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 22:begin //SUBTRACT UNSIGNED
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b11;//WB_control_EX
						control_signal[22:21]=2'b00;//MEM_control_EX	
						control_signal[23]=0;//Rt_Rd_control
					end	
			endcase	
		end
		
	case(Op_code)//I and J type instructions
		6'h 11:
				if(Fmt==8)begin //BRANCH FP true or false
						Jal_control=0;
						ID_Flush=1;
						IF_Flush=1;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=1;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b00;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
		6'h 31:begin //LOAD FP SINGLE 
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b01; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=1;//REG_dst
						control_signal[20:19]=2'b01;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b01;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
		6'h 35:begin //LOAD FP DOUBLE 
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b01; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=1;//REG_dst
						control_signal[20:19]=2'b01;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b01;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
						MemToReg64=1;
						float_control=1;
					end
		6'h 39:begin //STORE FP SINGLE
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b01; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=1;//REG_dst
						control_signal[20:19]=2'b00;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b10;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
		6'h 3d:begin //STORE FP DOUBLE
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b01; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=1;//REG_dst
						control_signal[20:19]=2'b00;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b10;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
						MemWrite64=1;
					end
		6'h 9:begin //ADDi
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b01; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=1;//REG_dst
						control_signal[20:19]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
		6'h 8:begin //ADDiu
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b01; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=1;//REG_dst
						control_signal[20:19]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
		6'h 0c:begin //ANDi
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b10; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
		6'h 5:begin //BRANCH EQUAL
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=1;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b00;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
		6'h 4:begin //BRANCH NOT EQUAL
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=1;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b00;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
		6'h 22:begin //LOAD BYTE UNSIGNED
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=1;
						Store_Byte_control=0;
						control_signal[1:0]=2'b01; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=1;//REG_dst
						control_signal[20:19]=2'b01;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b01;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
		6'h 0F:begin //LOAD UPPER IMM
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b10; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=1;//REG_dst
						control_signal[20:19]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
		6'h 12:begin //LOAD WORD
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b01; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=1;//REG_dst
						control_signal[20:19]=2'b01;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b01;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
		6'h 0E:begin //OR IMM
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b10; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=1;//REG_dst
						control_signal[20:19]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
		6'h 28:begin //STORE BYTE
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=1;
						control_signal[1:0]=2'b01; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=1;//REG_dst
						control_signal[20:19]=2'b00;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b10;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
		6'h 2B:begin //STORE WORD
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b01; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=1;//REG_dst
						control_signal[20:19]=2'b00;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b10;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
		6'h 02:begin //Jump
						Jal_control=0;
						ID_Flush=0;
						IF_Flush=1;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=0;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b00;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
		6'h 07:begin //Jump AND LINK
						Jal_control=1;
						ID_Flush=0;
						IF_Flush=1;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=0;//JMP_Rgst_control
						control_signal[15]=0;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[20:19]=2'b10;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[22:21]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
				end	
			
	endcase
		
	end
	
endmodule
/*------------------------------------------------------*/
module testbench_control_unit();
		wire Jal_control;
		wire ID_Flush;
		wire IF_Flush;
		wire Store_Byte_control;
		wire Load_Byte_control;
		wire [23:0]control_signal;
		reg [5:0]Op_code;
		reg [5:0]Funct_ID;
		
		control_unit my_control_unit(Jal_control,ID_Flush,IF_Flush,Store_Byte_control,Load_Byte_control,control_signal,Op_code,Funct_ID);
		
	initial begin
		//CASE STORE WORD I TYPE INStructions
		Op_code= 6'h 07;
		Funct_ID=6'h 0;
		$display("Jump and link control is%b",Jal_control);
		$display("ID Flush control is%b",ID_Flush);
		$display("IF Flush control is%b",IF_Flush);
		$display("Store byte control is%b",Store_Byte_control);
		$display("Load Byte control is%b",Load_Byte_control);
		$display("control signal is%b",control_signal);
		
		#1
		Op_code= 6'h 2B;
		Funct_ID=6'h 0;
		$display("Jump and link control is%b",Jal_control);
		$display("ID Flush control is%b",ID_Flush);
		$display("IF Flush control is%b",IF_Flush);
		$display("Store byte control is%b",Store_Byte_control);
		$display("Load Byte control is%b",Load_Byte_control);
		$display("control signal is%b",control_signal);
		
		#1
		Op_code= 6'h 3;
		Funct_ID=6'h 14;
		$display("Jump and link control is%b",Jal_control);
		$display("ID Flush control is%b",ID_Flush);
		$display("IF Flush control is%b",IF_Flush);
		$display("Store byte control is%b",Store_Byte_control);
		$display("Load Byte control is%b",Load_Byte_control);
		$display("control signal is%b",control_signal);
	end
		
endmodule

