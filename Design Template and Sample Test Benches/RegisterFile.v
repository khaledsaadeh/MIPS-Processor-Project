//declares a 32x32 register file.
//MIPS USES BUG ENDIAN ARCHETICTURE SO REGISTERS VALUES OF THE MOST SIGNIFICANT WORDS ARE SAVED IN THE SMALLER REGISTER INDEX.
module registerFile( output reg [31:0]Rs_data_ID,
							output reg [31:0]Rs_MSG,
							output reg [31:0]Rt_data_ID,
							output reg [31:0]Rt_MSG,
							output reg [31:0]HI,
							output reg [31:0]LO,
							input Clk,
							input [4:0]Rs_ID,
							input [4:0]Rt_ID,
							input [4:0]RegWr_ID,
							input [31:0]Write_data,
							input [63:0]Write_data64,
							input Load_Byte_control,
							input Store_Byte_control,
							input RegWrite,
							input float_control,
							input MulDiv_control);												
		
reg [31:0] registers_i[31:0];
	
reg [31:0] registers_f[31:0];

reg [31:0] hi;
reg [31:0] lo;

initial begin
	hi=32'h0;
	lo=32'h0;
	
	registers_i[0] =32'h0;	//00000	zero
	registers_i[1] =32'h0;	//00001	at
	registers_i[2] =32'h0;	//00010	v0
	registers_i[3] =32'h0;	//00011	v1
	registers_i[4] =32'h0;	//00100	a0
	registers_i[5] =32'h0;	//00101	a1
	registers_i[6] =32'h0;	//00110	a2
	registers_i[7] =32'h0;	//00111	a3
	registers_i[8] =32'h0;	//01000	t0
	registers_i[9] =32'h0;	//01001	t1
	registers_i[10]=32'h0;	//01010	t2
	registers_i[11]=32'h0;	//01011	t3
	registers_i[12]=32'h0;	//01100	t4
	registers_i[13]=32'h0;	//01101	t5
	registers_i[14]=32'h0;	//01110	t6
	registers_i[15]=32'h0;	//01111	t7
	registers_i[16]=32'h0;	//10000	t8
	registers_i[17]=32'h0;	//10001	t9
	registers_i[18]=32'h0;	//10010	s0
	registers_i[19]=32'h0;	//10011	s1
	registers_i[20]=32'h0;	//10100	s2
	registers_i[21]=32'h0;	//10101	s3
	registers_i[22]=32'h0;	//10110	s4
	registers_i[23]=32'h0;	//10111	s5
	registers_i[24]=32'h0;	//11000	s6
	registers_i[25]=32'h0;	//11001	s7
	registers_i[26]=32'h0;	//11010	k0
	registers_i[27]=32'h0;	//11011	k1
	registers_i[28]=32'h0;	//11100	gp
	registers_i[29]=32'h0;	//11101	sp
	registers_i[30]=32'h0;	//11110	fp
	registers_i[31]=32'h0;	//11111	ra
	
	registers_f[0] =32'h0;	//00000	
	registers_f[1] =32'h0;	//00001	
	registers_f[2] =32'h0;	//00010	
	registers_f[3] =32'h0;	//00011	
	registers_f[4] =32'h0;	//00100	
	registers_f[5] =32'h0;	//00101	
	registers_f[6] =32'h0;	//00110	
	registers_f[7] =32'h0;	//00111	
	registers_f[8] =32'h0;	//01000	
	registers_f[9] =32'h0;	//01001	
	registers_f[10]=32'h0;	//01010	
	registers_f[11]=32'h0;	//01011	
	registers_f[12]=32'h0;	//01100	
	registers_f[13]=32'h0;	//01101	
	registers_f[14]=32'h0;	//01110	
	registers_f[15]=32'h0;	//01111	
	registers_f[16]=32'h0;	//10000	
	registers_f[17]=32'h0;	//10001	
	registers_f[18]=32'h0;	//10010	
	registers_f[19]=32'h0;	//10011	
	registers_f[20]=32'h0;	//10100	
	registers_f[21]=32'h0;	//10101	
	registers_f[22]=32'h0;	//10110	
	registers_f[23]=32'h0;	//10111	
	registers_f[24]=32'h0;	//11000	
	registers_f[25]=32'h0;	//11001	
	registers_f[26]=32'h0;	//11010	
	registers_f[27]=32'h0;	//11011	
	registers_f[28]=32'h0;	//11100	
	registers_f[29]=32'h0;	//11101	
	registers_f[30]=32'h0;	//11110	
	registers_f[31]=32'h0;	//11111	
	end

