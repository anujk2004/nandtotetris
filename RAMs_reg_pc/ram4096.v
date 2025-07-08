`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:27 05/27/2025 
// Design Name: 
// Module Name:    ram4096 
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
module ram4096(input [15:0] in , input load, clk, input [11:0] address, output reg [15:0] out
    );
 reg [15:0] mem [0:4095]; // 4096 x 16-bit memory

    always @(posedge clk) begin
      if (load == 1) begin
        mem[address] <= in;
        out <= in; 
		  end
		 else begin
		  out <= mem[address];
		  end
    end
endmodule
