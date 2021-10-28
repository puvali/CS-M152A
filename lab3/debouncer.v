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
	input button, //input to be debounced
	output bounce_state //debounced switch/button
	);
	
	//addresses metastability
	//use 2 registers instead one to reduce the chance that button violate
	//setup and hold time
	//using 2 registers gives additional time for a potentially metstable
	//signal to resolve to a known value before the signal is used
	
	//also synchronizes the switch input to the clock
	reg sync_reg0;
	reg sync_reg1;
	
	reg [15:0] counter;
	
	always @ (posedge clk) begin
		sync_reg0 <= button;
	end
	
	always @ (posedge clk) begin
		sync_reg1 <= sync_reg0;
	end
	
	//debouncing
	always @ (posedge clk) begin
		//state has already been registered
		if(sync_reg1 == button_state)
			counter <= 0;
		//button has to hold its value for a certain amount of time before it's accepted
		else begin
			counter <= counter + 1'b1;
			if(counter == 16'hffff)
				bounce_state <= ~bounce_state;
		end
	end
	
endmodule
