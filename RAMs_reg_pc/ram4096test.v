`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:29:14 05/27/2025
// Design Name:   ram4096
// Module Name:   /home/ise/nand2tetris_w3/ram4096test.v
// Project Name:  nand2tetris_w3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ram4096
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ram4096test;

	// Inputs
	reg [15:0] in;
	reg load;
	reg clk;
	reg [11:0] address;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	ram4096 uut (
		.in(in), 
		.load(load), 
		.clk(clk), 
		.address(address), 
		.out(out)
	);
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		in = 0;
		load = 0;
		clk =0;
		address = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		in = 16'h0234;
		load = 0;
		
		address = 12'h03;
		
		#10;
      load =1;
		#10;
		
		// Add stimulus here
		in = 16'h1245;
		load = 1;
		
		address = 12'h13;
		
		#10;
       load =1;
		#10;
		// Add stimulus here
		in = 16'habc4;
		load = 1;
		
		address = 12'haa;
		
		#10;
       load =0;
		#10 ;
		// Add stimulus here
		in = 16'h0001;
		load = 1;
		
		address = 12'h090;
		
		#10;
       load =1;
		#10; 
		// Add stimulus here
		in = 16'h0234;
		load = 1;
		
		address = 12'h231;
		
		#10;
       load =1;
		#10; 
		// Add stimulus here
		in = 16'h0234;
		load = 1;
		
		
		load =1;
		#10; 
		
		address = 12'h110;
		load =1;
		#10;
		
		load =1;
		#10; 

	end
	initial begin 
	$monitor ("time = %t , address = %d  , load = %d ,  in = %h  , out =%h " , $time, address , load, in , out);
     
	end
      
endmodule

