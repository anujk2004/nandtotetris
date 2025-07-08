`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:42:35 06/06/2025
// Design Name:   reg16
// Module Name:   /home/ise/nand2tetrisw5/regtest.v
// Project Name:  nand2tetrisw5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reg16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module regtest;

	// Inputs
	reg [15:0] in;
	reg load;
	reg clk;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	reg16 uut (
		.in(in), 
		.load(load), 
		.clk(clk), 
		.out(out)
	);
	initial begin
	forever #5 clk = ~clk ;
	end
	initial begin
		// Initialize Inputs
		in = 16'h0912;
		load = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
		in = 16'h0912;
		load = 1;
		#10;
		
		
		in = 16'hffff;
		load = 0;
		#10;
		
		in = 16'h0912;
		load = 1;
		#10;
       
		 in = 16'hffff;
		load = 1;
		#10;
		
		in = 16'h0912;
		load = 1;
		#10;
		// Add stimulus here

	end
    initial begin
  $monitor("time = %t, in = %h, load =%b, out =%h", $time, in,load,out);	
end  
endmodule

