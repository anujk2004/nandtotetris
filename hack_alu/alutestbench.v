`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:58:32 05/16/2025
// Design Name:   alu
// Module Name:   /home/ise/nand2tetris_w2/alutestbench.v
// Project Name:  nand2tetris_w2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alutestbench;

	// Inputs
	reg [15:0] x;
	reg [15:0] y;
	reg zx;
	reg nx;
	reg zy;
	reg ny;
	reg f;
	reg no;

	// Outputs
	wire zr;
	wire ng;
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.x(x), 
		.y(y), 
		.zx(zx), 
		.nx(nx), 
		.zy(zy), 
		.ny(ny), 
		.f(f), 
		.no(no), 
		.zr(zr), 
		.ng(ng), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		x = 16'h0001;
		y = 16'h0002;
		zx = 0;
		nx = 1;
		zy = 1;
		ny = 1;
		f = 1;
		no = 1;

		
		#100;
        
	

	end
      
endmodule

