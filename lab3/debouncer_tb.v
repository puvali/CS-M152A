`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:56:28 11/02/2021
// Design Name:   debouncer
// Module Name:   C:/PV/CS-M152A-main/lab3/debouncer_tb.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: debouncer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module debouncer_tb;

	// Inputs
	reg clk;
	reg button;

	// Outputs
	wire bounce_state;

	// Instantiate the Unit Under Test (UUT)
	debouncer uut (
		.clk(clk), 
		.button(button), 
		.bounce_state(bounce_state)
	);

 initial begin
  clk = 0;
  forever #10 clk = ~clk;
 end
 initial begin
  button = 0;
  #10;
  button=1;
  #20;
  button = 0;
  #10;
  button=1;
  #30; 
  button = 0;
  #10;
  button=1;
  #40;
  button = 0;
  #10;
  button=1;
  #30; 
  button = 0;
  #10;
  button=1; 
  #1000; 
  button = 0;
  #10;
  button=1;
  #20;
  button = 0;
  #10;
  button=1;
  #30; 
  button = 0;
  #10;
  button=1;
  #40;
  button = 0; 
 end 
      
endmodule

