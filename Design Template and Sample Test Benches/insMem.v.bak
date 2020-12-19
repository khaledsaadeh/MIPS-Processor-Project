module instructionMemory(instruction, PC);
	integer j;
	input [31:0]PC;
	output [31:0]instruction;
	reg [7:0] mem [16383:0];
	wire [31:0]instruction;
	initial begin
			for (j = 0; j<16384; j = j + 1)//16k
				begin
					mem[j] <= 8'b0;
				end		
				
				
				///Load OPeratios 
				//lw $t0,0($t10)module instructionMemory(instruction, PC);
	integer j;
	input [31:0]PC;
	output [31:0]instruction;
	reg [7:0] mem [16383:0];
	wire [31:0]instruction;
	initial begin
			for (j = 0; j<16384; j = j + 1)
				begin
					mem[j] <= 8'b0;
				end		
				
				
				///Load OPeratios 
				//lw $t0,0($t10)
				//lw $t1,4($t10)
				//lw $t2,8($t10)
				//lw $t3,12($t10)
				//lw $t4,16($t10)
				//lw $t5,20($t10)
				//lw $t6,24($t10)
				//lw $t7,28($t10)
				//lw $t8,32($t10)
				//lw $t9,36($t10)
				
			mem[0] <= 'h49;
			mem[1] <= 'h40;
			mem[2] <= 'h00;
			mem[3] <= 'h00;
			
			mem[4] <= 'h49;
			mem[5] <= 'h41;
			mem[6] <= 'h00;
			mem[7] <= 'h04;
			
			mem[8] <= 'h49;
			mem[9] <= 'h42;
			mem[10] <= 'h00;
			mem[11] <= 'h08;
			
			mem[12] <= 'h49;
			mem[13] <= 'h43;
			mem[14] <= 'h00;
			mem[15] <= 'h0c;
			
			mem[16] <= 'h49;
			mem[17] <= 'h44;
			mem[18] <= 'h00;
			mem[19] <= 'h10;
			
			mem[20] <= 'h49;
			mem[21] <= 'h45;
			mem[22] <= 'h00;
			mem[23] <= 'h14;
			
			mem[24] <= 'h49;
			mem[25] <= 'h46;
			mem[26] <= 'h00;
			mem[27] <= 'h18;
			
			mem[28] <= 'h49;
			mem[29] <= 'h47;
			mem[30] <= 'h00;
			mem[31] <= 'h1c;
			
			mem[32] <= 'h49;
			mem[33] <= 'h48;
			mem[34] <= 'h00;
			mem[35] <= 'h20;
			
			mem[36] <= 'h49;
			mem[37] <= 'h49;
			mem[38] <= 'h00;
			mem[39] <= 'h24;
			//an arethmatic operation
			////////////////////////////////////
			//addi t0,t0,#5
			//addi t1,t0,#10
			//add  t3,t1,t2
			//and  t4,t1,t2
			mem[100] <= 'h24;
			mem[101] <= 'h00;
			mem[102] <= 'h00;
			mem[103] <= 'h05;
			
			mem[104] <= 'h24;
			mem[105] <= 'h01;
			mem[106] <= 'h00;
			mem[107] <= 'h0a;
			
			mem[108] <= 'h0c;
			mem[109] <= 'h22;
			mem[100] <= 'h18;
			mem[111] <= 'h20;
			
			mem[112] <= 'h0c;
			mem[113] <= 'h20;
			mem[114] <= 'h20;
			mem[115] <= 'h14;
			
			//arethmatic operation 
			/////////////////////////////////////////////////
			//addi t0,t0,hex(10)
			//addi t1,t0,hex(01)
			//or   t3,t1,t0
			mem[200] <= 'h24;
			mem[201] <= 'h00;
			mem[202] <= 'h00;
			mem[203] <= 'h10;
			
			mem[204] <= 'h24;
			mem[205] <= 'h01;
			mem[206] <= 'h00;
			mem[207] <= 'h01;
			
			mem[208] <= 'h0c;
			mem[209] <= 'h22;
			mem[210] <= 'h18;
			mem[211] <= 'h25;
			
			
			///Store //******************************************
			//addi $t0,$t0,15;
			//lw   $t4,16($t10)
			//lw   $t5,20($t10)
			//lw   $t6,24($t10)
			//sw   $t0,0($t1)
			//lw   $t3,0($t10)
			mem[300] <= 'h24;
			mem[301] <= 'h00;
			mem[302] <= 'h00;
			mem[303] <= 'h0f;
			
			mem[304] <= 'h49;
			mem[305] <= 'h44;
			mem[306] <= 'h00;
			mem[307] <= 'h10;
			
			mem[308] <= 'h49;
			mem[309] <= 'h45;
			mem[310] <= 'h00;
			mem[311] <= 'h14;
			
			mem[312] <= 'h49;
			mem[313] <= 'h46;
			mem[314] <= 'h00;
			mem[315] <= 'h18;
			
			mem[316] <= 'hac;
			mem[317] <= 'h20;
			mem[318] <= 'h00;
			mem[319] <= 'h00;
			
			mem[320] <= 'h49;
			mem[321] <= 'h43;
			mem[322] <= 'h00;
			mem[323] <= 'h00;
			
			
			
			
		

