`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:08:57 06/07/2025
// Design Name:   screen
// Module Name:   /home/ise/nand2tetrisw5/screentest.v
// Project Name:  nand2tetrisw5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: screen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module screentest;

	// Inputs
	reg [15:0] in;
	reg [12:0] address;
	reg load;
	

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	screen uut (
		.in(in), 
		.address(address), 
		.load(load), 
		
		.out(out)
	);
	
	
	initial begin
		// Initialize Inputs
		in =16'h aaaa ;
		address = 0;
		load = 0;
		#10;
      
		  
		 in =16'h a0aa ;
		address = 0;
		load = 1;
		#10;
		
		in =16'h ffff ;
		address = 13'h15;
		load = 1;
		#10;
		
		
		in =16'h 1234 ;
		address = 14'h67;
		load = 1;
		#10;
		
		in =16'h45  ;
		address = 14'h67;
		load = 0;
		#10;
		
		
		in =16'h a0aa ;
		address = 1;
		load = 1;
		#20;
		// Add stimulus here

	end
    initial begin
		$monitor ("time=%t, in=%h, address=%h, load=%b , out=%h",$time,in,address,load,out);
		end
endmodule

