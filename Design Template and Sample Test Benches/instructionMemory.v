module instructionMemory(instruction, PC);

	integer j;
	input [31:0]PC;
	output [31:0]instruction;
	reg [7:0] mem [16383:0];
	wire [31:0]instruction;
	initial begin
	/*
		for (j = 0; j<4096; j = j + 5)   // 16 K Memory
				begin
					mem[j] <= 8'b0;
					mem[j+1] <= 8'b0;
					mem[j+2] <= 8'b0;
					mem[j+3] <= 8'b0;
					mem[j+4] <= 8'b0;
				end*/		
			// SOME softwares would have a 5000 limit on for loop.
			// You can break this into multiple loops or initialize several locations in parallel
			for (j = 0; j<4000; j = j + 1)   // 16 K Memory
				begin
					mem[j] <= 8'b0;
				end	
			for (j=4000; j<8000; j = j + 1)   // 16 K Memory
				begin
					mem[j] <= 8'b0;
				end		
			for (j=8000; j<12000; j = j + 1)   // 16 K Memory
				begin
					mem[j] <= 8'b0;
				end		
			for (j=12000; j<16384; j = j + 1)   // 16 K Memory
				begin
					mem[j] <= 8'b0;
				end		
	
			// ******************************************************	
			///Test Case 1: Load Operations 
			// ****************************************************** 
			//lw $t0,0($0)
			//lw $t1,4($0)
			//lw $t2,8($0)
			//lw $t3,12($0)
			//lw $t4,16($0)
			//lw $t5,20($0)
			//lw $t6,24($0)
			//lw $t7,28($0)
			
			
			mem[100] <= 8'h48;
			mem[101] <= 8'h08;
			mem[102] <= 8'h00;
			mem[103] <= 8'h00;
			
			mem[104] <= 8'h48;
			mem[105] <= 8'h09;
			mem[106] <= 8'h00;
			mem[107] <= 8'h04;
			
			mem[108] <= 8'h48;
			mem[109] <= 8'h0a;
			mem[110] <= 8'h00;
			mem[111] <= 8'h08;
			
			mem[112] <= 8'h48;
			mem[113] <= 8'h0b;
			mem[114] <= 8'h00;
			mem[115] <= 8'h0c;
			
			mem[116] <= 8'h48;
			mem[117] <= 8'h0c;
			mem[118] <= 8'h00;
			mem[119] <= 8'h10;
			
			mem[120] <= 8'h48;
			mem[121] <= 8'h0d;
			mem[122] <= 8'h00;
			mem[123] <= 8'h14;
			
			mem[124] <= 8'h48;
			mem[125] <= 8'h0e;
			mem[126] <= 8'h00;
			mem[127] <= 8'h18;
			
			mem[128] <= 8'h48;
			mem[129] <= 8'h0f;
			mem[130] <= 8'h00;
			mem[131] <= 8'h1c;
			
			// ******************************************************	
			///Test Case 2: Arithematic operations - No Forwarding
			// ****************************************************** 
			//addi $s1,$0,5
			//addi $s2,$0,10
			//addi $s3,$0,3
			//addi $s4,$0,2			
			//add  $s5,$s1,$s2
			//sub  $s6,$s1,$s3
			mem[200] <= 8'h24;
			mem[201] <= 8'h13;
			mem[202] <= 8'h00;
			mem[203] <= 8'h05;
			
			mem[204] <= 8'h24;
			mem[205] <= 8'h14;
			mem[206] <= 8'h00;
			mem[207] <= 8'h0a;
			
			mem[208] <= 8'h24;
			mem[209] <= 8'h15;
			mem[210] <= 8'h00;
			mem[211] <= 8'h03;
			
			mem[212] <= 8'h24;
			mem[213] <= 8'h16;
			mem[214] <= 8'h00;
			mem[215] <= 8'h02;
			
			mem[216] <= 8'h0e;
			mem[217] <= 8'h74;
			mem[218] <= 8'hb8;
			mem[219] <= 8'h20;
			
			mem[220] <= 8'h0e;
			mem[221] <= 8'h75;
			mem[222] <= 8'hc0;
			mem[223] <= 8'h24;			

			// ******************************************************	
			///Test Case 3: Logical Operations - No Forwarding
			// ****************************************************** 
			//addi $s1,$0,15
			//addi $s2,$0,10
			//addi $s3,$0,3
			//addi $s4,$0,2			
			//and  $s5,$s1,$s2
			//or   $s6,$s2,$s3
			mem[300] <= 8'h24;
			mem[301] <= 8'h13;
			mem[302] <= 8'h00;
			mem[303] <= 8'h0f;
			
			mem[304] <= 8'h24;
			mem[305] <= 8'h14;
			mem[306] <= 8'h00;
			mem[307] <= 8'h0a;
			
			mem[308] <= 8'h24;
			mem[309] <= 8'h15;
			mem[310] <= 8'h00;
			mem[311] <= 8'h03;
			
			mem[312] <= 8'h24;
			mem[313] <= 8'h16;
			mem[314] <= 8'h00;
			mem[315] <= 8'h02;
			
			mem[316] <= 8'h0e;
			mem[317] <= 8'h74;
			mem[318] <= 8'hb8;
			mem[319] <= 8'h14;
			
			mem[320] <= 8'h0e;
			mem[321] <= 8'h95;
			mem[322] <= 8'hc0;
			mem[323] <= 8'h25;

			// ******************************************************	
			///Test Case 4: Store Operation
			// ****************************************************** 
			//addi $s1,$0,15
			//addi $s2,$0,10
			//addi $s3,$0,3
			//sw   $s1,100($0)			
			//addi $s1,$0,0
			//addi $s2,$0,10			
			//lw   $s3,100($0)						

			mem[400] <= 8'h24;
			mem[401] <= 8'h13;
			mem[402] <= 8'h00;
			mem[403] <= 8'h0f;
			
			mem[404] <= 8'h24;
			mem[405] <= 8'h14;
			mem[406] <= 8'h00;
			mem[407] <= 8'h0a;
			
			mem[408] <= 8'h24;
			mem[409] <= 8'h15;
			mem[410] <= 8'h00;
			mem[411] <= 8'h03;
			
			mem[412] <= 8'hac;
			mem[413] <= 8'h13;
			mem[414] <= 8'h00;
			mem[415] <= 8'h64;
			
			mem[416] <= 8'h24;
			mem[417] <= 8'h13;
			mem[418] <= 8'h00;
			mem[419] <= 8'h00;
			
			mem[420] <= 8'h24;
			mem[421] <= 8'h14;
			mem[422] <= 8'h00;
			mem[423] <= 8'h0a;
			
			mem[424] <= 8'h48;
			mem[425] <= 8'h15;
			mem[426] <= 8'h00;
			mem[427] <= 8'h64;			
			
			// ******************************************************	
			///Test Case 5: Branch Equal - Not Taken
			// ****************************************************** 
			//addi $s1,$0,15
			//addi $s2,$0,10
			//addi $s3,$0,3
			//addi $s4,$0,2			
			//beq  $s1,$s2,-5
			//addi $s1,$0,30
			//addi $s2,$0,20
			//addi $s3,$0,6
			//addi $s3,$0,6
			//addi $s3,$0,6						
		
			mem[500] <= 8'h24;
			mem[501] <= 8'h13;
			mem[502] <= 8'h00;
			mem[503] <= 8'h0f;
			
			mem[504] <= 8'h24;
			mem[505] <= 8'h14;
			mem[506] <= 8'h00;
			mem[507] <= 8'h0a;
					
			mem[508] <= 8'h24;
			mem[509] <= 8'h15;
			mem[510] <= 8'h00;
			mem[511] <= 8'h03;
					
			mem[512] <= 8'h24;
			mem[513] <= 8'h16;
			mem[514] <= 8'h00;
			mem[515] <= 8'h02;
			
			// BEQ8
			mem[516] <= 8'h16;
			mem[517] <= 8'h74;
			mem[518] <= 8'hff;
			mem[519] <= 8'hfb;
			
			mem[520] <= 8'h24;
			mem[521] <= 8'h13;
			mem[522] <= 8'h00;
			mem[523] <= 8'h1e;
					
			mem[524] <= 8'h24;
			mem[525] <= 8'h14;
			mem[526] <= 8'h00;
			mem[527] <= 8'h14;
					
			mem[528] <= 8'h24;
			mem[529] <= 8'h15;
			mem[530] <= 8'h00;
			mem[531] <= 8'h06;			
			
			mem[532] <= 8'h24;
			mem[533] <= 8'h15;
			mem[534] <= 8'h00;
			mem[535] <= 8'h06;
					
			mem[536] <= 8'h24;
			mem[537] <= 8'h15;
			mem[538] <= 8'h00;
			mem[539] <= 8'h06;	
		

			// ******************************************************	
			///Test Case 6: ALU-ALU FWD 
			// ****************************************************** 
			//addi $s1,$0,15
			//addi $s2,$0,10
			//addi $s3,$0,3
			//add  $s4,$s1,$s2			
			//add  $s5,$s4,$s3
			
			mem[600] <= 8'h24;
			mem[601] <= 8'h13;
			mem[602] <= 8'h00;
			mem[603] <= 8'h0f;
			
			mem[604] <= 8'h24;
			mem[605] <= 8'h14;
			mem[606] <= 8'h00;
			mem[607] <= 8'h0a;
			
			mem[608] <= 8'h24;
			mem[609] <= 8'h15;
			mem[610] <= 8'h00;
			mem[611] <= 8'h03;
			
			mem[612] <= 8'h0e;
			mem[613] <= 8'h74;
			mem[614] <= 8'hb0;
			mem[615] <= 8'h20;
			
			mem[616] <= 8'h0e;
			mem[617] <= 8'hd5;
			mem[618] <= 8'hb8;
			mem[619] <= 8'h20;
			
						
	end	 
   assign instruction = {mem[PC],mem[PC+1],mem[PC+2],mem[PC+3]}; 
endmodule
