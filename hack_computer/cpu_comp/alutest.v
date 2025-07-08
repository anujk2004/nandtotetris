`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:53:56 06/06/2025
// Design Name:   alu
// Module Name:   /home/ise/nand2tetrisw5/alutest.v
// Project Name:  nand2tetrisw5
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

module alutest;

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
	wire [15:0] out;
	wire zr;
	wire ng;

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
		.out(out), 
		.zr(zr), 
		.ng(ng)
	);
	
	
	initial begin
		// Initialize Inputs
		x = 16'h 0001;
		y = 16'h 0005;
		zx = 0;
		nx = 0;
		zy = 0;
		ny = 1;
		f = 1;
		no = 1;
		#10;
		
		
		x = 16'h 0001;
		y = 16'h 0005;
		zx = 0;
		nx = 0;
		zy = 0;
		ny = 0;
		f = 1;
		no = 0;
		#10;
		
		x = 16'h 0001;
		y = 16'h 0005;
		zx = 0;
		nx = 1;
		zy = 1;
		ny = 1;
		f = 1;
		no = 1;
		#10;
        
		// Add stimulus here
	x = 16'h 0001;
		y = 16'h 0005;
		zx = 1;
		nx = 0;
		zy = 1;
		ny = 0;
		f = 1;
		no = 0;
		#10;
	
	
	x = 16'h 0001;
		y = 16'h 0005;
		zx = 1;
		nx = 1;
		zy = 1;
		ny = 1;
		f = 1;
		no = 1;
		#10;
end
initial begin
$monitor ("x=%h, y=%h , out =%h" ,x,y,out);
end
      
endmodule

