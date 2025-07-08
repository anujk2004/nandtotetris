`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:52:21 05/27/2025
// Design Name:   ram64
// Module Name:   /home/ise/nand2tetris_w3/ram64test.v
// Project Name:  nand2tetris_w3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ram64
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ram64test;

	// Inputs
	reg [15:0] in;
	reg load;
	reg clk;
	reg [5:0] address;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	ram64 uut (
		.in(in), 
		.load(load), 
		.clk(clk), 
		.address(address), 
		.out(out)
	);

	always #5 clk =~clk;
	
	initial begin
		// Initialize Inputs
		in = 0;
		load = 0;
		clk = 0;
		address = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
		
		write(6'd0 ,16'habcd);
		write(6'd7 ,16'h1001);
		write(6'd1 ,16'h9831);
		write(6'd2 ,16'h9831);
		write(6'd26 ,16'h9831);
		write(6'd30 ,16'h9831);
		write(6'd15 ,16'h9831);
		
		
		#20 
		read(6'd0);
		read(6'd1);
		read(6'd7);
		read(6'd2);
		read(6'd15);
		read(6'd5);
		read(6'd26);
		read(6'd30);
      
		// Add stimulus here

	end
task write (input [5:0] addr , input [15:0] data);
	begin 
	@(negedge clk)
	address = addr;
	in = data;
	load =1;
	@(negedge clk)
	load =0;
	end
endtask

task read (input [5:0] addr);
	begin 
		@(negedge clk);
		address = addr;
		load =0;
		@(posedge clk);
		$display("address %d: out =%h",addr,out);
	end
endtask
      
endmodule

