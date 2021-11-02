`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:03:42 10/28/2021 
// Design Name: 
// Module Name:    debouncer 
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
/////////////////////////////////////////////////////////////////////////////////

module debouncer(
	input clk, 
	input fast_clk,
	input button, //input to be debounced
	output bounce_state //debounced switch/button
	);
	
	//addresses metastability
	//use 2 registers instead one to reduce the chance that button violate
	//setup and hold time
	//using 2 registers gives additional time for a potentially metstable
	//signal to resolve to a known value before the signal is used
	
	//also synchronizes the switch input to the clock
	wire Q0, Q1, Q2;
	
	dff d0(fast_clk, button, Q0);
	dff d1(fast_clk, Q0, Q1);
	dff d2(fast_clk, Q1, Q2);
	
	assign bounce_state = Q1 & ~Q2;
	
endmodule



module dff(input fast_clk,
			  input D,
			  output reg Q);
always @ (posedge fast_clk) begin 
	Q <= D;
end
endmodule

