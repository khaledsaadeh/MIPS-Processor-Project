module tst_9; 
	reg [31:0]PC_VALUE_;		  
	reg [31:0] cycle;
	Top top(PC_VALUE_);
	initial begin
		PC_VALUE_ <= 656;	  
		cycle <= 1;
	end				   
	always @(posedge top.clk) begin	
	
	if (cycle == 10)
	begin
		$display("cycle: %d" , cycle);
		$display("PC: %d",top.program_counter);				   
		$display("$t1: %d" , top.regFile.registers_i[9], " The correct value is 14");
	   $display("$s2: %d" , top.regFile.registers_i[20], " The correct value is 10");	
				
		$finish;
		end
		
		
	cycle = cycle + 1;
		
	end
endmodule