`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:26:26 07/21/2025
// Design Name:   cpu
// Module Name:   /home/ise/nand2tetrisw5/cputest.v
// Project Name:  nand2tetrisw5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cputest;

	// Inputs
	reg [15:0] instr;
	reg [15:0] inM;
	reg reset;
	reg clk;

	// Outputs
	wire writeM;
	wire [14:0] pc;
	wire [14:0] addressM;
	wire [15:0] outM;

	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.instr(instr), 
		.inM(inM), 
		.reset(reset), 
		.clk(clk), 
		.writeM(writeM), 
		.pc(pc), 
		.addressM(addressM), 
		.outM(outM)
	);
	
	initial begin
	clk=0;
	forever #5 clk = ~clk;
	end
	initial begin

	 instr = 0; inM = 0; reset = 1;
        #15;
        reset = 0;
        #5;
		  instr = 16'b0011000000111001; #10;
		// Wait 100 ns for global reset to finish
			instr = 16'b1110110000010000;
			#10;
        instr = 16'b0101101110100000;
		  #10;
		  instr = 16'b1110000111010000; #10;
		  instr = 16'b0000001111101000; #10;
		  instr = 16'b1110001100001000; 
		  #10;
		  instr = 16'b0000001111101001; #10;
		   instr = 16'b1110001110011000; #10;
			instr = 16'b0000001111101000; 
			#10;
			
			 inM = 11111;
        instr = 16'b1111010011010000; #10;
        inM = 0; 
		  
		  instr = 16'b0000000000001110; #10;
		  instr = 16'b1110001100000100; #10;
		  instr = 16'b0000001111100111; #10;
	instr = 16'b1110110111100000; #10;
	instr = 16'b1110001100001000; #10;
		 instr = 16'b0000000000010101; #10; 
		 instr = 16'b1110011111000010; #10;
		 instr = 16'b0000000000000010; #10;
		 instr = 16'b1110000010010000; #10;
instr = 16'b1110000010010000; #10;
 instr = 16'b1110111010010000; #10; 
 instr = 16'b1110001100000001; #10;
 instr = 16'b1110001100000011; #10;
 instr = 16'b1110001100000100; #10;
 instr = 16'b1110001100000101; #10;
 instr = 16'b1110001100000111; #10;
 instr = 16'b1110001100000101; #10;
 instr = 16'b1110001100000111; #10;



		// Add stimulus here

	end
    initial begin
	$monitor("time:%t , instruction:%h , inM:%h, reset:%b , outM:%h , writeM:%b, addressM:%d , pc:%d",$time,instr,inM,reset,outM,writeM,addressM,pc);
		end
endmodule

