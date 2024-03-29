module ALU ( 
output reg [31:0]OUT_ALU32,
output reg [63:0]OUT_ALU64,
output reg ZF_ALU,
input [31:0]IN_ALU_MSG1,
input [31:0]IN_ALU_1,
input [31:0]IN_ALU_2,
input [31:0]IN_ALU_MSG2,
input [11:0]ALU_control
);

reg [7:0]whos_bigger;
//reg opcode;
//reg funct;
initial begin
	
	OUT_ALU32=32'h0;
	OUT_ALU64=64'h0;
	ZF_ALU=0;
end

always @(*) begin
//opcode = ALU_control[11:6];
//funct = ALU_control[5:0];

if(ALU_control ==  12'b000011100000)begin // ADD
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end


if (ALU_control[11:6] == 6'h9 ) begin  //ADD IMMEDIATE
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end

if (ALU_control == 12'b000011010100) begin //AND
OUT_ALU32 = IN_ALU_1 & IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end

if (ALU_control[11:6] == 6'hc) begin //AND IMMEDIATE 
OUT_ALU32 = IN_ALU_1 & IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end

if (ALU_control[11:6] == 6'h5) begin  // BRANCH EQUAL
if (IN_ALU_1 == IN_ALU_2)
ZF_ALU =1;
else ZF_ALU =0;
end

if (ALU_control[11:6] == 6'h4) begin  // BRANCH NOT EQUAL
if (IN_ALU_1 != IN_ALU_2)
ZF_ALU =1;
else ZF_ALU = 0;
end

if (ALU_control[11:6] == 6'h22 )begin //LOAD BYTE UNSIGNED
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
OUT_ALU64 = 0;
if (OUT_ALU32 == 0)
ZF_ALU=1;else ZF_ALU=0;
end

if (ALU_control[11:6] == 6'hf)begin //LOAD UPPER IMMEDIATE
OUT_ALU32 = {IN_ALU_2, 16'b0};
OUT_ALU64 = 0;
if (OUT_ALU32 == 0)
ZF_ALU=1;else ZF_ALU=0;
end

if (ALU_control[11:6] == 6'h12 )begin //LOAD WORD
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
OUT_ALU64 = 0;
if (OUT_ALU32 == 0)
ZF_ALU=1;else ZF_ALU=0;
end

if (ALU_control == 12'b000011100001)begin //LOAD WORD NEW
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
OUT_ALU64 = 0;
if (OUT_ALU32 == 0)
ZF_ALU=1;
else ZF_ALU=0;
end

if (ALU_control == 12'b000011100111)begin //NOR
OUT_ALU32 = ~(IN_ALU_1 | IN_ALU_2);
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end

if (ALU_control == 12'b000011100101)begin //OR
OUT_ALU32 = IN_ALU_1 | IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end

if (ALU_control[11:6]==6'he)begin //OR IMMEDIATE	
OUT_ALU32 = IN_ALU_1 | IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end

if (ALU_control == 12'b000011101010)begin  //SET LESS THAN
if (IN_ALU_1 < IN_ALU_2)
OUT_ALU32 = 1;
else OUT_ALU32 = 0;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end

if (ALU_control == 12'b000011101011)begin  //SET LESS THAN UNSIGNED
if (IN_ALU_1 < IN_ALU_2)
OUT_ALU32 = 1;
else OUT_ALU32 = 0;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end

if (ALU_control == 12'b000011000000)begin  // shift left logical
OUT_ALU32 = IN_ALU_1 << IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end

if (ALU_control == 12'b000011000010)begin //shift right logiacal
OUT_ALU32 = IN_ALU_1 >> IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end

if (ALU_control[11:6] == 6'h28) begin //STORE BYTE
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
OUT_ALU64 = 0;
if (OUT_ALU32 == 0)
ZF_ALU=1;else ZF_ALU=0;
end

if (ALU_control[11:6] == 6'h2b)begin //STORE WORD
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
OUT_ALU64 = 0;
if (OUT_ALU32 == 0)
ZF_ALU=1;else ZF_ALU=0;
end

if (ALU_control == 12'b000011010011)begin //STORE WORD NEW
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
OUT_ALU64 = 0;
if (OUT_ALU32 == 0)
ZF_ALU=1;else ZF_ALU=0;
end

if (ALU_control == 12'b000011100100)begin //SUBTRACT
OUT_ALU32 = IN_ALU_2 - IN_ALU_1;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end





// FLOATING :
if (ALU_control == 12'b000011011010)begin //DIVIDE
if(IN_ALU_1[31]==IN_ALU_2[31])begin//same sign-> positive result
	OUT_ALU64[31:0] = IN_ALU_1 / IN_ALU_2;
	OUT_ALU64[63:32] = IN_ALU_1 % IN_ALU_2;
end else begin//different sign-> negative result
	OUT_ALU64[31:0] = IN_ALU_1 / IN_ALU_2;
	OUT_ALU64[63:32] = IN_ALU_1 % IN_ALU_2;
	OUT_ALU64[63]=1;
	end
OUT_ALU32=0;
if (OUT_ALU64 == 0)
ZF_ALU = 1;else ZF_ALU=0;
end


if (ALU_control == 12'b010001000000)begin //ADD SINGLE
//for single
if(IN_ALU_1[31]==0 && IN_ALU_2[31]==0)begin//two positives
	if(IN_ALU_1[30:23]==IN_ALU_2[30:23])begin//same exponent?
		OUT_ALU32[22:0]=IN_ALU_1[22:0]+IN_ALU_2[22:0];//add fraction
		OUT_ALU32[31]=0;//positive
	end
	else begin //different exponents
	whos_bigger=IN_ALU_1[30:23]-IN_ALU_2[30:23];
		if(whos_bigger[7]==1)begin//negative-> IN_ALU_2 exponent is bigger
			OUT_ALU32[22:0] = IN_ALU_1[22:0]>>whos_bigger;//shift smaller number to the right 
			OUT_ALU32[30:23]=IN_ALU_2[30:23];
			OUT_ALU32[22:0]=OUT_ALU32[22:0]+IN_ALU_2[22:0];//adding two positives so result will be normalized already
		end else if(whos_bigger[7]==0)begin//positive-> IN_ALU_1 exponent is bigger 
			OUT_ALU32[22:0] = IN_ALU_2[22:0]>>whos_bigger;
			OUT_ALU32[30:23]=IN_ALU_1[30:23];
			OUT_ALU32[22:0]=IN_ALU_1[22:0]+OUT_ALU32[22:0];//adding two positives so result will be normalized already
		end
		OUT_ALU32[31]=0;//positive
	end	
end
else if(IN_ALU_1[31]==1 && IN_ALU_2[31]==1)begin//two negatives
if(IN_ALU_1[30:23]==IN_ALU_2[30:23])begin//same exponent?
		OUT_ALU32[22:0]=IN_ALU_1[22:0]+IN_ALU_2[22:0];//add fraction
		OUT_ALU32[31]=0;//positive
	end
	else begin //different exponents
	whos_bigger=IN_ALU_1[30:23]-IN_ALU_2[30:23];
		if(whos_bigger[7]==1)begin//negative-> IN_ALU_2 exponent is bigger
			OUT_ALU32[22:0] = IN_ALU_1[22:0]>>whos_bigger;//shift smaller number to the right 
			OUT_ALU32[30:23]=IN_ALU_2[30:23];
			OUT_ALU32[22:0]=OUT_ALU32[22:0]+IN_ALU_2[22:0];
		end else if(whos_bigger[7]==0)begin//positive-> IN_ALU_1 exponent is bigger 
			OUT_ALU32[22:0] = IN_ALU_2[22:0]>>whos_bigger;
			OUT_ALU32[30:23]=IN_ALU_1[30:23];
			OUT_ALU32[22:0]=IN_ALU_1[22:0]+OUT_ALU32[22:0];//adding two negatives so result will be normalized already
		end
		OUT_ALU32[31]=1;//negative
	end	
end
else if(IN_ALU_1[31]==1 && IN_ALU_2[31]==0)begin//different signs
if(IN_ALU_1[30:23]==IN_ALU_2[30:23])begin//same exponent?
		OUT_ALU32[30:23]=IN_ALU_1[30:23];
		OUT_ALU32[22:0]=IN_ALU_1[22:0]-IN_ALU_2[22:0];//sub fraction
		if(OUT_ALU32[22]==1)begin//IN_ALU_1 is smaller 
			OUT_ALU32[22:0]=IN_ALU_2[22:0]-IN_ALU_1[22:0];
			OUT_ALU32[31]=IN_ALU_2[31];end//take sign of bigger one
		else begin//IN_ALU_1 is bigger 
			OUT_ALU32[22:0]=IN_ALU_1[22:0]-IN_ALU_2[22:0];
			OUT_ALU32[31]=IN_ALU_1[31];end//take sign of bigger one
		end
	else begin //different exponents
	whos_bigger=IN_ALU_1[30:23]-IN_ALU_2[30:23];
		if(whos_bigger[7]==1)begin//negative-> IN_ALU_2 exponent is bigger
			OUT_ALU32[22:0] = IN_ALU_1[22:0]>>whos_bigger;//shift smaller number to the right 
			OUT_ALU32[30:23]=IN_ALU_2[30:23];
			OUT_ALU32[22:0]=IN_ALU_2[22:0]-OUT_ALU32[22:0];
			OUT_ALU32[31]=IN_ALU_2[31];
		end else if(whos_bigger[7]==0)begin//positive-> IN_ALU_1 exponent is bigger 
			OUT_ALU32[22:0] = IN_ALU_2[22:0]>>whos_bigger;
			OUT_ALU32[30:23]=IN_ALU_1[30:23];
			OUT_ALU32[22:0]=IN_ALU_1[22:0]-OUT_ALU32[22:0];
			OUT_ALU32[31]=IN_ALU_1[31];
		end		
	end	
end
end

//COMPARE SINGLE 
if(ALU_control == 12'b010001110010)begin		//eq
if(IN_ALU_1 == IN_ALU_2)//single
OUT_ALU32 = 1;
else OUT_ALU32 = 0;

if (OUT_ALU32 == 0)
ZF_ALU=1;
else ZF_ALU=0;
end


if(ALU_control == 12'b010001111100)begin		//less than (check sign -> exponent -> fraction)
if(IN_ALU_1[31]==1 && IN_ALU_2[31]==0)//negative is less than positive
OUT_ALU32 = 32'b1;
else if(IN_ALU_1[31]==0 && IN_ALU_2[31]==1)//positive is not less than negative :)
OUT_ALU32 = 32'b0;
else if(IN_ALU_1[30:23]<IN_ALU_2[30:23])//same sign, smaller exponent-> less than
OUT_ALU32 = 32'b1;
else if(IN_ALU_1[30:23]>IN_ALU_2[30:23])//bigger exponents-> not less than
OUT_ALU32 = 32'b0;
else if(IN_ALU_1[22:0]<IN_ALU_2[22:0])//same exponents-> compare fractions
OUT_ALU32 = 32'b1;
else if(IN_ALU_1[22:0]>IN_ALU_2[22:0])
OUT_ALU32 = 32'b0;

if (OUT_ALU32 == 0)
ZF_ALU=1;
else ZF_ALU=0;
end


if(ALU_control == 12'b010001111110)begin 		//less than eq
if(IN_ALU_1 == IN_ALU_2)//equal
OUT_ALU32 = 1;
else if(IN_ALU_1[31]==1 && IN_ALU_2[31]==0)//negative is less than positive
OUT_ALU32 = 32'b1;
else if(IN_ALU_1[31]==0 && IN_ALU_2[31]==1)//positive is not less than negative :)
OUT_ALU32 = 32'b0;
else if(IN_ALU_1[30:23]<IN_ALU_2[30:23])//same sign, smaller exponent-> less than
OUT_ALU32 = 32'b1;
else if(IN_ALU_1[30:23]>IN_ALU_2[30:23])//bigger exponents-> not less than
OUT_ALU32 = 32'b0;
else if(IN_ALU_1[22:0]<IN_ALU_2[22:0])//same exponents-> compare fractions
OUT_ALU32 = 32'b1;
else if(IN_ALU_1[22:0]>IN_ALU_2[22:0])
OUT_ALU32 = 32'b0;
else OUT_ALU32 = 32'b0;

if (OUT_ALU32 == 0)
ZF_ALU=1;
else ZF_ALU=0;
end


if (ALU_control[11:6]==6'h31) begin 			//LOAD FP SINGLE
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end


if (ALU_control[11:6] == 6'h35) begin 			//LOAD FP DOUBLE
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU =1;else ZF_ALU=0;
end

if (ALU_control == 12'b000011010000) begin 	//MOVE FROM HI
OUT_ALU32 = IN_ALU_1;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end

if(ALU_control == 12'b000011010010) begin 	//MOVE FROM LO
OUT_ALU32 = IN_ALU_1;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end


if (ALU_control == 12'b000011011000) begin	//MULTIPLY
if(IN_ALU_1[31]==IN_ALU_2[31])begin//same sign-> positive result
	OUT_ALU64 = IN_ALU_1 * IN_ALU_2;
end else begin//different sign-> negative result
	OUT_ALU64 = IN_ALU_1 * IN_ALU_2;
	OUT_ALU64[63]=1;
	end
OUT_ALU32 = 0;
if (OUT_ALU64 == 0)
ZF_ALU =1;else ZF_ALU=0;
end


if (ALU_control == 12'b000011000011) begin 	//SHIFT RIGHT ARITHMATIC
OUT_ALU32 = IN_ALU_1 >>> IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end

if (ALU_control[11:6] == 6'h39) begin 			//STORE FP SINGLE
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end 

if (ALU_control[11:6] == 6'h3d) begin 			//STORE FP DOUBLE
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU =1;else ZF_ALU=0;
end



end
endmodule
