`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:45:08 05/16/2025 
// Design Name: 
// Module Name:    eight_regiser_RAM 
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
module eight_regiser_RAM(input [15:0] in,input load ,input clk,input [2:0] address, output reg [15:0] out
    );
	 


wire [15:0] outs[7:0];
reg [7:0] load_sel;
always @(*) begin
if (load==1)
		case(address)
		3'd0: load_sel = 8'b00000001;
		3'd1: load_sel = 8'b00000010;
		3'd2: load_sel = 8'b00000100;
		3'd3: load_sel = 8'b00001000;
		3'd4: load_sel = 8'b00010000;
		3'd5: load_sel = 8'b00100000;
		3'd6: load_sel = 8'b01000000;
		3'd7: load_sel = 8'b10000000;
		endcase
else
load_sel= 8'b00000000;
end
sbr sbr0(.in(in[15:0]),.load(load_sel[0]),.clk(clk),.out(outs[0]));
sbr sbr1(.in(in[15:0]),.load(load_sel[1]),.clk(clk),.out(outs[1]));
sbr sbr2(.in(in[15:0]),.load(load_sel[2]),.clk(clk),.out(outs[2]));
sbr sbr3(.in(in[15:0]),.load(load_sel[3]),.clk(clk),.out(outs[3]));
sbr sbr4(.in(in[15:0]),.load(load_sel[4]),.clk(clk),.out(outs[4]));
sbr sbr5(.in(in[15:0]),.load(load_sel[5]),.clk(clk),.out(outs[5]));
sbr sbr6(.in(in[15:0]),.load(load_sel[6]),.clk(clk),.out(outs[6]));
sbr sbr7(.in(in[15:0]),.load(load_sel[7]),.clk(clk),.out(outs[7]));


always @(*) begin

		out=outs[address];
end

endmodule
