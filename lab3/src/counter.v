`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:32:58 10/27/2021 
// Design Name: 
// Module Name:    counter 
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
//////////////////////////////////////////////////////////////////////////////////
module counter(input RESET,
					input ispaused,
					input [2:0] state,
					input clk_1hz,
					input clk_2hz,
					output reg [5:0] minutes,
					output reg [5:0] seconds);

parameter basic = 4'd0;
parameter adj_min = 4'd1;
parameter adj_sec = 4'd2;

//pick 1 Hz clock for basic counter and 2 Hz clock for adjustment mode

reg state_clk;

always @(*) begin
	if (state == adj_min || state == adj_sec)
		state_clk <= clk_2hz;
	else 
		state_clk <= clk_1hz;
end

always @(posedge state_clk, posedge RESET) begin
	if (RESET) begin
		seconds <= 0;
		minutes <= 0;
	end
	
	else if (ispaused) begin
		seconds <= seconds;
		minutes <= minutes;
	end
	
	//basic: count mins and secs normally at 1 Hz
	else if(state == basic) begin
		if (seconds == 59) begin
			seconds <= 0;
			minutes <= minutes + 1;
		end 
		if (minutes == 59 && seconds == 59) begin
			seconds <= 0;
			minutes <= 0;
		end else begin
			seconds <= seconds + 1;
		end
	end 
	
	//adj_min: freeze secs and count mins at 2 Hz
	else if(state == adj_min) begin
		if (minutes == 59) begin
			minutes <= 0;
		end else begin
			minutes <= minutes + 1;
		end
	end 
	
	//adj_sec: freeze mins and count secs at 2 Hz
	else if(state == adj_sec) begin
		if (seconds == 59) begin
			seconds <= 0;
		end else begin
			seconds <= seconds + 1;
		end
	end		
	
end

endmodule
