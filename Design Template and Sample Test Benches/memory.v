module DataMemory ();



you should use this initialization to build your data memory, this part is not complete


	
	///  Intitialization for the memory 
	
	reg [7:0] mem [1023:0]; // building a 1k memory //
	integer i;
	
	initial
		begin
			for(i = 0; i <1024; i = i + 1)
				begin
					mem[i] <=  0;
					if((i+1)%4 == 0)
					mem[i] <= i+1;
				end
			
		end
	
	
endmodule

