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
wire blink_clk;			//blink while on adjustment mode

//instantiate clock module
clock clk_ins(RESET, clk, clk_2hz, clk_1hz, fast_clk, blink_clk);



//debouncer
wire rst_db;
wire pause_db;

//instantiate debouncer module
debouncer pause_debouncer(.clk(clk), .fast_clk(fast_clk), .button(PAUSE), .bounce_state(pause_db));
debouncer rst_debouncer (.clk(clk), .fast_clk(fast_clk), .button(RESET), .bounce_state(rst_db));



//3 states: basic clock, adjusting minutes and adjusting seconds
parameter basic = 4'd0;
parameter adj_min = 4'd1;
parameter adj_sec = 4'd2;

reg [2:0] state;

//0 for no blink, 1 for blink min, 2 for blink sec
reg [2:0] blinking;

always @(*) begin
	if (ADJ & ~SEL) begin
		state = adj_min;
		blinking = 1;
	end
	else if (ADJ & SEL) begin
		state = adj_sec;
		blinking = 2;
	end
	else if (~ADJ) begin
		state = basic;
		blinking = 0;
	end
		
end



//pause 
reg ispaused;
always @(posedge pause_db) begin
	if (pause_db)
		ispaused <= 0;
	else 
		ispaused <= ~ispaused;
end



//minutes and seconds
wire [5:0] minutes;
wire [5:0] seconds;

wire [3:0] min_tens;	
wire [3:0] min_ones;	
wire [3:0] sec_tens;	
wire [3:0] sec_ones;	

//instantiate counter module	
counter ctr(RESET, ispaused, state, clk_1hz, clk_2hz, minutes, seconds);
	
assign min_tens = minutes/10;
assign min_ones = minutes - (min_tens * 10);
assign sec_tens = seconds/10;
assign sec_ones = seconds - (sec_tens * 10);	



//cathodes for AN3, AN2, AN1 and AN0
wire [6:0] cathode3;
wire [6:0] cathode2;
wire [6:0] cathode1;
wire [6:0] cathode0;

segments m10(.digit(min_tens), .cathode(cathode3));
segments m1(.digit(min_ones), .cathode(cathode2));
segments s10(.digit(sec_tens), .cathode(cathode1));
segments s1(.digit(sec_ones), .cathode(cathode0));

reg [1:0] digit_switch;

always @ (posedge fast_clk, posedge RESET) begin
	if (RESET)
		digit_switch <= 0;


	//Minute tens' place
	else if (digit_switch == 0) begin
		anode <= 4'b0111;
		cathode <= cathode3;
		
		if (blinking == 1 && blink_clk)
			anode <= 4'b1111;
		
		digit_switch <= digit_switch + 1;
	
	
	//Minute ones' place
	end else if (digit_switch == 1) begin
		anode <= 4'b1011;
		cathode <= cathode2;
		
		if (blinking == 1 && blink_clk)
			anode <= 4'b1111;		
		
		digit_switch <= digit_switch + 1;
	
	
	//Second tens' place
	end else if (digit_switch == 2) begin
		anode <= 4'b1101;
		cathode <= cathode1;
		
		if (blinking == 2 && blink_clk)
			anode <= 4'b1111;
			
		digit_switch <= digit_switch + 1;
	
	
	//Second ones' place
	end else if (digit_switch == 3) begin
		anode <= 4'b1110;
		cathode <= cathode0;

		if (blinking == 2 && blink_clk)
			anode <= 4'b1111;
			
		digit_switch <= 0;
	end
end 
		
endmodule
