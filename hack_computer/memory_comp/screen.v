`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:01:34 06/07/2025 
// Design Name: 
// Module Name:    screen 
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
module screen( input  [15:0] in , input  [12:0] address, input  load, clk, output reg [15:0] out
    );
reg [15:0] mem [0:8191];
	always @(posedge clk) begin
		
		if (load ==1) begin
			mem[address] <= in;
			out <= in;
		end
		else begin
		out <= mem[address];
		end
	end
	

endmodule
