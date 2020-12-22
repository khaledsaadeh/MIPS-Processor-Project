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

wire opcode = ALU_control[11:6];
wire funct = ALU_control[5:0];

always @(*) begin

if(ALU_control ==  12'b000011100000)begin // ADD
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end


if (opcode == 6'h9 ) begin  //ADD IMMEDIATE
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

if (opcode == 6'hc) begin //AND IMMEDIATE 
OUT_ALU32 = IN_ALU_1 & IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end

if (opcode == 6'h5) begin  // BRANCH EQUAL
if (IN_ALU_1 == IN_ALU_2)
ZF_ALU =1;
else ZF_ALU =0;
end

if (opcode == 6'h4) begin  // BRANCH NOT EQUAL
if (IN_ALU_1 != IN_ALU_2)
ZF_ALU =1;
else ZF_ALU = 0;
end

if (opcode == 6'h22 )begin //LOAD BYTE UNSIGNED
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
OUT_ALU64 = 0;
if (OUT_ALU32 == 0)
ZF_ALU=1;else ZF_ALU=0;
end

if (opcode == 6'hf)begin //LOAD UPPER IMMEDIATE
OUT_ALU32 = {IN_ALU_2, 16'b0};
OUT_ALU64 = 0;
if (OUT_ALU32 == 0)
ZF_ALU=1;else ZF_ALU=0;
end

if (opcode == 6'h12 )begin //LOAD WORD
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

if (ALU_control == 12'b000011100111)begin //OR
OUT_ALU32 = IN_ALU_1 | IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end

if (opcode==6'he)begin //OR IMMEDIATE	
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

if (opcode == 6'h28) begin //STORE BYTE
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
OUT_ALU64 = 0;
if (OUT_ALU32 == 0)
ZF_ALU=1;else ZF_ALU=0;
end

if (opcode == 6'h2b)begin //STORE WORD
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
OUT_ALU64[31:0] = IN_ALU_1 / IN_ALU_2;
OUT_ALU64[63:32] = IN_ALU_1 % IN_ALU_2;
OUT_ALU32=0;
if (OUT_ALU64 == 0)
ZF_ALU = 1;else ZF_ALU=0;
end




if (ALU_control == 12'b010001000000)begin //ADD SINGLE OR DOUBLE
OUT_ALU32 = IN_ALU_1 + IN_ALU_2; //for single
OUT_ALU64 = {IN_ALU_MSG1,IN_ALU_1} + {IN_ALU_MSG2,IN_ALU_2}; //for double
if (OUT_ALU64 == 0)
ZF_ALU=1;
else ZF_ALU=0;
end


//COMPARE SINGLE OR DOUBLE
if(ALU_control == 12'b010001110010)begin//eq
if(IN_ALU_1 == IN_ALU_2)//single
OUT_ALU32 = 1;
else OUT_ALU32 = 0;
if({IN_ALU_MSG1,IN_ALU_1} == {IN_ALU_MSG2,IN_ALU_2})//single
OUT_ALU64 = 1;
else OUT_ALU64 = 0;

if ((OUT_ALU64 == 0) || (OUT_ALU32 == 0))
ZF_ALU=1;
else ZF_ALU=0;
end


if(ALU_control == 12'b010001111100)begin//less than
if(IN_ALU_1 < IN_ALU_2)
OUT_ALU32 = 1;
else OUT_ALU32 = 0;
if({IN_ALU_MSG1,IN_ALU_1} < {IN_ALU_MSG2,IN_ALU_2})
OUT_ALU64 = 1;
else OUT_ALU64 = 0;

if ((OUT_ALU64 == 0) || (OUT_ALU32 == 0))
ZF_ALU=1;
else ZF_ALU=0;
end



if(ALU_control == 12'b010001111110)begin //less than eq
if(IN_ALU_1 <= IN_ALU_2)
OUT_ALU32 = 1;
else OUT_ALU32 = 0;
if({IN_ALU_MSG1,IN_ALU_1} <= {IN_ALU_MSG2,IN_ALU_2})
OUT_ALU64 = 1;
else OUT_ALU64 = 0;

if ((OUT_ALU64 == 0) || (OUT_ALU32 == 0))
ZF_ALU=1;else ZF_ALU=0;
end


if (opcode==6'h31) begin //LOAD FP SINGLE
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end


if (opcode == 6'h35) begin //LOAD FP DOUBLE
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU =1;else ZF_ALU=0;
end

if (ALU_control == 12'b000011010000) begin //MOVE FROM HI
OUT_ALU32 = IN_ALU_1;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end

if(ALU_control == 12'b000011010010) begin //MOVE FROM LO
OUT_ALU32 = IN_ALU_1;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end


if (ALU_control == 12'b000011011000) begin //MULTIPLY
OUT_ALU64 = IN_ALU_1 * IN_ALU_2;
if (OUT_ALU64 == 0)
ZF_ALU =1;else ZF_ALU=0;
OUT_ALU32 = 0;
end

if (ALU_control == 12'b000011000011) begin //SHIFT RIGHT ARITHMATIC
OUT_ALU32 = IN_ALU_1 >>> IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end

if (opcode == 6'h39) begin // STORE FP SINGLE
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU = 1;else ZF_ALU=0;
OUT_ALU64 = 0;
end 

if (opcode == 6'h3d) begin  //STORE FP DOUBLE
OUT_ALU32 = IN_ALU_1 + IN_ALU_2;
if (OUT_ALU32 == 0)
ZF_ALU =1;else ZF_ALU=0;
end



end
endmodule
