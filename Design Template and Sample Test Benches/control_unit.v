//Control signal=
//control_signal[1:0]=2'b00; ALUSrc									
//control_signal[13:2]={Op_code,Funct_ID}; OP code & funct
//control_signal[14]=1;  JMP_Rgst_control							
//control_signal[15]=1;  Jmp_control									
//control_signal[16]=0;  Branch_Eq_control						
//control_signal[17]=0;  Branch_notEq_control						
//control_signal[18]=0;  REG_dst	
//control_signal[19]=0;  Rt_Rd_control
//control_signal[20]=0;  bc1f_control
//control_signal[21]=0;  bc1t_control		
//control_signal[24:22]=3'b000;  MEM_control_EX {MemRead, MemWrite, MemWrite64}						
//control_signal[34:25]=10'b0110000000;  WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}  					 												
//control_signal[35]=0; Rs_Rt_control

module control_unit(
					output reg Store_FP,
					output reg ID_Flush,
					output reg IF_Flush,
					output reg Store_Byte_control,
					output reg float_control_read,
		    		output reg [1:0]HILO_read_control,
					output reg [35:0]control_signal,
					input [5:0]Op_code,
					input [5:0]Funct_ID,
					input [4:0]Fmt,
					input [4:0]Ft);

initial begin 
	float_control_read=0;
	HILO_read_control = 2'b00;
	IF_Flush=0;
	ID_Flush=0;
	Store_Byte_control=0;
	Store_FP=0;
end
				
