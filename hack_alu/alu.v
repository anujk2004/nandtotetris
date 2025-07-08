`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:13:25 05/15/2025 
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
module alu(x,y,zx,nx,zy,ny,f,no,zr,ng,out
    );

input[15:0]x;
input[15:0]y;
input zx,nx,zy,ny,f,no;
output reg zr,ng;
output reg [15:0] out;


reg [15:0] x1,y1;

always @(*) begin
	
	

	if (zx == 1)
		x1 = 16'b0;
	else
		x1 = x;
		
	if (nx == 1)
		x1 = ~x1;
	else
		x1 = x;
		
		
	if (zy == 1)
		y1 =16'b0;
	else
		y1 = y;
		
		
	if (ny == 1)
		y1 = ~y1;
	else
		y1 = y;
		
	if (f == 1)
		out = x1 + y1;
	else
		out = x1 & y1;
		
	if (no == 1)
		out = ~out;
	//else
		//out= result;
		
	if (out == 0)
		zr = 1;
	else
		zr= 0;
		
	ng = out[15];
end
endmodule
