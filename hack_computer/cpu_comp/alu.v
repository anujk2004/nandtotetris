`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:07 06/06/2025 
// Design Name: 
// Module Name:    alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu(input [15:0] x , input [15:0] y, input zx, nx,zy,ny,f,no, output reg [15:0] out, output reg zr,ng
    );

reg [15:0] x1 ;
reg [15:0] y1;
always @(*) begin
	ng = out[15];
	if (zx ==1)
		x1=16'b0;
	else 
		x1 = x;
	
if (nx ==1)
	x1= ~x1;
	
	
	if (zy ==1)
		y1=16'b0;
	else 
		y1=y;
	
	if (ny ==1)
		y1=~y1;
		
	if (f==1)
		out = x1+y1;
	else 
		out = x1&y1;
		
	if (no ==1)
		out = ~out;
		
	if (out ==0)
		zr =1;
	else 
		zr =0;
	
	
	
end	
endmodule
