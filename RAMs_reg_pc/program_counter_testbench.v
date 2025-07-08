`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:56:47 05/29/2025
// Design Name:   program_counter
// Module Name:   /home/ise/nand2tetris_w3/program_counter_testbench.v
// Project Name:  nand2tetris_w3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: program_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module program_counter_testbench;

	// Inputs
	reg [15:0] in;
	reg load;
	reg inc;
	reg reset;
	reg clk;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	program_counter uut (
		.in(in), 
		.load(load), 
		.inc(inc), 
		.reset(reset), 
		.clk(clk), 
		.out(out)
	);
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		in = 0;
		load = 0;
		inc = 0;
		reset = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
	
		in  =16'h1230;
		load = 1 ;
		inc = 0;
		reset =0;
		#10;
		
		
		in  =16'h1230;
		load = 0;
		inc = 1;
		reset =0;
		#10;
		
		in  =16'h1230;
		load = 0;
		inc = 1;
		reset =0;
		#10;

		in  =16'h1230;
		load = 0;
		inc = 1;
		reset =0;
		#10;

		in  =16'h1598;
		load = 1;
		inc = 1;
		reset =0;
		#10;
		
		in  =16'h1598;
		load = 1;
		inc = 1;
		reset =0;
		#10;
		
		in  =16'h1598;
		load = 0;
		inc = 1;
		reset =1;
		#10;
		
		in  =16'h1598;
		load = 0;
		inc = 0;
		reset =1;
		#10;
		
		in  =16'h1598;
		load = 1;
		inc = 0;
		reset =1;
		#10;
		
		in  =16'h1598;
		load = 0;
		inc = 1;
		reset =0;
		#10;
		
		in  =16'h1598;
		load = 0;
		inc = 1;
		reset =0;
		#10;
		
		in  =16'h1598;
		load = 1;
		inc = 1;
		reset =1;
		#10;
		
		in  =16'h1598;
		load = 0;
		inc = 1;
		reset =0;
		#10;
		


		
	end
     
	 initial begin 
	 $monitor (" input = %h , load =%d , inc= %d , reset =%d , output = %h " , in,load,inc,reset,out);
	 end
endmodule