if(float_control==1)begin	//use float registers 
always@(negedge Clk)begin //read on negative edge
			HI=hi;
			LO=lo;
		case(Rs_ID)
			5'b00000: Rs_MSG = registers_f[0] ;
						 Rs_data_ID=registers_f[1];
			5'b00001: ;//can't read odd numbered registers as every pair create a double.
			5'b00010: Rs_MSG= registers_f[2] ;
						 Rs_data_ID= registers_f[3];
			5'b00011: ;
			5'b00100: Rs_MSG = registers_f[4] ;
						 Rs_data_ID=registers_f[5];
			5'b00101: ;
			5'b00110: Rs_MSG = registers_f[6] ;
						 Rs_data_ID=registers_f[7];
			5'b00111: ;
			5'b01000: Rs_MSG= registers_f[8] ;
						 Rs_data_ID=registers_f[9];
			5'b01001: ;
			5'b01010: Rs_MSG = registers_f[10];
						 Rs_data_ID=registers_f[11];
			5'b01011: ;
			5'b01100: Rs_MSG = registers_f[12];
						 Rs_data_ID=registers_f[13];
			5'b01101: ;
			5'b01110: Rs_MSG = registers_f[14];
						 Rs_data_ID=registers_f[15];
			5'b01111: ;
			5'b10000: Rs_MSG = registers_f[16];
						 Rs_data_ID=registers_f[17];
			5'b10001: ;
			5'b10010: Rs_MSG = registers_f[18];
						 Rs_data_ID=registers_f[19];
			5'b10011: ;
			5'b10100: Rs_MSG = registers_f[20];
						 Rs_data_ID=registers_f[21];
			5'b10101: ;
			5'b10110: Rs_MSG = registers_f[22];
						 Rs_data_ID=registers_f[23];
			5'b10111: ;
			5'b11000: Rs_MSG = registers_f[24];
						 Rs_data_ID = registers_f[25];
			5'b11001: ;
			5'b11010: Rs_MSG = registers_f[26];
						 Rs_data_ID = registers_f[27];
			5'b11011: ;
			5'b11100: Rs_MSG = registers_f[28];
						 Rs_data_ID = registers_f[29];
			5'b11101: ;
			5'b11110: Rs_MSG = registers_f[30];
						 Rs_data_ID =registers_f[31];
			5'b11111: ;
			endcase
		case(Rt_ID)
			5'b00000: Rt_MSG = registers_f[0] ;
						 Rt_data_ID=registers_f[1];
			5'b00001: ;//can't read odd numbered registers as every pair create a double.
			5'b00010: Rt_MSG = registers_f[2] ;
						 Rt_data_ID=registers_f[3];
			5'b00011: ;
			5'b00100: Rt_MSG= registers_f[4] ;
						 Rt_data_ID =registers_f[5];
			5'b00101: ;
			5'b00110: Rt_MSG = registers_f[6] ;
						 Rt_data_ID=registers_f[7];
			5'b00111: ;
			5'b01000: Rt_MSG = registers_f[8] ;
						 Rt_data_ID=registers_f[9];
			5'b01001: ;
			5'b01010: Rt_MSG = registers_f[10];
						 Rt_data_ID=registers_f[11];
			5'b01011: ;
			5'b01100: Rt_MSG = registers_f[12];
						 Rt_data_ID=registers_f[13];
			5'b01101: ;
			5'b01110: Rt_MSG = registers_f[14];
						 Rt_data_ID=registers_f[15];
			5'b01111: ;
			5'b10000: Rt_MSG = registers_f[16];
						 Rt_data_ID=registers_f[17];
			5'b10001: ;
			5'b10010: Rt_MSG = registers_f[18];
						 Rt_data_ID=registers_f[19];
			5'b10011: ;
			5'b10100: Rt_MSG = registers_f[20];
						 Rt_data_ID=registers_f[21];
			5'b10101: ;
			5'b10110: Rt_MSG = registers_f[22];
						 Rt_data_ID=registers_f[23];
			5'b10111: ;
			5'b11000: Rt_MSG = registers_f[24];
						 Rt_data_ID=registers_f[25];
			5'b11001: ;
			5'b11010: Rt_MSG = registers_f[26];
						 Rt_data_ID=registers_f[27];
			5'b11011: ;
			5'b11100: Rt_MSG = registers_f[28];
						 Rt_data_ID =registers_f[29];
			5'b11101: ;
			5'b11110: Rt_MSG = registers_f[30];
						 Rt_data_ID=registers_f[31];
			5'b11111: ; 
		endcase