always@(*)begin
	if(Op_code==6'h 3)begin /*R type inst*/
			case(Funct_ID)
				6'h 1a:begin //DIVIDE
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b1100010000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}  
				end
				6'h 10:begin //MOVE FROM HI
						HILO_read_control=2'b01;
						float_control_read=1;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0100001000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}    					 												


					end
				6'h 12:begin //MOVE FROM LO
						HILO_read_control=2'b10;
						float_control_read=1;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0100001000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}  							

				end
				6'h 18:begin //MULTIPLY
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b1100010000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}  		 												

						
					end
				6'h 18:begin //SHIFT_RIGHT_ARTH
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
						
						control_signal[35]=1; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}    					 												

					end				
				6'h 14:begin //AND
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}    					 												

					end
					
				6'h 20:begin //ADD
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}  				 												

						
					end
				6'h 08:begin //Jump Register
						float_control_read=0;
						HILO_read_control = 2'b00;
						ID_Flush=0;
						Store_Byte_control=0;		
						IF_Flush=1;
						Store_FP=0;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=0;//JMP_Rgst_control							
						control_signal[15]=0;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0010000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}  					 												

					end
				6'h 21:begin //Load word new
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=1;//REG_dst	
						control_signal[19]=1;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b100;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0100000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												

					end
				6'h 27:begin //NOR
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}  				 												

					end
				6'h 25:begin //OR
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}  					 												

					end
				6'h 2A:begin //SET LESS THAN
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}  				 												

					end
				6'h 2B:begin //SET LESS THAN UNSIGNED 
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}  					 												
					end
					
				6'h 0:begin //SHIFT LEFT LOGICAL
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=1; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}  				 												
					end
					
				6'h 02:begin //SHIFT RIGHT LOGICAL
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=1; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}    					 												
					end
					
				6'h 13:begin //STORE word new
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=1;//REG_dst	
						control_signal[19]=1;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b010;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0000000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												
					end
					
				6'h 24:begin //SUBTRACT
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												
					end
					
				6'h 22:begin //SUBTRACT UNSIGNED (NOT REQUIERD ANYMORE !!!)
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}  				 												
				end	
			endcase	
		end
		
	case(Op_code)//I, J, FR, and FI type instructions
		6'h 11: //FR & FI instructions
				if(Fmt==8)begin  //FI
					if(Ft==1)begin//Branch FP true	
						float_control_read=0;
						HILO_read_control = 2'b00;
						Store_Byte_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Store_FP=0;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=1;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0000000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}  				 												
						end
						
					else if(Ft==0)begin//Branch on FP false
						float_control_read=0;
						HILO_read_control = 2'b00;
						Store_Byte_control=0;
						ID_Flush=0;
						IF_Flush=0;
						Store_FP=0;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=1;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0000000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												
						end	
						
					end
				else if(Fmt==5'h10)begin //FR
					if(Funct_ID==6'h0)begin //ADD FP single
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						float_control_read=1;
						Store_FP=0;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110100000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}    					 												
						end
						
					else if(Funct_ID==6'h32 || Funct_ID==6'h3c || Funct_ID==6'h3e)begin //compare FP single 
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						float_control_read=1;
						Store_FP=0;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000100;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}    					 												
						end
						
				end
				else if(Fmt==6'h11)begin //FR
					if(Funct_ID==6'h0)begin //Add double FP
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						float_control_read=1;
						Store_FP=0;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b1110100000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}  					 												
						end
						
					else if(Funct_ID==6'h32 || Funct_ID==6'h3c || Funct_ID==6'h3e)begin//compare double FP
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						float_control_read=1;
						Store_FP=0;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000100;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}    					 												
	    				end
				end
				
		6'h 31:begin //LOAD FP SINGLE 
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b01; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=1;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b100;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0100100000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}  			 												
						end
						
		6'h 35:begin //LOAD FP DOUBLE 
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b01; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=1;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b100;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b1101100000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}    					 												
						end
						
		6'h 39:begin //STORE FP SINGLE
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						float_control_read=0;
						Store_FP=1;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b01; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=1;//REG_dst	
						control_signal[19]=1;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b010;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0000000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}    					 												
						end
						
		6'h 3d:begin //STORE FP DOUBLE
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						float_control_read=0;
						Store_FP=1;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b01; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=1;//REG_dst	
						control_signal[19]=1;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b001;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0000000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}    					 												
						end
						
		6'h 9:begin //ADDi
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b01; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=1;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												
						end
						
		6'h 8:begin //ADDiu (NOT REQUIRED ANYMORE !!!)
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b01; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=1;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												
					end
					
		6'h 0c:begin //ANDi
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b10; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												
						end
						
		6'h 5:begin //BRANCH EQUAL
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=1;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0000000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												
						end
						
		6'h 4:begin //BRANCH NOT EQUAL
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=1;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0000000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												
						end
						
		6'h 22:begin //LOAD BYTE UNSIGNED
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b01; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=1;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b100;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0100000010;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												
						end
						
		6'h 0F:begin //LOAD UPPER IMM
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b10; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=1;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												
						end
						
		6'h 12:begin //LOAD WORD
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b01; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=1;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b100;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0100000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												
						end
						
		6'h 0E:begin //OR IMM
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b10; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=1;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0110000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												
						end
						
		6'h 28:begin //STORE BYTE
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=1;
						Store_FP=0;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b01; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=1;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b010;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0000000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												
						end
						
		6'h 2B:begin //STORE WORD
						float_control_read=0;
						HILO_read_control = 2'b00;
						IF_Flush=0;
						ID_Flush=0;
						Store_Byte_control=0;
						Store_FP=0;
		
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b01; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=1;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=1;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b010;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0000000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												
						end
						
		6'h 02:begin //Jump
						float_control_read=0;
						HILO_read_control = 2'b00;
						ID_Flush=0;
						Store_Byte_control=0;
						IF_Flush=1;
						Store_FP=0;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=1;//JMP_Rgst_control							
						control_signal[15]=0;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0000000000;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												
						end
						
		6'h 07:begin //Jump AND LINK
						float_control_read=0;
						HILO_read_control = 2'b00;
						ID_Flush=0;
						Store_Byte_control=0;		
						IF_Flush=1;
						Store_FP=0;
						
						control_signal[35]=0; //Rs_Rt_control
						control_signal[1:0]=2'b00; //ALUSrc									
						control_signal[13:2]={Op_code,Funct_ID};//OP code & funct
						control_signal[14]=0;//JMP_Rgst_control							
						control_signal[15]=0;//Jmp_control									
						control_signal[16]=0;//Branch_Eq_control						
						control_signal[17]=0;//Branch_notEq_control						
						control_signal[18]=0;//REG_dst	
						control_signal[19]=0;//Rt_Rd_control
						control_signal[20]=0;//bc1f_control
						control_signal[21]=0;//bc1t_control		
						control_signal[24:22]=3'b000;//MEM_control_EX {MemRead, MemWrite, MemWrite64}						
						control_signal[34:25]=10'b0100000001;//WB_control_EX {1 Write32_64,2 RegWrite,3 MemToReg,4 MemToReg64,5 float_control_write,6 MulDiv_control,7 HilO_write_control,8 FPwrite_control,10 Load_Byte_control, Jal_control}   					 												
						end	
			
	endcase
		
	end
	
