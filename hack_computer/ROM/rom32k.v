`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:04:04 06/07/2025 
// Design Name: 
// Module Name:    rom32k 
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
module rom32k( input [14:0] address, input clk, output reg [15:0] out
    );
reg [15:0] mem [0:32767];

initial begin
	$readmemh("romvalues.hex",mem) ;
end

always @(posedge clk)
	out<= mem[address];

endmodule