end
	always@(posedge Clk)begin //write on positive edge		
		if(RegWrite)begin
			if(MulDiv_control)begin
				HI=Write_data64[63:32];
				LO=Write_data64[31:0];
			end
			else if(!MulDiv_control) begin
				case(RegWr_ID)
					5'b00000: registers_f[0] =Write_data64[63:32];//
								registers_f[1] =Write_data64[31:0];//
					5'b00001: ;//error can't write on odd numbered registers 
					5'b00010: registers_f[2] =Write_data64[63:32];//
								registers_f[3] =Write_data64[31:0];//
					5'b00011: ;																	
					5'b00100: registers_f[4] =Write_data64[63:32];//
								registers_f[5] =Write_data64[31:0];//
					5'b00101: ;													
					5'b00110: registers_f[6] =Write_data64[63:32];//
								registers_f[7] =Write_data64[31:0];//
					5'b00111: ;													
					5'b01000: registers_f[8] =Write_data64[63:32];//
								registers_f[9] =Write_data64[31:0];//
					5'b01001: ;													
					5'b01010: registers_f[10] =Write_data64[63:32];//
								registers_f[11] =Write_data64[31:0];//
					5'b01011: ;													
					5'b01100: registers_f[12] =Write_data64[63:32];//
								registers_f[13] =Write_data64[31:0];//
					5'b01101: ;													
					5'b01110: registers_f[14] =Write_data64[63:32];//
								registers_f[15] =Write_data64[31:0];//
					5'b01111: ;													
					5'b10000: registers_f[16] =Write_data64[63:32];//
								registers_f[17] =Write_data64[31:0];//
					5'b10001: ;													
					5'b10010: registers_f[18] =Write_data64[63:32];//
								registers_f[19] =Write_data64[31:0];//
					5'b10011: ;													
					5'b10100:registers_f[20] =Write_data64[63:32];//
								registers_f[21] =Write_data64[31:0];//
					5'b10101:;													
					5'b10110: registers_f[22] =Write_data64[63:32];//
								registers_f[23] =Write_data64[31:0];//
					5'b10111: ;													
					5'b11000: registers_f[24] =Write_data64[63:32];//
								registers_f[25] =Write_data64[31:0];//
					5'b11001: ;													
					5'b11010: registers_f[26] =Write_data64[63:32];//
								registers_f[27] =Write_data64[31:0];//
					5'b11011: ;													
					5'b11100: registers_f[28] =Write_data64[63:32];//
								registers_f[29] =Write_data64[31:0];//
					5'b11101: ;													
					5'b11110: registers_f[30] =Write_data64[63:32];//
								registers_f[31] =Write_data64[31:0];//
					5'b11111: ;													
				endcase end      
		end
