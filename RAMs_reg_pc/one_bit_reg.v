`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:49 05/16/2025 
// Design Name: 
// Module Name:    one_bit_reg 
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
module one_bit_reg( input in, load, clk ,output reg out
    );





always @(posedge clk) begin

	if (load==1)
		out<=in;
	
end
endmodule
