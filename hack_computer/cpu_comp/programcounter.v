`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:12 06/06/2025 
// Design Name: 
// Module Name:    programcounter 
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
module programcounter( input [14:0] in , input load, clk, reset , output reg[14:0] out
    );
	 
always @(posedge clk) begin
	if(reset ==1)
		out <= 0;
	else if (load == 1)
		out <= in;
	
	else 
		out <= out + 15'h0001;
	end
	

endmodule
