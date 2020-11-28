module tst_4; 
	reg [31:0]PC_VALUE_;		  
	reg [31:0] cycle;
	Top top(PC_VALUE_);
	initial begin
		PC_VALUE_ <=300;	  
		cycle <= 11;
	end				   
	always @(posedge top.clk) begin	
	cycle = cycle + 1;
	if (cycle == 25)
	begin
		$display("cycle: %d" , cycle);
		$display("PC: %d",top.program_counter);				   
		$display("ALUOut_EXEC: %d" , top.ALUOut_EXEC);
		$display("R[S0]: %d" , top.regFile.registers_i[0], " The correct value is 5");
		$display("R[S1]: %d" , top.regFile.registers_i[1], " The correct value is 0");		
		$display("R[S2]: %d" , top.regFile.registers_i[2], " The correct value is 0");		
		$display("R[S3]: %d" , top.regFile.registers_i[3], " The correct value is 15");
		$display("R[S4]: %d" , top.regFile.registers_i[4], " The correct value is 20");
		$display("R[S5]: %d" , top.regFile.registers_i[5], " The correct value is 24");
		$display("R[S6]: %d" , top.regFile.registers_i[6], " The correct value is 28");
		
		
		
	
		
		$finish;
		end
		
		
	
		
	end
endmodule