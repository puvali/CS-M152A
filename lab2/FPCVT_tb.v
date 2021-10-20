`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:53:47 10/19/2021
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

	// Inputs
	reg [11:0] D;

	// Outputs
	wire S;
	wire [2:0] E;
	wire [3:0] F;

	// Instantiate the Unit Under Test (UUT)
	FPCVT uut (
		.D(D), 
		.S(S), 
		.E(E), 
		.F(F)
	);

	initial begin
		// Initialize Inputs
		D = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		D = 12'b0001_1010_0110;		//422 --> 416
		#100;
		
		D = 12'b1110_0101_1010; 	//-422 --> -416
		#100;
		
		D = 12'b0000_0010_1101;		//45 --> 44
		#100;
		
		D = 12'b1111_1101_0011;		//-45 --> -44
		#100;
		
		D = 12'b0000_0010_1110;		//46 --> 48
		#100;
		
		D = 12'b1111_1101_0010;		//-46 --> -48
		#100;
		
		D = 12'b0000_0111_1101;		//125 --> 128
		#100;
		
		D = 12'b0111_1111_1111;		//2047 --> 1920
		#100;
		
		D = 12'b1000_0000_0001;		//-2047 --> -1920
		#100;
		
		D = 12'b1000_0000_0000;		//-2048 --> -1920	
		
		#100 $finish;

	end
      
endmodule

