module arethmatic1; 
	reg [31:0]PC_VALUE_;		  
	reg [31:0] cycle;
	Top top(PC_VALUE_);
	initial begin
		PC_VALUE_ <= 200;	  
		cycle <= 1;
	end				   
	always @(posedge top.clk) begin	
	
	if (cycle == 8)
	begin
		$display("cycle: %d" , cycle);
		$display("PC: %d",top.program_counter);				   
		$display("ALUOut_EXEC: %d" , top.ALUOut_EXEC);
		$display("R[S0]: %d" , top.regFile.registers_i[0], " The correct value is 16");
		$display("R[S1]: %d" , top.regFile.registers_i[1], " The correct value is 17");		
		$display("R[S2]: %d" , top.regFile.registers_i[2], " The correct value is 0");		
		$display("R[S3]: %d" , top.regFile.registers_i[3], " The correct value is 17");
		
	
		
		$finish;
		end
		
		
	cycle = cycle + 1;
		
	end
endmodule