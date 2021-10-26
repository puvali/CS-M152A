`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:11:44 10/26/2021 
// Design Name: 
// Module Name:    stopwatch 
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
module stopwatch(input clk, 
					  input SEL, 
					  input ADJ, 
					  input RESET, 
					  input PAUSE);

reg [5:0] seconds;
reg [5:0] minutes;

always @(posedge clk, posedge RESET) begin
	if (RESET) begin
		seconds <= 0;
		minutes <= 0;
	end else if (seconds == 59) begin
		seconds <= 0;
		minutes <= minutes + 1;
	end else if (minutes == 59) begin
		seconds <= 0;
		minutes <= 0;
	end else 
		seconds = seconds + 1;
end

endmodule
