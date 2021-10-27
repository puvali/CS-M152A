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
					  input PAUSE,
					  output reg [3:0] anode, 
					  output reg [6:0] cathode);

//divided clocks
wire clk_2hz;
wire clk_1hz;
wire fast_clk;				//to switch display digits 
wire blink_clk;

//instantiate clock module
clock clk_ins(RESET, clk, clk_2hz, clk_1hz, fast_clk, blink_clk);

reg [5:0] minutes;
reg [5:0] seconds;

wire [3:0] min_tens;	
wire [3:0] min_ones;	
wire [3:0] sec_tens;	
wire [3:0] sec_ones;	

//normal stopwatch counter  
always @ (posedge clk_1hz, posedge RESET) begin	
	if (RESET) begin
		seconds <= 0;
		minutes <= 0;
	end else if (seconds == 59) begin
		seconds <= 0;
		minutes <= minutes + 1;
	end else if (minutes == 59) begin
		seconds <= 0;
		minutes <= 0;
	end else begin
		seconds <= seconds + 1;
	end
end 	
	
assign min_tens = minutes/10;
assign min_ones = minutes - (min_tens * 10);
assign sec_tens = seconds/10;
assign sec_ones = seconds - (sec_tens * 10);	



//cathode circuit nodes CA CB CC CD CE CF CG for each segment
wire [6:0] cathode3;
wire [6:0] cathode2;
wire [6:0] cathode1;
wire [6:0] cathode0;

segments m10(.digit(min_tens), .cathode(cathode3));
segments m1(.digit(min_ones), .cathode(cathode2));
segments s10(.digit(sec_tens), .cathode(cathode1));
segments s1(.digit(sec_ones), .cathode(cathode0));

reg [1:0] digit_switch = 0;

always @ (posedge fast_clk) begin
	//Minute tens' place
	if (digit_switch == 0) begin
		anode <= 4'b0111;
		cathode <= cathode3;
		digit_switch <= digit_switch + 1;
	
	//Minute ones' place
	end else if (digit_switch == 1) begin
		anode <= 4'b1011;
		cathode <= cathode2;
		digit_switch <= digit_switch + 1;
	
	//Second tens' place
	end else if (digit_switch == 2) begin
		anode <= 4'b1101;
		cathode <= cathode1;
		digit_switch <= digit_switch + 1;
	
	//Second ones' place
	end else if (digit_switch == 3) begin
		anode <= 4'b1110;
		cathode <= cathode0;
		digit_switch <= 0;
	end
end 

endmodule
