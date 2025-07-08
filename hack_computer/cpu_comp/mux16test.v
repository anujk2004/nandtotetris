`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:58:21 06/06/2025
// Design Name:   mux16
// Module Name:   /home/ise/nand2tetrisw5/mux16test.v
// Project Name:  nand2tetrisw5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux16test;

	// Inputs
	reg [15:0] in1;
	reg  sel;
	reg [15:0] in2;
	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	mux16 uut (
		.in1(in1), 
		.sel(sel), 
		.in2(in2),
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in1 = 16'h1234;
		in2 = 16'haaaa;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in1 = 16'h1234;
		in2 = 16'haaaa ;
		sel =  1;

		// Wait 100 ns for global reset to finish
		
	end
     initial begin
		$monitor ("in1 = %h , in2  = %h ,sel = %b , time = %t , output = %h ", in1 , in2 , sel , $time ,out);
		end
endmodule

