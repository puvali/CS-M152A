`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:33:01 10/14/2021
// Design Name:   FPCVT
// Module Name:   /home/ise/git152a/lab2/FPCVT_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FPCVT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FPCVT_tb;

	//Inputs
	reg [11:0] D;
	
	// Outputs
	wire [11:0] D_abs;
	wire [3:0] i;
	wire [3:0] lz;
	wire [2:0] E;
	

	// Instantiate the Unit Under Test (UUT)
	FPCVT uut (
		.D(D), 
		.E(E),
		.D_abs(D_abs),
		.i(i),
		.lz(lz)
	);

	initial begin
		// Initialize Inputs
		D = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 D = 12'b111001011010;
		#10 $finish;

	end
      
endmodule

