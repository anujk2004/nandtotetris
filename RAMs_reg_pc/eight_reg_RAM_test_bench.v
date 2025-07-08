`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:41:59 05/17/2025
// Design Name:   eight_regiser_RAM
// Module Name:   /home/ise/nand2tetris_w3/eight_reg_RAM_test_bench.v
// Project Name:  nand2tetris_w3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: eight_regiser_RAM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module eight_reg_RAM_test_bench;

	// Inputs
	reg [15:0] in;
	reg load;
	reg clk;
	reg [2:0] address;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	eight_regiser_RAM uut (
		.in(in), 
		.load(load), 
		.clk(clk), 
		.address(address), 
		.out(out)
	);
	
	initial begin
	clk=0;
	forever #5 clk=~clk;
	end 
	initial begin
		// Initialize Inputs
		in = 16'h1234;
		load = 0;
		
		address = 0;
		
		

		// Wait 100 ns for global reset to finish
		#10;
		
		in = 16'h1234;
		load = 1;
		
		address = 0;
		
		

		// Wait 100 ns for global reset to finish
		#10;
		in = 16'h0000;
		load = 1;
		
		address = 0;
		
		

		// Wait 100 ns for global reset to finish
		#10;
		
		in = 16'h1424;
		load = 1;
		
		address = 5;

		// Wait 100 ns for global reset to finish
		#10;
		in = 16'haaaa;
		load = 1;
		
		address = 7;

		// Wait 100 ns for global reset to finish
		#10;
		
		in = 16'hb123;
		load = 1;
		
		address = 4;

		// Wait 100 ns for global reset to finish
		#10;
		
		
		in = 16'h10c4;
		load = 1;
		
		address = 2;

		// Wait 100 ns for global reset to finish
		#10;
		
		in = 16'h1cc4;
		load = 1;
		
		address = 2;

		// Wait 100 ns for global reset to finish
		#10;in = 16'h1af4;
		load = 1;
		
		address = 3;

		// Wait 100 ns for global reset to finish
		#10;
		in = 16'h1204;
		load = 1;
		
		address = 3;

		// Wait 100 ns for global reset to finish
		#10;
		in = 16'hffff;
		load = 1;
		
		address = 5;

		// Wait 100 ns for global reset to finish
		#100;
		
		in = 16'h1234;
		load = 1;
		
		address = 0;
		
		

		// Wait 100 ns for global reset to finish
		#100;
		in = 16'h1234;
		load = 1;
		
		address = 1;
		
		

		// Wait 100 ns for global reset to finish
		#100;in = 16'h1034;
		load = 1;
		
		address = 5;
		
		

		// Wait 100 ns for global reset to finish
		#100;
		in = 16'h1264;
		load = 1;
		
		address = 2;
		
		

		// Wait 100 ns for global reset to finish
		#100;
		
		in = 16'h1114;
		load = 0;
		
		address = 5;
		
		
		

		// Wait 100 ns for global reset to finish
		#100;
		in = 16'h1234;
		load = 1;
		
		address = 5;
		
		

		// Wait 100 ns for global reset to finish
		#100;
        
		

	end
	
initial begin
 $monitor ("time = %t , address = %d  , load = %d ,  in = %h  , out =%h " , $time, address , load, in , out);
      end
endmodule

