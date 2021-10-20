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

output S;					//Sign: 0 or 1
output wire [2:0] E;		//Exponent: 0-7
output wire [3:0] F;		//Significand: 0-15

//for testing
wire [11:0] V;				//V = (-1)^S * F * 2^E

//intermediate variables
wire [11:0] D_abs;		//magnitude of D
wire [3:0] lz;				//# of leading zeroes: 0-12
wire [2:0] raw_E;			//before rounding
wire [3:0] raw_F;			//before rounding
wire rndg_bit;				//0 -> round down, 1 -> round up

//2's complement to sign-magnitude
assign S = D[11];
sign_mag sm(D, D_abs);

//Leading zeroes and bits
leading_0s_bits lzb(D_abs, lz, raw_E, raw_F, rndg_bit);

//Rounding
rounding rndg(raw_E, raw_F, rndg_bit, E, F);

assign V = (-1)**S * F * 2**E;

endmodule





module sign_mag(D, D_abs);

input [11:0] D;
output reg [11:0] D_abs;

always @* begin
	//if largest negative number, set magnitude to largest positive number
	if (D == -12'd2048) 
		D_abs = 12'd2047; 
	else if(D[11] == 1'b1) 
		//2's complement inversion
		D_abs = ~D + 1;
	else 
		D_abs = D;
end
endmodule





module leading_0s_bits(D_abs, lz, raw_E, raw_F, rndg_bit);

input [11:0] D_abs;

output reg [3:0] lz;
output reg [2:0] raw_E;
output reg [3:0] raw_F;
output reg rndg_bit;

reg [3:0] i;

always @* begin
	
	i = 4'd11;
	while (D_abs[i] != 1) begin
		i = i - 1;
	end 
	lz = 4'd11 - i;
	
	//set Exponent depending on # of leading zeroes
	case(lz)
		4'd1: raw_E = 3'd7;
		4'd2: raw_E = 3'd6;
		4'd3: raw_E = 3'd5;
		4'd4: raw_E = 3'd4;
		4'd5: raw_E = 3'd3;
		4'd6: raw_E = 3'd2;
		4'd7: raw_E = 3'd1;
		default: raw_E = 0;
	endcase
	
	//1-7 leading zeroes --> Significand is 4 leading bits and rounding bit is 5th leading bit
	if(lz >= 4'd1 && lz < 4'd8) begin
		raw_F[3] = D_abs[i];
		raw_F[2] = D_abs[i-1];
		raw_F[1] = D_abs[i-2];
		raw_F[0] = D_abs[i-3];
		rndg_bit = D_abs[i-4];
	end
	
	//8 leading zeroes --> Significand is 4 leading bits and rounding bit is 0
	else if (lz == 4'd8) begin
		raw_F[3] = D_abs[i];
		raw_F[2] = D_abs[i-1];
		raw_F[1] = D_abs[i-2];
		raw_F[0] = D_abs[i-3];	
		rndg_bit = 1'b0;
	end
	
	//9-12 leading zeroes --> Significand is 4 least significant bits and rounding bit is 0
	else begin
		raw_F[3] = D_abs[3];
		raw_F[2] = D_abs[2];
		raw_F[1] = D_abs[1];
		raw_F[0] = D_abs[0];
		rndg_bit = 1'b0;
	end
	
end 	
endmodule





module rounding(raw_E, raw_F, rndg_bit, E, F);

input [2:0] raw_E;
input [3:0] raw_F;
input rndg_bit; 

output reg [2:0] E;
output reg [3:0] F;

always @* begin
	//case 1: rounding down  
	if(rndg_bit == 0) begin
		F = raw_F;
		E = raw_E;
	end
	
	else begin
		
		//case 2: overflow when rounding up
		if(raw_F[0] & raw_F[1] & raw_F[2] & raw_F[3]) begin 	//when raw_F = 1111
			
			//case 2a: if E < 7 --> increment E 
			if(raw_E < 3'd7) begin
				F = 4'b1000;
				E = raw_E + 1;
			end
			
			//case 2b: if E is 7 set to largest FP representation
			else begin
				F = raw_F;		//1111 = 15
				E = raw_E;		//111 = 7
			end
		
		end //end case 2 if
		
		//case 3: no overflow when rounding up
		else begin
			F = raw_F + 1;
			E = raw_E;
		end
		
	end
end //end always
endmodule



