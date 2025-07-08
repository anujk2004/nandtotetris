`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:56:43 06/06/2025
// Design Name:   programcounter
// Module Name:   /home/ise/nand2tetrisw5/pctest.v
// Project Name:  nand2tetrisw5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: programcounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pctest;

	// Inputs
	reg [14:0] in;
	reg load;
	reg clk;
	
	reg reset;

	// Outputs
	wire [14:0] out;

	// Instantiate the Unit Under Test (UUT)
	programcounter uut (
		.in(in), 
		.load(load), 
		.clk(clk), 
	
		.reset(reset), 
		.out(out)
	);
	
	initial begin
	clk =0;
	forever #5 clk=~clk;
		
	end

	initial begin
		// Initialize Inputs
		in = 15'hbcd;
		load = 1;
	
		reset = 0;
		#10;
		
		in = 15'hbcd;
		load = 1;
	
		reset = 0;
		#10;
		
		in = 15'hbcd;
		load = 0;
	
		reset = 0;
		#10;
		
		in = 15'hbcd;
		load = 0;
	
		reset = 0;
		#10;
		
		in = 15'hbcd;
		load = 0;

		reset = 0;
		#10;
		
		in = 15'hbcd;
		load = 1;
	
		reset = 1;
		#10;
		
		in = 15'hacd;
		load = 0;

		reset = 0;
		#10;
		
		in = 15'habc;
		load = 0;

		reset = 1;
		#10;
		
        
		// Add stimulus here

	end
	
	initial begin
	$monitor ("time = %t, in=%h, load=%b,  reset=%b, out=%h",  $time, in,load,reset,out);
	end
      
endmodule