end	
end
else //NORMAL CORE INSTRUCTIONS
	begin
	always@(negedge Clk)begin //read on negative edge
		case(Rs_ID)
			5'b00000: Rs_data_ID = registers_i[0] ;//	zero
			5'b00001: Rs_data_ID = registers_i[1] ;//	at
			5'b00010: Rs_data_ID = registers_i[2] ;//	v0
			5'b00011: Rs_data_ID = registers_i[3] ;//	v1
			5'b00100: Rs_data_ID = registers_i[4] ;//	a0
			5'b00101: Rs_data_ID = registers_i[5] ;//	a1
			5'b00110: Rs_data_ID = registers_i[6] ;//	a2
			5'b00111: Rs_data_ID = registers_i[7] ;//	a3
			5'b01000: Rs_data_ID = registers_i[8] ;//	t0
			5'b01001: Rs_data_ID = registers_i[9] ;//	t1
			5'b01010: Rs_data_ID = registers_i[10];//	t2
			5'b01011: Rs_data_ID = registers_i[11];//	t3
			5'b01100: Rs_data_ID = registers_i[12];//	t4
			5'b01101: Rs_data_ID = registers_i[13];//	t5
			5'b01110: Rs_data_ID = registers_i[14];//	t6
			5'b01111: Rs_data_ID = registers_i[15];//	t7
			5'b10000: Rs_data_ID = registers_i[16];//	t8
			5'b10001: Rs_data_ID = registers_i[17];//	t9
			5'b10010: Rs_data_ID = registers_i[18];//	s0
			5'b10011: Rs_data_ID = registers_i[19];//	s1
			5'b10100: Rs_data_ID = registers_i[20];//	s2
			5'b10101: Rs_data_ID = registers_i[21];//	s3
			5'b10110: Rs_data_ID = registers_i[22];//	s4
			5'b10111: Rs_data_ID = registers_i[23];//	s5
			5'b11000: Rs_data_ID = registers_i[24];//	s6
			5'b11001: Rs_data_ID = registers_i[25];//	s7
			5'b11010: Rs_data_ID = registers_i[26];//	k0
			5'b11011: Rs_data_ID = registers_i[27];//	k1
			5'b11100: Rs_data_ID = registers_i[28];//	gp
			5'b11101: Rs_data_ID = registers_i[29];//	sp
			5'b11110: Rs_data_ID = registers_i[30];//	fp
			5'b11111: Rs_data_ID = registers_i[31];//	ra
		endcase

		if(Store_Byte_control)begin
			case(Rt_ID)
				5'b00000: Rt_data_ID = 32'h0;
				5'b00001: Rt_data_ID = {24'b0,registers_i[1] [7:0]};
				5'b00010: Rt_data_ID = {24'b0,registers_i[2] [7:0]};
				5'b00011: Rt_data_ID = {24'b0,registers_i[3] [7:0]};
				5'b00100: Rt_data_ID = {24'b0,registers_i[4] [7:0]};
				5'b00101: Rt_data_ID = {24'b0,registers_i[5] [7:0]};
				5'b00110: Rt_data_ID = {24'b0,registers_i[6] [7:0]};
				5'b00111: Rt_data_ID = {24'b0,registers_i[7] [7:0]};
				5'b01000: Rt_data_ID = {24'b0,registers_i[8] [7:0]};
				5'b01001: Rt_data_ID = {24'b0,registers_i[9] [7:0]};
				5'b01010: Rt_data_ID = {24'b0,registers_i[10][7:0]};
				5'b01011: Rt_data_ID = {24'b0,registers_i[11][7:0]};
				5'b01100: Rt_data_ID = {24'b0,registers_i[12][7:0]};
				5'b01101: Rt_data_ID = {24'b0,registers_i[13][7:0]};
				5'b01110: Rt_data_ID = {24'b0,registers_i[14][7:0]};
				5'b01111: Rt_data_ID = {24'b0,registers_i[15][7:0]};
				5'b10000: Rt_data_ID = {24'b0,registers_i[16][7:0]};
				5'b10001: Rt_data_ID = {24'b0,registers_i[17][7:0]};
				5'b10010: Rt_data_ID = {24'b0,registers_i[18][7:0]};
				5'b10011: Rt_data_ID = {24'b0,registers_i[19][7:0]};
				5'b10100: Rt_data_ID = {24'b0,registers_i[20][7:0]};
				5'b10101: Rt_data_ID = {24'b0,registers_i[21][7:0]};
				5'b10110: Rt_data_ID = {24'b0,registers_i[22][7:0]};
				5'b10111: Rt_data_ID = {24'b0,registers_i[23][7:0]};
				5'b11000: Rt_data_ID = {24'b0,registers_i[24][7:0]};
				5'b11001: Rt_data_ID = {24'b0,registers_i[25][7:0]};
				5'b11010: Rt_data_ID = {24'b0,registers_i[26][7:0]};
				5'b11011: Rt_data_ID = {24'b0,registers_i[27][7:0]};
				5'b11100: Rt_data_ID = {24'b0,registers_i[28][7:0]};
				5'b11101: Rt_data_ID = {24'b0,registers_i[29][7:0]};
				5'b11110: Rt_data_ID = {24'b0,registers_i[30][7:0]};
				5'b11111: Rt_data_ID = {24'b0,registers_i[31][7:0]};
		endcase
	end else if(!Store_Byte_control)begin		
			case(Rt_ID)
				5'b00000: Rt_data_ID=registers_i[0] ;//	ze
				5'b00001: Rt_data_ID=registers_i[1] ;//	at
				5'b00010: Rt_data_ID=registers_i[2] ;//	v0
				5'b00011: Rt_data_ID=registers_i[3] ;//	v1
				5'b00100: Rt_data_ID=registers_i[4] ;//	a0
				5'b00101: Rt_data_ID=registers_i[5] ;//	a1
				5'b00110: Rt_data_ID=registers_i[6] ;//	a2
				5'b00111: Rt_data_ID=registers_i[7] ;//	a3
				5'b01000: Rt_data_ID=registers_i[8] ;//	t0
				5'b01001: Rt_data_ID=registers_i[9] ;//	t1
				5'b01010: Rt_data_ID=registers_i[10];//	t2
				5'b01011: Rt_data_ID=registers_i[11];//	t3
				5'b01100: Rt_data_ID=registers_i[12];//	t4
				5'b01101: Rt_data_ID=registers_i[13];//	t5
				5'b01110: Rt_data_ID=registers_i[14];//	t6
				5'b01111: Rt_data_ID=registers_i[15];//	t7
				5'b10000: Rt_data_ID=registers_i[16];//	t8
				5'b10001: Rt_data_ID=registers_i[17];//	t9
				5'b10010: Rt_data_ID=registers_i[18];//	s0
				5'b10011: Rt_data_ID=registers_i[19];//	s1
				5'b10100: Rt_data_ID=registers_i[20];//	s2
				5'b10101: Rt_data_ID=registers_i[21];//	s3
				5'b10110: Rt_data_ID=registers_i[22];//	s4
				5'b10111: Rt_data_ID=registers_i[23];//	s5
				5'b11000: Rt_data_ID=registers_i[24];//	s6
				5'b11001: Rt_data_ID=registers_i[25];//	s7
				5'b11010: Rt_data_ID=registers_i[26];//	k0
				5'b11011: Rt_data_ID=registers_i[27];//	k1
				5'b11100: Rt_data_ID=registers_i[28];//	gp
				5'b11101: Rt_data_ID=registers_i[29];//	sp
				5'b11110: Rt_data_ID=registers_i[30];//	fp
				5'b11111: Rt_data_ID=registers_i[31];//	ra
		endcase end
