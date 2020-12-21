module Hazard_Detection_Unit( 
output reg IF_stall,
output reg PC_stall,
output reg ID_stall_hazard,
input [31:0]Rt_ID,
input [31:0]Rs_ID,
input [31:0]Rd_EXE,
input load_control
);
initial begin 
IF_stall = 0;
PC_stall = 0;
ID_stall_hazard = 0;
end 

always@(*)begin
if((load_control) && (Rd_EXE == Rs_ID || Rd_EXE == Rt_ID)) begin

IF_stall = 1;
PC_stall = 1;
ID_stall_hazard = 1;

end
else begin 
IF_stall = 0;
PC_stall = 0;
ID_stall_hazard = 0;
end 

end

endmodule 

