`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:36:10 10/14/2021
// Design Name:   sign_mag
// Module Name:   /home/ise/git152a/lab2/sign_mag_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sign_mag
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sign_mag_tb;

	// Inputs
	reg [11:0] D;

	// Outputs
	wire [11:0] D_abs;

	// Instantiate the Unit Under Test (UUT)
	sign_mag uut (
		.D(D), 
		.D_abs(D_abs)
	);

	initial begin
		// Initialize Inputs
		D = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		D = 12'b111001011010;
		#100 $finish;
	end
      
endmodule

