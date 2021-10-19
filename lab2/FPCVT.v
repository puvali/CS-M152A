`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:20:50 10/14/2021 
// Design Name: 
// Module Name:    FPCVT 
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

module FPCVT(D, S, E, F);
input [11:0] D;			//Data
output S;			//Sign 
output reg [2:0] E;		//Exponent
output reg [3:0] F;		//Significand

//2's complement to sign-magnitude
wire [11:0] D_abs;
assign S = D[11];
sign_mag sm(D, D_abs);

//Leading zeroes
wire [3:0] i, lz;
leading_0s_bits lzb(D_abs, lz, E, F, rounding_bit);


	
endmodule



module sign_mag(D, D_abs);
input [11:0] D;
output reg [11:0] D_abs;
always @* begin
	if (D == -12'd2048) 
		D_abs = 12'd2047; 
	else if(D[11] == 1'b1) 
		D_abs = ~D + 1;
	else 
		D_abs = D;
end
endmodule



module leading_0s_bits(D_abs, lz, E, F, rndg_bit);
input [11:0] D_abs;
reg [7:0] i;
output reg [7:0] lz;
output reg [2:0] E;
output reg [3:0] F;
output reg rndg_bit;
always @* begin
	/*
	//if all zeroes, lz is never assigned in for loop so do it here
	lz = 4'd12;
	for(i = 4'd11; i >= 0; i = i - 1) begin
		if(D_abs[i] == 1) begin
			lz = 4'd11 - i;
			i = -1;
		end
	end*/
	
	i = 8'd11;
	while (D_abs[i] != 1) begin
		i = i - 1;
	end //end while
	lz = 8'd11 - i;
	
	case(lz)
		8'd1: E = 3'd7;
		8'd2: E = 3'd6;
		8'd3: E = 3'd5;
		8'd4: E = 3'd4;
		8'd5: E = 3'd3;
		8'd6: E = 3'd2;
		8'd7: E = 3'd1;
		default: E = 0;
	endcase
	
	//to find F
	if(lz >= 8'd1 && lz < 8'd8) begin
		F[3] = D_abs[i];
		F[2] = D_abs[i-1];
		F[1] = D_abs[i-2];
		F[0] = D_abs[i-3];
		rndg_bit = D_abs[i-4];
	end else if (lz == 8'd8) begin
		F[3] = D_abs[i];
		F[2] = D_abs[i-1];
		F[1] = D_abs[i-2];
		F[0] = D_abs[i-3];	
		rndg_bit = 1'b0;
	end else begin
		F[3] = D_abs[3];
		F[2] = D_abs[2];
		F[1] = D_abs[1];
		F[0] = D_abs[0];
		rndg_bit = 1'b0;
	end
end 	
endmodule




