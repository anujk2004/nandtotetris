`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:41:25 05/16/2025 
// Design Name: 
// Module Name:    sixteen_bit_reg 
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
module sixteen_bit_reg(input [15:0] in, input load, clk ,output reg [15:0] out
    );

always @(posedge clk) begin

	if (load==1)
		out[15:0]<=in[15:0];
	
end
endmodule
