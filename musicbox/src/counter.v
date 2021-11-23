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
					input ss, 						//switch songs
					input ispaused,
					input clk_1hz,
					output reg [5:0] minutes,
					output reg [5:0] seconds);

always @(posedge ss, negedge ss) begin
	seconds = 0;
	minutes = 0;
end

always @(posedge clk_1hz, posedge RESET) begin
	if (RESET) begin
		seconds = 0;
		minutes = 0;
	end
	
	else if (ispaused) begin
		seconds = seconds;
		minutes = minutes;
	end
	
	else begin 
		if (minutes == 59 && seconds == 59) begin
			seconds = 0;
			minutes = 0;
		end else if (seconds == 59) begin
			seconds = 0;
			minutes = minutes + 1;
		end else begin
			seconds = seconds + 1;
		end
	end 		
end

endmodule
