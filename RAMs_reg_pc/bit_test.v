`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:59:07 05/16/2025
// Design Name:   one_bit_reg
// Module Name:   /home/ise/nand2tetris_w3/bit_test.v
// Project Name:  nand2tetris_w3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: one_bit_reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bit_test;

	// Inputs
	reg in;
	reg load;
	reg clk;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	one_bit_reg uut (
		.in(in), 
		.load(load), 
		.clk(clk), 
		.out(out)
	);


initial begin
	clk=0;
	forever #10 clk=~clk;
	end
	initial begin
		// Initialize Inputs
		in = 1;
		load = 0;
		

		// Wait 100 ns for global reset to finish
		#20;
		
		in = 1;
		load = 1;
	

		// Wait 100 ns for global reset to finish
		#20;
		
		in = 1;
		load = 0;
		 #20
		
		in= 0;
		load =1;

		// Wait 100 ns for global reset to finish
		
		#20
		$finish ;
        
		// Add stimulus here

	end
      initial begin
  $monitor("Time=%0t | in=%b | load=%b | out=%b", $time, in, load, out);
end

endmodule

