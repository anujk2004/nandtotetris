`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:13:47 06/07/2025 
// Design Name: 
// Module Name:    keyboard 
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
module keyboard( input clk, output reg [15:0] out
    );
	 reg[15:0] keypress;
	 initial begin
	 keypress = 16'd65;
	 end
	 
	always@(posedge clk) begin
		out <=keypress;
	end
	

		
endmodule