//**********************************************
//*************ALU-ALU**************************
//ADD r1,r3,r4 
//ADDi r2,r1,0x01
//J 0x02 ___add t3,t1,t2 ,,, and t4,t1,t2
//Slt r4,r5,r6 
//Sltu r5,r6,r7	
//04830820
//24220001
//38A4001E
//04C5202A
//04E6282B

			
			mem[500] <= 'h49;
			mem[501] <= 'h42;
			mem[502] <= 'h00;
			mem[503] <= 'h08;
			
			mem[504] <= 'h49;
			mem[505] <= 'h43;
			mem[506] <= 'h00;
			mem[507] <= 'h0c;
			
			mem[508] <= 'h49;
			mem[509] <= 'h44;
			mem[510] <= 'h00;
			mem[511] <= 'h10;
			
			mem[512] <= 'h49;
			mem[513] <= 'h45;
			mem[514] <= 'h00;
			mem[515] <= 'h14;
			
			mem[516] <= 'h49;
			mem[517] <= 'h46;
			mem[518] <= 'h00;
			mem[519] <= 'h18;
			
			mem[520] <= 'h49;
			mem[521] <= 'h47;
			mem[522] <= 'h00;
			mem[523] <= 'h1c;
			
			mem[524] <= 'h49;
			mem[525] <= 'h48;
			mem[526] <= 'h00;
			mem[527] <= 'h20;
			
			mem[528] <= 'h49;
			mem[529] <= 'h49;
			mem[530] <= 'h00;
			mem[531] <= 'h24;


mem[532]<='h0c;
mem[533]<='h83;
mem[534]<='h08;
mem[535]<='h20;

mem[536]<='h24;
mem[537]<= 'h22;
mem[538]<='h20;
mem[539]<='h01;

mem[540]<='h08;
mem[541]<='h00; 
mem[542]<='h00;
mem[543]<='h02;

mem[544]<='h0c;
mem[545]<='hc5; 
mem[546]<='h20;
mem[547]<='h2a;

mem[548]<='h0c;
mem[549]<='he6; 
mem[550]<='h28;
mem[551]<='h2b;




	
;		  
	

//*********** Branch Equal.*************
//**************************************
//			 addi t1 to 0
//			 beq t1 t0 2
//        addi t0,t0,hex(10)
//        addi t1,t0,hex(01)

			
			



			
			
		


			
			mem[400] <= 'h26;
			mem[401] <= 'h53;
			mem[402] <= 'h00;
			mem[403] <= 'h00;
			
			mem[404] <= 'h16;
			mem[405] <= 'h53;
			mem[406] <= 'h00;
			mem[407] <= 'h01;
		
			
			mem[408] <= 'h24;
			mem[409] <= 'h00;
			mem[410] <= 'h00;
			mem[411] <= 'h10;
			
			
			
			mem[164] <= 'h24;
			mem[165] <= 'h01;
			mem[166] <= 'h00;
			mem[167] <= 'h01;
			
			
		
			


				
	end	 
   assign instruction = {mem[PC],mem[PC+1],mem[PC+2],mem[PC+3]}; 
