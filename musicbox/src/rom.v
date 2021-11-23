`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:17:13 11/23/2021 
// Design Name: 
// Module Name:    rom 
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

module ROM1(
	input clk,
	input [7:0] address,
	output reg [7:0] note
);

always @(posedge clk)
case(address)
    0:note <= 34;
    1:note <= 34;
    2:note <= 39;
    3:note <= 39;
    4:note <= 39;
    5:note <= 41; 
    6:note <= 41;
    7:note <= 41;
    8:note <= 41;
    9:note <= 39;
    10:note <= 39;
    11:note <= 39;
    12:note <= 39;
    13:note <= 46;
    14:note <= 46;
    15:note <= 44;
    16:note <= 44;
    17:note <= 44;
    18:note <= 44;
    19:note <= 44;
    20:note <= 44;
    21:note <= 41;
    22:note <= 41;
    23:note <= 41;
    24:note <= 41;
    25:note <= 41;
    26:note <= 41;
    27:note <= 39;
    28:note <= 39;
    29:note <= 39;
    30:note <= 42;
    31:note <= 41;
    32:note <= 41;
    33:note <= 41;
    34:note <= 41;
    35:note <= 38;
    36:note <= 38;
    37:note <= 38;
    38:note <= 38;
    39:note <= 40;
    40:note <= 40;
    41:note <= 34;
    42:note <= 34;
    43:note <= 34;
    44:note <= 34;
    45:note <= 34;
    46:note <= 34;
    47:note <= 34;
    48:note <= 34;
    49:note <= 34;
    50:note <= 34;
    51:note <= 0;
    52:note <= 34;
    53:note <= 34;
    54:note <= 39;
    55:note <= 39;
    56:note <= 39;
    57:note <= 42;
    58:note <= 41;
    59:note <= 41;
    60:note <= 41;
    61:note <= 41;
    62:note <= 39;
    63:note <= 39;
    64:note <= 39;
    65:note <= 39;
    66:note <= 46;
    67:note <= 46;
    68:note <= 49;
    69:note <= 49;
    70:note <= 49;
    71:note <= 49;
    72:note <= 48;
    73:note <= 48;
    74:note <= 47;
    75:note <= 47;
    76:note <= 47;
    77:note <= 47;
    78:note <= 43;
    79:note <= 43;
    80:note <= 47;
    81:note <= 47;
    82:note <= 47;
    83:note <= 46;
    84:note <= 45;
    85:note <= 45;
    86:note <= 33;
    87:note <= 33;
    88:note <= 33;
    89:note <= 33;
    90:note <= 42;
    91:note <= 42;
    92:note <= 39;
    93:note <= 39;
    94:note <= 39;
    95:note <= 39;
    96:note <= 39;
    97:note <= 39;
    98:note <= 39;
    99:note <= 39;
    100:note <= 39;
    101:note <= 39;
    102:note <= 42;
    103:note <= 42;
    104:note <= 46;
    105:note <= 46;
    106:note <= 46;
    107:note <= 46;
    108:note <= 42;
    109:note <= 42;
    110:note <= 46;
    111:note <= 46;
    112:note <= 46;
    113:note <= 46;
    114:note <= 42;
    115:note <= 42;
    116:note <= 47;
    117:note <= 47;
    118:note <= 47;
    119:note <= 47;
    120:note <= 46;
    121:note <= 46;
    122:note <= 45;
    123:note <= 45;
    124:note <= 45;
    125:note <= 45;
    126:note <= 41;
    127:note <= 41;
    128:note <= 42;
    129:note <= 42;
    130:note <= 46;
    131:note <= 45;
    132:note <= 45;
    133:note <= 33;
    134:note <= 33;
    135:note <= 33;
    136:note <= 33;
    137:note <= 34;
    138:note <= 34;
    139:note <= 46;
    140:note <= 46;
    141:note <= 46;
    142:note <= 46;
    143:note <= 46;
    144:note <= 46;
    145:note <= 46;
    146:note <= 46;
    147:note <= 46;
    148:note <= 46;
    149:note <= 42;
    150:note <= 42;
    151:note <= 46;
    152:note <= 46;
    153:note <= 46;
    154:note <= 46;
    155:note <= 42;
    156:note <= 42;
    157:note <= 46;
    158:note <= 46;
    159:note <= 46;
    160:note <= 42;
    161:note <= 42;
    162:note <= 49;
    163:note <= 49;
    164:note <= 49;
    165:note <= 49;
    166:note <= 48;
    167:note <= 48;
    168:note <= 47;
    169:note <= 47;
    170:note <= 47;
    171:note <= 47;
    172:note <= 43;
    173:note <= 43;
    174:note <= 47;
    175:note <= 47;
    176:note <= 47;
    177:note <= 46;
    178:note <= 45;
    179:note <= 45;
    180:note <= 33; 
    181:note <= 33; 
    182:note <= 33; 
    183:note <= 33; 
    184:note <= 42;
    185:note <= 42;
    186:note <= 39;
    187:note <= 39;
    188:note <= 39;
    189:note <= 39;
    190:note <= 39;
    191:note <= 39;
    192:note <= 39;
    193:note <= 39;
    194:note <= 39;
    195:note <= 39;
	default: note <= 8'd0;
endcase
endmodule

module ROM2(
	input clk,
	input [7:0] address,
	output reg [7:0] note
);

always @(posedge clk)
case(address)
	  0: note<= 8'd25;
	  1: note<= 8'd27;
	  2: note<= 8'd27;
	  3: note<= 8'd25;
	  4: note<= 8'd22;
	  5: note<= 8'd22;
	  6: note<= 8'd30;
	  7: note<= 8'd30;
	  8: note<= 8'd27;
	  9: note<= 8'd27;
	 10: note<= 8'd25;
	 11: note<= 8'd25;
	 12: note<= 8'd25;
	 13: note<= 8'd25;
	 14: note<= 8'd25;
	 15: note<= 8'd25;
	 16: note<= 8'd25;
	 17: note<= 8'd27;
	 18: note<= 8'd25;
	 19: note<= 8'd27;
	 20: note<= 8'd25;
	 21: note<= 8'd25;
	 22: note<= 8'd30;
	 23: note<= 8'd30;
	 24: note<= 8'd29;
	 25: note<= 8'd29;
	 26: note<= 8'd29;
	 27: note<= 8'd29;
	 28: note<= 8'd29;
	 29: note<= 8'd29;
	 30: note<= 8'd29;
	 31: note<= 8'd29;
	 32: note<= 8'd23;
	 33: note<= 8'd25;
	 34: note<= 8'd25;
	 35: note<= 8'd23;
	 36: note<= 8'd20;
	 37: note<= 8'd20;
	 38: note<= 8'd29;
	 39: note<= 8'd29;
	 40: note<= 8'd27;
	 41: note<= 8'd27;
	 42: note<= 8'd25;
	 43: note<= 8'd25;
	 44: note<= 8'd25;
	 45: note<= 8'd25;
	 46: note<= 8'd25;
	 47: note<= 8'd25;
	 48: note<= 8'd25;
	 49: note<= 8'd27;
	 50: note<= 8'd25;
	 51: note<= 8'd27;
	 52: note<= 8'd25;
	 53: note<= 8'd25;
	 54: note<= 8'd27;
	 55: note<= 8'd27;
	 56: note<= 8'd22;
	 57: note<= 8'd22;
	 58: note<= 8'd22;
	 59: note<= 8'd22;
	 60: note<= 8'd22;
	 61: note<= 8'd22;
	 62: note<= 8'd22;
	 63: note<= 8'd22;
	 64: note<= 8'd25;
	 65: note<= 8'd27;
	 66: note<= 8'd27;
	 67: note<= 8'd25;
	 68: note<= 8'd22;
	 69: note<= 8'd22;
	 70: note<= 8'd30;
	 71: note<= 8'd30;
	 72: note<= 8'd27;
	 73: note<= 8'd27;
	 74: note<= 8'd25;
	 75: note<= 8'd25;
	 76: note<= 8'd25;
	 77: note<= 8'd25;
	 78: note<= 8'd25;
	 79: note<= 8'd25;
	 80: note<= 8'd25;
	 81: note<= 8'd27;
	 82: note<= 8'd25;
	 83: note<= 8'd27;
	 84: note<= 8'd25;
	 85: note<= 8'd25;
	 86: note<= 8'd30;
	 87: note<= 8'd30;
	 88: note<= 8'd29;
	 89: note<= 8'd29;
	 90: note<= 8'd29;
	 91: note<= 8'd29;
	 92: note<= 8'd29;
	 93: note<= 8'd29;
	 94: note<= 8'd29;
	 95: note<= 8'd29;
	 96: note<= 8'd23;
	 97: note<= 8'd25;
	 98: note<= 8'd25;
	 99: note<= 8'd23;
	100: note<= 8'd20;
	101: note<= 8'd20;
	102: note<= 8'd29;
	103: note<= 8'd29;
	104: note<= 8'd27;
	105: note<= 8'd27;
	106: note<= 8'd25;
	107: note<= 8'd25;
	108: note<= 8'd25;
	109: note<= 8'd25;
	110: note<= 8'd25;
	111: note<= 8'd25;
	112: note<= 8'd25;
	113: note<= 8'd27;
	114: note<= 8'd25;
	115: note<= 8'd27;
	116: note<= 8'd25;
	117: note<= 8'd25;
	118: note<= 8'd32;
	119: note<= 8'd32;
	120: note<= 8'd30;
	121: note<= 8'd30;
	122: note<= 8'd30;
	123: note<= 8'd30;
	124: note<= 8'd30;
	125: note<= 8'd30;
	126: note<= 8'd30;
	127: note<= 8'd30;
	128: note<= 8'd27;
	129: note<= 8'd27;
	130: note<= 8'd27;
	131: note<= 8'd27;
	132: note<= 8'd30;
	133: note<= 8'd30;
	134: note<= 8'd30;
	135: note<= 8'd27;
	136: note<= 8'd25;
	137: note<= 8'd25;
	138: note<= 8'd22;
	139: note<= 8'd22;
	140: note<= 8'd25;
	141: note<= 8'd25;
	142: note<= 8'd25;
	143: note<= 8'd25;
	144: note<= 8'd23;
	145: note<= 8'd23;
	146: note<= 8'd27;
	147: note<= 8'd27;
	148: note<= 8'd25;
	149: note<= 8'd25;
	150: note<= 8'd23;
	151: note<= 8'd23;
	152: note<= 8'd22;
	153: note<= 8'd22;
	154: note<= 8'd22;
	155: note<= 8'd22;
	156: note<= 8'd22;
	157: note<= 8'd22;
	158: note<= 8'd22;
	159: note<= 8'd22;
	160: note<= 8'd20;
	161: note<= 8'd20;
	162: note<= 8'd22;
	163: note<= 8'd22;
	164: note<= 8'd25;
	165: note<= 8'd25;
	166: note<= 8'd27;
	167: note<= 8'd27;
	168: note<= 8'd29;
	169: note<= 8'd29;
	170: note<= 8'd29;
	171: note<= 8'd29;
	172: note<= 8'd29;
	173: note<= 8'd29;
	174: note<= 8'd29;
	175: note<= 8'd29;
	176: note<= 8'd30;
	177: note<= 8'd30;
	178: note<= 8'd30;
	179: note<= 8'd30;
	180: note<= 8'd29;
	181: note<= 8'd29;
	182: note<= 8'd27;
	183: note<= 8'd27;
	184: note<= 8'd25;
	185: note<= 8'd25;
	186: note<= 8'd23;
	187: note<= 8'd20;
	188: note<= 8'd20;
	189: note<= 8'd20;
	190: note<= 8'd20;
	191: note<= 8'd20;
	192: note<= 8'd25;
	193: note<= 8'd27;
	194: note<= 8'd27;
	195: note<= 8'd25;
	196: note<= 8'd22;
	197: note<= 8'd22;
	198: note<= 8'd30;
	199: note<= 8'd30;
	200: note<= 8'd27;
	201: note<= 8'd27;
	202: note<= 8'd25;
	203: note<= 8'd25;
	204: note<= 8'd25;
	205: note<= 8'd25;
	206: note<= 8'd25;
	207: note<= 8'd25;
	208: note<= 8'd25;
	209: note<= 8'd27;
	210: note<= 8'd25;
	211: note<= 8'd27;
	212: note<= 8'd25;
	213: note<= 8'd25;
	214: note<= 8'd30;
	215: note<= 8'd30;
	216: note<= 8'd29;
	217: note<= 8'd29;
	218: note<= 8'd29;
	219: note<= 8'd29;
	220: note<= 8'd29;
	221: note<= 8'd29;
	222: note<= 8'd29;
	223: note<= 8'd29;
	224: note<= 8'd23;
	225: note<= 8'd25;
	226: note<= 8'd25;
	227: note<= 8'd23;
	228: note<= 8'd20;
	229: note<= 8'd20;
	230: note<= 8'd29;
	231: note<= 8'd29;
	232: note<= 8'd27;
	233: note<= 8'd27;
	234: note<= 8'd25;
	235: note<= 8'd25;
	236: note<= 8'd25;
	237: note<= 8'd25;
	238: note<= 8'd25;
	239: note<= 8'd25;
	240: note<= 8'd25;
	241: note<= 8'd0;
	242: note<= 8'd00;
	default: note <= 8'd0;
endcase
endmodule
