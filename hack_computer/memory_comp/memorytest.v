`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:12:17 06/07/2025
// Design Name:   memory
// Module Name:   /home/ise/nand2tetrisw5/memorytest.v
// Project Name:  nand2tetrisw5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memorytest;

	// Inputs
	reg [15:0] in;
	reg [14:0] address;
	reg load;
	reg clk;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	memory uut (
		.in(in), 
		.address(address), 
		.load(load), 
		.clk(clk), 
		.out(out)
	);
	initial begin
		force kb.keypress(16'h0041);
		end
	initial begin
		// Initialize Inputs
		in = 0;
		address = 0;
		load = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

