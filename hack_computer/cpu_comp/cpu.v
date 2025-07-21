`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:08:58 06/06/2025 
// Design Name: 
// Module Name:    cpu 
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
module cpu( input [15:0] instr, input [15:0] inM, input reset ,clk, output writeM, output[14:0] pc, output [14:0] addressM , output [15:0] outM
    );
wire [15:0] mux1_out;
wire [15:0] Areg_out;
wire [15:0] mux2_out;
wire [15:0] Dreg_out;
wire zr,ng;
reg loadpc;

always @(*)begin
	case (instr[2:0])
		3'b000: loadpc =0;
		3'b001: loadpc =(ng==0 && zr==1);
		3'b010: loadpc =(zr==1);
		3'b011: loadpc =(zr==1 || ng==0);
		3'b100: loadpc =(ng==1);
		3'b101: loadpc =(zr==0);
		3'b110: loadpc =(zr == 1 || ng == 1);
		3'b111: loadpc =1;
	endcase
end

mux16 mux1(.in1(instr) , .in2(outM), .sel(instr[15]), .out(mux1_out));
reg16 Areg(.in(mux1_out) , .load(~instr[15]|instr[5]) , .clk(clk) ,.out(Areg_out) );
mux16 mux2(.in1(Areg_out), .in2(inM), .sel(instr[12]), .out(mux2_out));
reg16 Dreg (.in(outM) , .load(instr[4]), .clk(clk),  .out(Dreg_out));
alu  alu(.x(Dreg_out), .y(mux2_out) ,.zx(instr[11]) ,.nx(instr[10]) ,.zy(instr[9]) ,.ny(instr[8]) ,.f(instr[7]) ,.no(instr[6]) ,.out(outM), .zr(zr),.ng(ng) );
assign writeM = (instr[15]&instr[3]);
programcounter  pc1(.in(Areg_out[14:0]), .load(loadpc),.clk(clk) ,.reset(reset), .out(pc));

assign addressM = Areg_out[14:0];
	


endmodule