end
	always@(posedge Clk)begin //write on positive edge		
		if(RegWrite)begin
			if(Load_Byte_control)begin
				case(RegWr_ID)
					5'b00000: ;//error											
					5'b00001: registers_i[1] ={24'b0, Write_data[7:0]};//	at
					5'b00010: registers_i[2] ={24'b0, Write_data[7:0]};//	v0
					5'b00011: registers_i[3] ={24'b0, Write_data[7:0]};//	v1
					5'b00100: registers_i[4] ={24'b0, Write_data[7:0]};//	a0
					5'b00101: registers_i[5] ={24'b0, Write_data[7:0]};//	a1
					5'b00110: registers_i[6] ={24'b0, Write_data[7:0]};//	a2
					5'b00111: registers_i[7] ={24'b0, Write_data[7:0]};//	a3
					5'b01000: registers_i[8] ={24'b0, Write_data[7:0]};//	t0
					5'b01001: registers_i[9] ={24'b0, Write_data[7:0]};//	t1
					5'b01010: registers_i[10]={24'b0, Write_data[7:0]};//	t2
					5'b01011: registers_i[11]={24'b0, Write_data[7:0]};//	t3
					5'b01100: registers_i[12]={24'b0, Write_data[7:0]};//	t4
					5'b01101: registers_i[13]={24'b0, Write_data[7:0]};//	t5
					5'b01110: registers_i[14]={24'b0, Write_data[7:0]};//	t6
					5'b01111: registers_i[15]={24'b0, Write_data[7:0]};//	t7
					5'b10000: registers_i[16]={24'b0, Write_data[7:0]};//	t8
					5'b10001: registers_i[17]={24'b0, Write_data[7:0]};//	t9
					5'b10010: registers_i[18]={24'b0, Write_data[7:0]};//	s0
					5'b10011: registers_i[19]={24'b0, Write_data[7:0]};//	s1
					5'b10100: registers_i[20]={24'b0, Write_data[7:0]};//	s2
					5'b10101: registers_i[21]={24'b0, Write_data[7:0]};//	s3
					5'b10110: registers_i[22]={24'b0, Write_data[7:0]};//	s4
					5'b10111: registers_i[23]={24'b0, Write_data[7:0]};//	s5
					5'b11000: registers_i[24]={24'b0, Write_data[7:0]};//	s6
					5'b11001: registers_i[25]={24'b0, Write_data[7:0]};//	s7
					5'b11010: registers_i[26]={24'b0, Write_data[7:0]};//	k0	<-Reserved for OS Kernel
					5'b11011: registers_i[27]={24'b0, Write_data[7:0]};//	k1 <-Reserved for OS Kernel
					5'b11100: registers_i[28]={24'b0, Write_data[7:0]};//	gp
					5'b11101: registers_i[29]={24'b0, Write_data[7:0]};//	sp
					5'b11110: registers_i[30]={24'b0, Write_data[7:0]};//	fp
					5'b11111: registers_i[31]={24'b0, Write_data[7:0]};//	ra
				endcase
			end 
		else case(RegWr_ID)
				5'b00000: ;//error
				5'b00001: registers_i[1] =Write_data;//	at
				5'b00010: registers_i[2] =Write_data;//	v0
				5'b00011: registers_i[3] =Write_data;//	v1
				5'b00100: registers_i[4] =Write_data;//	a0
				5'b00101: registers_i[5] =Write_data;//	a1
				5'b00110: registers_i[6] =Write_data;//	a2
				5'b00111: registers_i[7] =Write_data;//	a3
				5'b01000: registers_i[8] =Write_data;//	t0
				5'b01001: registers_i[9] =Write_data;//	t1
				5'b01010: registers_i[10]=Write_data;//	t2
				5'b01011: registers_i[11]=Write_data;//	t3
				5'b01100: registers_i[12]=Write_data;//	t4
				5'b01101: registers_i[13]=Write_data;//	t5
				5'b01110: registers_i[14]=Write_data;//	t6
				5'b01111: registers_i[15]=Write_data;//	t7
				5'b10000: registers_i[16]=Write_data;//	t8
				5'b10001: registers_i[17]=Write_data;//	t9
				5'b10010: registers_i[18]=Write_data;//	s0
				5'b10011: registers_i[19]=Write_data;//	s1
				5'b10100: registers_i[20]=Write_data;//	s2
				5'b10101: registers_i[21]=Write_data;//	s3
				5'b10110: registers_i[22]=Write_data;//	s4
				5'b10111: registers_i[23]=Write_data;//	s5
				5'b11000: registers_i[24]=Write_data;//	s6
				5'b11001: registers_i[25]=Write_data;//	s7
				5'b11010: registers_i[26]=Write_data;//	k0<-Reserved for OS Kernel
				5'b11011: registers_i[27]=Write_data;//	k1<-Reserved for OS Kernel
				5'b11100: registers_i[28]=Write_data;//	gp
				5'b11101: registers_i[29]=Write_data;//	sp
				5'b11110: registers_i[30]=Write_data;//	fp
				5'b11111: registers_i[31]=Write_data;//	ra
			endcase      
		end