endmodule
/*------------------------------------------------------*/
module testbench_control_unit();
		wire ID_Flush;
		wire IF_Flush;
		wire Store_Byte_control;
		wire float_control_read;
		wire [1:0]HILO_read_control;
		wire [35:0]control_signal;
		reg [5:0]Op_code;
		reg [5:0]Funct_ID;
		reg [4:0]Fmt;
		reg [4:0]Ft;
		
		control_unit my_control_unit(ID_Flush, IF_Flush, Store_Byte_control, float_control_read, HILO_read_control, control_signal, Op_code, Funct_ID, Fmt, Ft);
		
	initial begin
		//jump and link
		#1
		Op_code= 6'h 07;
		Funct_ID=6'h 0;
		#1
		$display("jump and link:");
		$display("ID Flush control is%b",ID_Flush);
		$display("IF Flush control is%b",IF_Flush);
		$display("Store byte control is%b",Store_Byte_control);
		$display("float control read is%b",float_control_read);
		$display("control signal execution is%b",control_signal[21:0]);
		$display("control signal memory is%b",control_signal[24:22]);
		$display("control signal writeback is%b \n",control_signal[34:25]);
		
		//store word
		#1
		Op_code= 6'h 2B;
		Funct_ID=6'h 0;
		#1
		$display("store word:");
		$display("ID Flush control is%b",ID_Flush);
		$display("IF Flush control is%b",IF_Flush);
		$display("Store byte control is%b",Store_Byte_control);
		$display("float control read is%b",float_control_read);
		$display("control signal execution is%b",control_signal[21:0]);
		$display("control signal memory is%b",control_signal[24:22]);
		$display("control signal writeback is%b \n",control_signal[34:25]);
		
		//AND
		#1
		Op_code= 6'h 3;
		Funct_ID=6'h 14;
		#1
		$display("AND:");
		$display("ID Flush control is%b",ID_Flush);
		$display("IF Flush control is%b",IF_Flush);
		$display("Store byte control is%b",Store_Byte_control);
		$display("float control read is%b",float_control_read);
		$display("control signal execution is%b",control_signal[21:0]);
		$display("control signal memory is%b",control_signal[24:22]);
		$display("control signal writeback is%b \n",control_signal[34:25]);
		
		//store byte
		#1
		Op_code= 6'h 28;
		Funct_ID=6'h 0;
		#1
		$display("store byte:");
		$display("ID Flush control is%b",ID_Flush);
		$display("IF Flush control is%b",IF_Flush);
		$display("Store byte control is%b",Store_Byte_control);
		$display("float control read is%b",float_control_read);
		$display("control signal execution is%b",control_signal[21:0]);
		$display("control signal memory is%b",control_signal[24:22]);
		$display("control signal writeback is%b \n",control_signal[34:25]);
		
		//load fp double 
		#1
		Op_code= 6'h 35;
		Funct_ID=6'h 0;
		#1
		$display("load fp double:");
		$display("ID Flush control is%b",ID_Flush);
		$display("IF Flush control is%b",IF_Flush);
		$display("Store byte control is%b",Store_Byte_control);
		$display("float control read is%b",float_control_read);
		$display("control signal execution is%b",control_signal[21:0]);
		$display("control signal memory is%b",control_signal[24:22]);
		$display("control signal writeback is%b \n",control_signal[34:25]);
		
		//DIVIDE
		#1
		Op_code= 6'h 3;
		Funct_ID=6'h 1a;
		#1
		$display("DIVIDE:");
		$display("ID Flush control is%b",ID_Flush);
		$display("IF Flush control is%b",IF_Flush);
		$display("Store byte control is%b",Store_Byte_control);
		$display("float control read is%b",float_control_read);
		$display("control signal execution is%b",control_signal[21:0]);
		$display("control signal memory is%b",control_signal[24:22]);
		$display("control signal writeback is%b \n",control_signal[34:25]);
		
		//BRANCH FP FALSE
		#1
		Op_code= 6'h 11;
		Funct_ID=6'h 0;
		Fmt=5'h8;
		Ft=5'h0;
		#1
		$display("BRANCH FP FALSE:");
		$display("ID Flush control is%b",ID_Flush);
		$display("IF Flush control is%b",IF_Flush);
		$display("Store byte control is%b",Store_Byte_control);
		$display("float control read is%b",float_control_read);
		$display("control signal execution is%b",control_signal[21:0]);
		$display("control signal memory is%b",control_signal[24:22]);
		$display("control signal writeback is%b \n",control_signal[34:25]);
		
	end
		
endmodule

