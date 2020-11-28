module tst_1; 
	reg [31:0]PC_VALUE_;		  
	reg [31:0] cycle;
	Top top(PC_VALUE_);
	initial begin
		PC_VALUE_ <= 0;	  
		cycle <= 1;
	end				   
	always @(posedge top.clk) begin	
	
	if (cycle == 16)
	begin
		$display("cycle: %d" , cycle);
		$display("PC: %d",top.program_counter);				   
		$display("ALUOut_EXEC: %d" , top.ALUOut_EXEC);
		$display("R[S0]: %d" , top.regFile.registers_i[0], " The correct value is 4");
		$display("R[S1]: %d" , top.regFile.registers_i[1], " The correct value is 8");		
		$display("R[S2]: %d" , top.regFile.registers_i[2], " The correct value is 12");		
		$display("R[S3]: %d" , top.regFile.registers_i[3], " The correct value is 16");
		$display("R[S4]: %d" , top.regFile.registers_i[4], " The correct value is 20");
		$display("R[S5]: %d" , top.regFile.registers_i[5], " The correct value is 24");
		$display("R[S6]: %d" , top.regFile.registers_i[6], " The correct value is 28");
		$display("R[S7]: %d" , top.regFile.registers_i[7], " The correct value is 32");
		$display("R[S8]: %d" , top.regFile.registers_i[8], " The correct value is 36");
		$display("R[S9]: %d" , top.regFile.registers_i[9], " The correct value is 40");
	
		
		$finish;
		end
		
		
	cycle = cycle + 1;
		
	end
endmodule