end
end	
endmodule
/*---------------------------------------------------------------------------------------*/
module testbench_RegisterFile();
		wire [31:0]Rs_data_ID;
		wire [31:0]Rt_data_ID;
		reg [4:0]Rs_ID;
		reg [4:0]Rt_ID;
		reg [4:0]RegWr_ID;
		reg [31:0]Write_data;
		reg Load_Byte_control;
		reg Store_Byte_control;
		reg RegWrite;
		

		reg clk;

registerFile my_RegisterFile(Rs_data_ID,Rt_data_ID,clk ,Rs_ID,Rt_ID,RegWr_ID,Write_data,Load_Byte_control,Store_Byte_control,RegWrite);

initial begin
	clk <= 0;
	#1 
	clk <= ~clk;		
	#1
	//case1: I want to write to $t0 the value 32'h A12
	clk <= ~clk;
	RegWr_ID=5'h8;
	Write_data=32'h0A12;
	Load_Byte_control=0;
	Store_Byte_control=0;
	RegWrite=1;
	#1
	clk <= ~clk;
	#1
	$display("t0 is %b",my_RegisterFile.registers_i[8]);
	clk <= ~clk;
	#1
	//case2: I want to write to $s1 the value 32'h 0FF
	RegWr_ID=5'h13;
	Write_data=32'h0FF;
	Load_Byte_control=0;
	Store_Byte_control=0;
	RegWrite=1;
	#1
	clk <= ~clk;
	#1
	$display("s1 is %b",my_RegisterFile.registers_i[19]); //19 is 13 in decimal
	clk <= ~clk;
	#1
	//case3: I want to read from $t0
	Rt_ID=5'h8;
	Load_Byte_control=0;
	Store_Byte_control=0;
	RegWrite=0;
	#1
	clk <= ~clk;
	#1
	$display("saved t0 is %b",my_RegisterFile.registers_i[8]);
	
	//case4: I want to read from $s1
	Rs_ID=5'h13;
	Load_Byte_control=0;
	Store_Byte_control=0;
	RegWrite=0;
	#1
	clk <= ~clk;
	#1
	$display("saved s1 is %b",my_RegisterFile.registers_i[19]);
	
	//case5: I want to load byte to $t0 e.eg 8'h0F
	Write_data=32'h0FFFFF;
	RegWr_ID=5'h8;
	Load_Byte_control=1;
	Store_Byte_control=0;
	RegWrite=1;
	#1
	clk <= ~clk;
	#1
	$display("byte that will be loaded from memory is %b",my_RegisterFile.registers_i[8]);
	
	//case6: I want to store byte from $s1
	Rt_ID=5'h13;
	Load_Byte_control=0;
	Store_Byte_control=1;
	RegWrite=0;
	#1
	clk <= ~clk;
	#1
	#5
	$display("byte that will be stored in memory is %b",Rt_data_ID);
	
	clk <= ~clk;
	
	
end
endmodule
		