endmodule
				//lw $t1,4($t10)
				//lw $t2,8($t10)
				//lw $t3,12($t10)
				//lw $t4,16($t10)
				//lw $t5,20($t10)
				//lw $t6,24($t10)
				//lw $t7,28($t10)
				//lw $t8,32($t10)
				//lw $t9,36($t10)
				
			mem[0] <= 'h49;
			mem[1] <= 'h40;
			mem[2] <= 'h00;
			mem[3] <= 'h00;
			
			mem[4] <= 'h49;
			mem[5] <= 'h41;
			mem[6] <= 'h00;
			mem[7] <= 'h04;
			
			mem[8] <= 'h49;
			mem[9] <= 'h42;
			mem[10] <= 'h00;
			mem[11] <= 'h08;
			
			mem[12] <= 'h49;
			mem[13] <= 'h43;
			mem[14] <= 'h00;
			mem[15] <= 'h0c;
			
			mem[16] <= 'h49;
			mem[17] <= 'h44;
			mem[18] <= 'h00;
			mem[19] <= 'h10;
			
			mem[20] <= 'h49;
			mem[21] <= 'h45;
			mem[22] <= 'h00;
			mem[23] <= 'h14;
			
			mem[24] <= 'h49;
			mem[25] <= 'h46;
			mem[26] <= 'h00;
			mem[27] <= 'h18;
			
			mem[28] <= 'h49;
			mem[29] <= 'h47;
			mem[30] <= 'h00;
			mem[31] <= 'h1c;
			
			mem[32] <= 'h49;
			mem[33] <= 'h48;
			mem[34] <= 'h00;
			mem[35] <= 'h20;
			
			mem[36] <= 'h49;
			mem[37] <= 'h49;
			mem[38] <= 'h00;
			mem[39] <= 'h24;
			//an arethmatic operation
			////////////////////////////////////
			//addi t0,t0,#5
			//addi t1,t0,#10
			//add  t3,t1,t2
			//and  t4,t1,t2
			mem[40] <= 'h24;
			mem[41] <= 'h00;
			mem[42] <= 'h00;
			mem[43] <= 'h05;
			
			mem[44] <= 'h24;
			mem[45] <= 'h01;
			mem[46] <= 'h00;
			mem[47] <= 'h0a;
			
			mem[48] <= 'h0c;
			mem[49] <= 'h22;
			mem[50] <= 'h18;
			mem[51] <= 'h20;
			
			mem[52] <= 'h0c;
			mem[53] <= 'h20;
			mem[54] <= 'h20;
			mem[55] <= 'h14;
			
			//arethmatic operation 
			/////////////////////////////////////////////////
			//addi t0,t0,hex(10)
			//addi t1,t0,hex(01)
			//or   t3,t1,t0
			mem[56] <= 'h24;
			mem[57] <= 'h00;
			mem[58] <= 'h00;
			mem[59] <= 'h10;
			
			mem[60] <= 'h24;
			mem[61] <= 'h01;
			mem[62] <= 'h00;
			mem[63] <= 'h01;
			
			mem[64] <= 'h0c;
			mem[65] <= 'h22;
			mem[66] <= 'h18;
			mem[67] <= 'h25;
			
			
			///Store 
			//addi $t0,$t0,15;
			//lw   $t4,16($t10)
			//lw   $t5,20($t10)
			//lw   $t6,24($t10)
			//sw   $t0,0($t1)
			//lw   $t3,0($t10)
			mem[80] <= 'h24;
			mem[81] <= 'h00;
			mem[82] <= 'h00;
			mem[83] <= 'h0f;
			
			mem[84] <= 'h49;
			mem[85] <= 'h44;
			mem[86] <= 'h00;
			mem[87] <= 'h10;
			
			mem[88] <= 'h49;
			mem[89] <= 'h45;
			mem[90] <= 'h00;
			mem[91] <= 'h14;
			
			mem[92] <= 'h49;
			mem[93] <= 'h46;
			mem[94] <= 'h00;
			mem[95] <= 'h18;
			
			mem[96] <= 'hac;
			mem[97] <= 'h20;
			mem[98] <= 'h00;
			mem[99] <= 'h00;
			
			mem[100] <= 'h49;
			mem[101] <= 'h43;
			mem[102] <= 'h00;
			mem[103] <= 'h00;
			
			
			
			
		

