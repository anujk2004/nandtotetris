`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:56:09 06/07/2025 
// Design Name: 
// Module Name:    memory 
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
module memory(input [15:0] in , input [14:0] address , input load ,clk, output reg[15:0] out
    );
wire [15:0] ramout;
wire [15:0] screenout;
wire [15:0] keyboardout;

always @(*) begin
	case(address[14:13])
		2'b00 : out = ramout;
		2'b01 : out =screenout;
		2'b11 : out =keyboardout;
		default : out = 16'b0;
	endcase
end

ram16k ram(.in(in) ,.load((address[14:13] == 2'b00) ? load :1'b0), .clk(clk), .address(address[13:0]),.out(ramout) );
screen sc(.in(in) , .address(address[12:0]), .load((address[14:13] ==2'b01) ? load: 1'b0), .clk(clk), .out(screenout));
keyboard kb(.out(keyboardout));

endmodule
