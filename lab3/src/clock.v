`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:27:12 10/26/2021 
// Design Name: 
// Module Name:    clock 
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
module clock(input RESET,
				 input clk, 					//100 MHz
				 output reg clk_2hz, 		//2 Hz
				 output reg clk_1hz, 		//1 Hz
				 output reg fast_clk, 		//100 Hz
				 output reg blink_clk);		//1.25 Hz


//2 Hz clock
reg [25:0] ctr2 = 0;
parameter dv2 = 26'd25_000_000;
//parameter dv2 = 27'd25;		//2 MHz


//1 Hz clock
reg [25:0] ctr1 = 0;
parameter dv1 = 26'd50_000_000;
//parameter dv1 = 27'd50;		//1 MHz


//Fast clock
reg [25:0] ctrf = 0;
parameter dvf = 26'd100_000;
//parameter dvf = 27'd2;


//Blinking clock
reg [25:0] ctrb = 0;
parameter dvb = 26'd40_000_000;



//100 MHz -> 2 Hz
always @(posedge clk, posedge RESET) begin
	if (RESET) begin
		ctr2 <= 0;
		clk_2hz <= 0;
	end else if (ctr2 == dv2 - 1) begin
		ctr2 <= 0;
		clk_2hz <= ~clk_2hz;
	end else begin
		ctr2 <= ctr2 + 1;
		clk_2hz <= clk_2hz;
	end 
end

//100 MHz -> 1 Hz
always @(posedge clk, posedge RESET) begin
	if (RESET) begin
		ctr1 <= 0;
		clk_1hz <= 0;
	end else if (ctr1 == dv1 - 1) begin
		ctr1 <= 0;
		clk_1hz <= ~clk_1hz;
	end else begin
		ctr1 <= ctr1 + 1;
		clk_1hz <= clk_1hz;
	end 
end

//100 Mhz -> fast clock
always @(posedge clk, posedge RESET) begin
	if (RESET) begin
		ctrf <= 0;
		fast_clk <= 0;
	end else if (ctrf == dvf - 1) begin
		ctrf <= 0;
		fast_clk <= ~fast_clk;
	end else begin
		ctrf <= ctrf + 1;
		fast_clk <= fast_clk;
	end 
end

//100 MHz -> blinking clock
always @(posedge clk, posedge RESET) begin
	if (RESET) begin
		ctrb <= 0;
		blink_clk <= 0;
	end else if (ctrb == dvb - 1) begin
		ctrb <= 0;
		blink_clk <= ~blink_clk;
	end else begin
		ctrb <= ctrb + 1;
		blink_clk <= blink_clk;
	end 
end

endmodule