//**********************************************
//*************ALU-ALU**************************
//ADD r1,r3,r4 
//ADDi r2,r1,0x01
//J 0x02 ___add t3,t1,t2 ,,, and t4,t1,t2
//Slt r4,r5,r6 
//Sltu r5,r6,r7	
//04830820
//24220001
//38A4001E
//04C5202A
//04E6282B

			
			mem[500] <= 'h49;
			mem[501] <= 'h42;
			mem[502] <= 'h00;
			mem[503] <= 'h08;
			
			mem[504] <= 'h49;
			mem[505] <= 'h43;
			mem[506] <= 'h00;
			mem[507] <= 'h0c;
			
			mem[508] <= 'h49;
			mem[509] <= 'h44;
			mem[510] <= 'h00;
			mem[511] <= 'h10;
			
			mem[512] <= 'h49;
			mem[513] <= 'h45;
			mem[514] <= 'h00;
			mem[515] <= 'h14;
			
			mem[516] <= 'h49;
			mem[517] <= 'h46;
			mem[518] <= 'h00;
			mem[519] <= 'h18;
			
			mem[520] <= 'h49;
			mem[521] <= 'h47;
			mem[522] <= 'h00;
			mem[523] <= 'h1c;
			
			mem[524] <= 'h49;
			mem[525] <= 'h48;
			mem[526] <= 'h00;
			mem[527] <= 'h20;
			
			mem[528] <= 'h49;
			mem[529] <= 'h49;
			mem[530] <= 'h00;
			mem[531] <= 'h24;


mem[532]<='h0c;
mem[533]<='h83;
mem[534]<='h08;
mem[535]<='h20;

mem[536]<='h24;
mem[537]<= 'h22;
mem[538]<='h20;
mem[539]<='h01;

mem[540]<='h08;
mem[541]<='h00; 
mem[542]<='h00;
mem[543]<='h02;

mem[544]<='h0c;
mem[545]<='hc5; 
mem[546]<='h20;
mem[547]<='h2a;

mem[548]<='h0c;
mem[549]<='he6; 
mem[550]<='h28;
mem[551]<='h2b;




	
;		  
	

//*********** Branch Equal.*************
//**************************************
//			 addi t1 to 0
//			 beq t1 t0 2
//        addi t0,t0,hex(10)
//        addi t1,t0,hex(01)

			
			



			
			
		


			
			mem[156] <= 'h26;
			mem[157] <= 'h53;
			mem[158] <= 'h00;
			mem[159] <= 'h00;
			
			mem[160] <= 'h16;
			mem[161] <= 'h53;
			mem[162] <= 'h00;
			mem[163] <= 'h01;
		
			
			mem[168] <= 'h24;
			mem[169] <= 'h00;
			mem[170] <= 'h00;
			mem[171] <= 'h10;
			
			
			
			mem[164] <= 'h24;
			mem[165] <= 'h01;
			mem[166] <= 'h00;
			mem[167] <= 'h01;
			
			
		
			


				
	end	 
   assign instruction = {mem[PC],mem[PC+1],mem[PC+2],mem[PC+3]}; 
endmodule