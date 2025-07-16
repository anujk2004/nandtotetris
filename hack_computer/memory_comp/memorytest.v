`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:12:17 06/07/2025
// Design Name:   memory
// Module Name:   /home/ise/nand2tetrisw5/memorytest.v
// Project Name:  nand2tetrisw5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memorytest;

	// Inputs
	reg [15:0] in;
	reg [14:0] address;
	reg load;
	reg clk;

	// Outputs
	wire [15:0] out;
	reg[80:0] comp;
	// Instantiate the Unit Under Test (UUT)
	memory uut (
		.in(in), 
		.address(address), 
		.load(load), 
		.clk(clk), 
		.out(out)
	);

		
	initial begin 
	clk =0;
	forever #5clk = ~clk;
	end
	initial begin
		// Initialize Inputs
		in = 16'hff;
		address = 15'h00ff;
		load = 0;
		#10;
		#10;
		in = 16'hff;
		address = 15'h00ff;
		load = 1;
		#10;
		#10;
		in = 16'hffff;
		address = 15'h50ff;
		load = 1;
		#10;
		#10;
		in = 16'hff12;
		address = 15'h6000;
		load = 1;
		#10;
		#10;
		in = 16'hff12;
		address = 15'h7000;
		load = 1;
		#10;
		
	#10;
        #10;
		  in = 16'hff12;
		address = 15'h70f0;
		load = 1;
		#10;
		// Add stimulus here

	end
	
	always @(*) begin
    case(address[14:13])
        2'b00: comp ="ram";
        2'b01: comp ="ram";
		   2'b10: comp ="screen";
        2'b11:begin
		  if (address[14:0] == 15'h6000)begin
		  comp = "keyboard";
		  end
		  else begin
		  comp="rest_spce";
		  end
		  end
        default: comp = "rest_space";
    endcase
end

	initial begin
     $monitor("time:%t , in:%h , address:%h,out:%h  comp:%s" ,$time,in,address,out,comp); 
	  end
endmodule

