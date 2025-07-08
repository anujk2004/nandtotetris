`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:41:55 05/14/2025 
// Design Name: 
// Module Name:    dmux 
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
module dmux(in,out,sel
    );

input  in;
input [1:0] sel;
output reg [3:0] out;

always@(*) begin
out = 4'b0000;
out [sel] = in;

end

endmodule
