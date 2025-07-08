`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:09:11 06/07/2025
// Design Name:   keyboard
// Module Name:   /home/ise/nand2tetrisw5/keytest.v
// Project Name:  nand2tetrisw5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: keyboard
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module keytest;

	// Inputs
	reg clk;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	keyboard uut (
		.clk(clk), 
		.out(out)
	);
	initial begin
		clk=0;
		forever #5 clk =~clk
	end
	initial begin
		// Initialize Inputs
		keypress(16'h 0041);

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here

	end
      
endmodule

