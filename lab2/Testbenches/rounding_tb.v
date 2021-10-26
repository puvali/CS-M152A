`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:46:17 10/19/2021
// Design Name:   rounding
// Module Name:   /home/ise/git152a/lab2/rounding_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rounding
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rounding_tb;

	// Inputs
	reg [2:0] raw_E;
	reg [3:0] raw_F;
	reg rndg_bit;

	// Outputs
	wire [2:0] E;
	wire [3:0] F;

	// Instantiate the Unit Under Test (UUT)
	rounding uut (
		.raw_E(raw_E),
		.raw_F(raw_F), 
		.rndg_bit(rndg_bit),
		.E(E),
		.F(F)
	);

	initial begin
		// Initialize Inputs
		raw_E = 0;
		raw_F = 0;
		rndg_bit = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		raw_E = 2;
		raw_F = 4'b1011;
		rndg_bit = 1; 
		
		#100;
		
		raw_E = 3;
		raw_F = 4'b1111;
		rndg_bit = 1;
		
		#100 $finish;
	end
      
endmodule

