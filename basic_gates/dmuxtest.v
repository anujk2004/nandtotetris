`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:06:01 07/08/2025
// Design Name:   dmux
// Module Name:   /home/ise/nand2tetris_w1/dmuxtest.v
// Project Name:  nand2tetris_w1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dmux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dmuxtest;

	// Inputs
	reg in;
	reg [1:0] sel;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	dmux uut (
		.in(in), 
		.out(out), 
		.sel(sel)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		sel = 1;

		// Wait 100 ns for global reset to finish
		#10;
		
		in = 1;
		sel = 2'b00;

		// Wait 100 ns for global reset to finish
		#10;
		
		
		in = 1;
		sel = 2'b10;
		
		
		
        
		// Add stimulus here

	end
      initial begin
			$monitor ("in: %b sel :%b out : %b " , in ,sel, out);
		end
endmodule

