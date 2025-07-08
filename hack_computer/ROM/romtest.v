`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:59:17 06/07/2025
// Design Name:   rom32k
// Module Name:   /home/ise/nand2tetrisw5/romtest.v
// Project Name:  nand2tetrisw5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rom32k
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module romtest;

	// Inputs
	reg [14:0] address;
	reg clk;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	rom32k uut (
		.address(address), 
		.clk(clk), 
		.out(out)
	);
	initial begin
	clk =0;
	forever #5 clk= ~clk;
	end
	initial begin
		// Initialize Inputs
		address = 14'h 1ab;
		

		// Wait 100 ns for global reset to finish
		#10;
		
       address = 14'h0;
			#10;
			
			address = 14'h5;
			#10;
			
			
			address = 14'h9;
			#10;
			
			
			address = 14'hf;
			#10;
			
			address = 14'ha;
			#10;
			
			address = 14'h1;
			#10;
		// Add stimulus here

	end
    initial begin
	$monitor("out=%h",out);
end	 
endmodule

