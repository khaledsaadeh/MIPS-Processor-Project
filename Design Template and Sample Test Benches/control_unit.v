/*Control signal=
/ ALUSrc 2 / 
/ ALU_control 12 (Op_code 6 / Funct_ID 6)
/ JMP_Rgst_control 1 / Jmp_control 1
/ Branch_Eq_control 1/ Branch_notEq_control 1
/ REG_dst 1
/ MEM_control_EX  2(MemWrite 1/ MemRead 1) 
/ WB_control_EX 2 (MemToReg 1/ RegWrite 1)
/ Rt_Rd_control
*/

module control_unit(
					output reg ID_Flush,
					output reg IF_Flush,
					output reg Store_Byte_control,
					output reg Load_Byte_control,
					output reg [23:0]control_signal,
					input [5:0]Op_code,
					input [5:0]Funct_ID);
					
always@(*)begin
		if(Op_code==6'h 3)begin /*R type inst*/
			case(Funct_ID)
				6'h 14:begin //AND
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[2:13]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[19:20]=2'b11;//WB_control_EX
						control_signal[21:22]=2'b00;//MEM_control_EX	
						control_signal[23]=0;//Rt_Rd_control
					end
					
				6'h 20:begin //ADD
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[2:13]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[19:20]=2'b11;//WB_control_EX
						control_signal[21:22]=2'b00;//MEM_control_EX	
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 08:begin //Jump Register
						ID_Flush=0;
						IF_Flush=1;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[2:13]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=0;//JMP_Rgst_control
						control_signal[15]=0;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[19:20]=2'b10;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[21:22]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 21:begin //Load word new
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[2:13]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=1;//REG_dst
						control_signal[19:20]=2'b01;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[21:22]=2'b01;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=1;//Rt_Rd_control
					end
				6'h 27:begin //NOR
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[2:13]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[19:20]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[21:22]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 2A:begin //SET LESS THAN
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[2:13]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[19:20]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[21:22]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 2B:begin //SET LESS THAN UNSIGNED
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[2:13]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[19:20]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[21:22]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 0:begin //SHIFT LEFT LOGICAL
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[2:13]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[19:20]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[21:22]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 02:begin //SHIFT RIGHT LOGICAL
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[2:13]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[19:20]=2'b11;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[21:22]=2'b00;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 13:begin //STORE word new
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[2:13]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=1;//REG_dst
						control_signal[19:20]=2'b00;//WB_control_EX (MemToReg 1/ RegWrite 1)
						control_signal[21:22]=2'b10;//MEM_control_EX	(MemWrite 1/ MemRead 1)
						control_signal[23]=1;//Rt_Rd_control
					end
				6'h 24:begin //SUBTRACT
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[2:13]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[19:20]=2'b11;//WB_control_EX
						control_signal[21:22]=2'b00;//MEM_control_EX	
						control_signal[23]=0;//Rt_Rd_control
					end
				6'h 22:begin //SUBTRACT UNSIGNED 
						ID_Flush=0;
						IF_Flush=0;
						Load_Byte_control=0;
						Store_Byte_control=0;
						control_signal[1:0]=2'b00; //ALUSrc
						control_signal[2:13]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control
						control_signal[15]=1;//Jmp_control
						control_signal[16]=0;//Branch_Eq_control
						control_signal[17]=0;//Branch_notEq_control
						control_signal[18]=0;//REG_dst
						control_signal[19:20]=2'b11;//WB_control_EX
						control_signal[21:22]=2'b00;//MEM_control_EX	
						control_signal[23]=0;//Rt_Rd_control
		end
					
		endcase	
end	
end					
endmodule
