module tst_5; 
	reg [31:0]PC_VALUE_;		  
	reg [31:0] cycle;
	Top top(PC_VALUE_);
	initial begin
		PC_VALUE_ <= 400;	  
		cycle <= 1;
	end				   
	always @(posedge top.clk) begin	
if (cycle== 9)	
begin
		$display("cycle: %d" , cycle);
		$display("PC: %d",top.program_counter);				   
		$display("ALUOut_EXEC: %d" , top.ALUOut_EXEC);
		$display("R[S0]: %d" , top.regFile.registers_i[0], " The correct answer is 16" );
		$display("R[S1]: %d" , top.regFile.registers_i[1], " The correct answer is 0" );		
		$finish;
		end
		cycle = cycle + 1;
	end
endmodule