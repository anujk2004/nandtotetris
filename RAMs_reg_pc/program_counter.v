`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:40:33 05/29/2025 
// Design Name: 
// Module Name:    program_counter 
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
module program_counter( input [15:0] in , input load , inc , reset, clk, output reg [15:0] out
    );

always @(posedge clk) begin

	if (reset ==1)
			out <= 16'b00;
	
	else if (load==1)
			out<=in;
		
	else if (inc ==1)
			out <= out + 16'h0001;
	
	
end
endmodule
