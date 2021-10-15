`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:45:30 10/14/2021
// Design Name:   leading_0s_bits
// Module Name:   /home/ise/git152a/lab2/leading_0s_bits_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: leading_0s_bits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module leading_0s_bits_tb;

	// Inputs
	reg [11:0] D_abs;

	// Outputs
	wire [3:0] lz;
	wire [2:0] E;

	// Instantiate the Unit Under Test (UUT)
	leading_0s_bits uut (
		.D_abs(D_abs),  
		.lz(lz), 
		.E(E)
	);

	initial begin
		// Initialize Inputs
		D_abs = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		D_abs = 12'b000110100110;
		#100 $finish;
	end
      
endmodule

