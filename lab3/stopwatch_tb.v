`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:42:09 10/26/2021
// Design Name:   stopwatch
// Module Name:   /home/ise/git152a/lab3/stopwatch_tb.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: stopwatch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module stopwatch_tb;

	// Inputs
	reg clk;
	reg SEL;
	reg ADJ;
	reg RESET;
	reg PAUSE;

	// Instantiate the Unit Under Test (UUT)
	stopwatch uut (
		.clk(clk), 
		.SEL(SEL), 
		.ADJ(ADJ), 
		.RESET(RESET), 
		.PAUSE(PAUSE)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		SEL = 0;
		ADJ = 0;
		RESET = 0;
		PAUSE = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		RESET = 1;
		#10;
		RESET = 0;
		
		//100 MHz testbench clock
		repeat(1000) #5 clk = ~clk;

	end
      
endmodule

