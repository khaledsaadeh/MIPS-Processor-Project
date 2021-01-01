module Buffer_n(input clk,
					input FP,
					input [31:0]Rs_MSG,
					input [31:0]Rt_data_ID,
					input [31:0]Rt_MSG,
					input [31:0]Rd_data_ID,
					output reg FP_out,
					output reg [31:0]Rs_MSG_out,
					output reg [31:0]Rt_data_ID_out,
					output reg [31:0]Rt_MSG_out,
					output reg [31:0]Rd_data_ID_out);
					
					reg control;
initial begin 
 control=1;
 FP_out<=0;
 Rs_MSG_out<=32'h0;
 Rt_data_ID_out<=32'h0;
 Rt_MSG_out<=32'h0;
 Rd_data_ID_out<=32'h0;
end
always@(*)begin
if(control)begin
FP_out <= FP;
Rs_MSG_out <= Rs_MSG;
Rt_data_ID_out <=Rt_data_ID;
Rt_MSG_out		<=Rt_MSG;
Rd_data_ID_out	<=Rd_data_ID;
end
end
endmodule
