`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:05:34 06/06/2025 
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
module ram16k( input [15:0] in, input load , clk , output  reg [15:0] out , input [13:0] address 
    );
reg [15:0] mem [0:16383];

always @(posedge clk) begin
	if (load ==1)
	mem[address] <= in;
	out <= mem[address];
	end

endmodule
