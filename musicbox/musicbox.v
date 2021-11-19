`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:00:29 11/18/2021 
// Design Name: 
// Module Name:    musicbox 
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
module musicbox(input clk,			//100 MHz 
					 output j0, 		//PMOD AMP2 Pin 1: Audio Input
					 output j1, 		//PMOD AMP2 Pin 2: Gain Selection
					 output j3,			//PMOD AMP2 Pin 4: Active Low Shutdown
					 output rst, 
					 output pp,			//Play/pause switch
					 output next);		//Next song

parameter clkf = 100_000_000;
reg speaker;

reg [11:0] clkdv;
reg [11:0] note_ctr;
reg [7:0] octave_ctr;

reg [33:0] tone;
always @(posedge clk)
	tone = tone + 1;
	
wire [7:0] hedwignote;
hedwig_rom hwrom(.clk(clk), .bits(tone[32:27]), .fullnote(hedwignote));

wire [7:0] fullnote;
always @(posedge clk)
	fullnote = hedwignote;

wire [2:0] octave;
wire [3:0] note;

divideby12 div(.numerator(fullnote[6:0], .quotient(octave), .remainder(note));

always @ (note) begin
	case(note)
		0: clkdv = clkf / 512 / 110 - 1;		//A
		1: clkdv = clkf / 512 / 117 - 1;		//Bb
		2: clkdv = clkf / 512 / 123 - 1;		//B
		3: clkdv = clkf / 512 / 131 - 1;		//C
		4: clkdv = clkf / 512 / 139 - 1;		//Db
		5: clkdv = clkf / 512 / 147 - 1;		//D
		6: clkdv = clkf / 512 / 156 - 1;		//Eb
		7: clkdv = clkf / 512 / 165 - 1;		//E
		8: clkdv = clkf / 512 / 175 - 1;		//F
		9: clkdv = clkf / 512 / 185 - 1;		//Gb
		10: clkdv = clkf / 512 / 196 - 1;	//G
		11: clkdv = clkf / 512 / 208 - 1;	//Ab
		default: clkdv = 0;
	endcase 
end

always @(posedge clk) begin
	if (note_ctr == 0)
		note_ctr = clkdv;
	else
		note_ctr = note_ctr - 1;
end 

always @(posedge

		
		
		

endmodule
