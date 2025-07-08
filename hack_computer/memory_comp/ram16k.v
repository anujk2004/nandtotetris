`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:05 06/06/2025 
// Design Name: 
// Module Name:    ram16k 
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
module ram16k( input [15:0] in , input load , clk, input [13:0] address , output reg [15:0] out
    );
reg [15:0] mem [0:16383];

	always @(posedge clk) begin
		
		if (load ==1) begin
			mem[address] <= in ;
			out <= in;
		end
		else begin
		out <= mem[address];
		end
		end
endmodule
