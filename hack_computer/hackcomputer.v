`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:20:57 06/07/2025 
// Design Name: 
// Module Name:    hackcomputer 
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
module hackcomputer(input reset ,clk , output [15:0]screen_output, output [15:0] keyboard_out
    );
wire [14:0] cpupc;
wire [15:0] cpuinstruction ;
wire [15:0] memout;
wire writeload;
wire [14:0] memaddress;
wire [15:0] meminstruction;

rom32k rom(.address(cpupc), .out(cpuinstruction) );
cpu cp(.instr(cpuinstruction), .inM(memout), .reset(reset), .clk(clk), .writeM(writeload) , .pc(cpupc) ,.addressM(memaddress), .outM(meminstruction));
memory mem(.in(meminstruction), .address(memaddress), .load(writeload), .clk(clk), .out(memout));

assign screen_output = memout;
assign keyboard_out = memout;
endmodule
