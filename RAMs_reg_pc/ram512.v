`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:37:47 05/27/2025 
// Design Name: 
// Module Name:    ram512 
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
module ram512(input [15:0] in , input load, clk, input [8:0] address, output [15:0] out
    );
wire [15:0] outs[63:0];
wire [63:0] load_sel;

assign load_sel = load  ? (64'b1 << address[8:3]) : 64'b0;

genvar i;
generate 
	for (i =0; i<64; i=i+1) begin : blocks
		eight_regiser_RAM block ( .in(in), .load(load_sel[i]) , .clk(clk), .address(address[2:0]),.out(outs[i]));
	end
endgenerate

assign out = outs[address[8:3]];



endmodule

