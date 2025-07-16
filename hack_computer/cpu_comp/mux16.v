`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:52 06/06/2025 
// Design Name: 
// Module Name:    mux16 
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
module mux16( input [15:0] in1 , input [15:0] in2 , input  sel , output reg [15:0] out
    );
always @(*) begin
  if (sel == 0 )
		out = in1;
	else 
	out = in2;
end
endmodule
