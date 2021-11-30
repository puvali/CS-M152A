`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:03:31 11/23/2021 
// Design Name: 
// Module Name:    top 
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
module top(
    input CLK100MHZ,
    output [3:0] jd,
    output [3:0] led,
    input [3:0] sw
    );

parameter clkspeed = 100000000;
reg speaker;

// Need 12 bits to fit the maximum divider of 1775 (100000000 / 512 / 110)
reg [11:0] clkdivider;
reg [11:0] counter_note;
reg [7:0] counter_octave;

reg [33:0] tone;
always @(posedge CLK100MHZ) tone <= tone+1;

wire [7:0] swnote;
wire [7:0] rudolphnote;
//tone[31...] was too slow, tone[30...] too fast so adding notes
sw_ROM swROM(.clk(CLK100MHZ), .address(tone[30:23]), .note(swnote));
rudolph_ROM rudolphROM(.clk(CLK100MHZ), .address(tone[31:25]), .note(rudolphnote));

reg [7:0] fullnote;
always @(posedge CLK100MHZ)
  if(sw[1])
    fullnote <= swnote;
  else
    fullnote <= rudolphnote;

wire [2:0] octave;
wire [3:0] note;
divide_by12 divby12(.numer(fullnote[5:0]), .quotient(octave), .remain(note));

// The lowest A note we want is A2, which is 110hz.
// We know that the octave modifier will multiply the divider
// by 256 for the lowest note, so our note divider should
// take the form of 100MHz / 256 / target_freq / 2 OR
//                  100MHz / 512 / target_freq
always @(note)
case(note)
  0: clkdivider = clkspeed / 512 / 110 - 1; // A (second octave)
  1: clkdivider = clkspeed / 512 / 117 - 1; // A#/Bb
  2: clkdivider = clkspeed / 512 / 123 - 1; // B
  3: clkdivider = clkspeed / 512 / 131 - 1; // C
  4: clkdivider = clkspeed / 512 / 139 - 1; // C#/Db
  5: clkdivider = clkspeed / 512 / 147 - 1; // D
  6: clkdivider = clkspeed / 512 / 156 - 1; // D#/Eb
  7: clkdivider = clkspeed / 512 / 165 - 1; // E
  8: clkdivider = clkspeed / 512 / 175 - 1; // F
  9: clkdivider = clkspeed / 512 / 185 - 1; // F#/Gb
  10: clkdivider = clkspeed / 512 / 196 - 1; // G
  11: clkdivider = clkspeed / 512 / 208 - 1; // G#/Ab
	default: clkdivider = 8'd0; // should never happen
endcase

always @(posedge CLK100MHZ)
  if(counter_note==0)
    counter_note <= clkdivider;
  else
    counter_note <= counter_note-1;

always @(posedge CLK100MHZ)
if(counter_note==0)
  begin
    if(counter_octave==0)
      counter_octave <= (octave==0?255:octave==1?127:octave==2?63:octave==3?31:octave==4?15:7);
    else
      counter_octave <= counter_octave-1;
  end

always @(posedge CLK100MHZ) if(counter_note==0 && counter_octave==0 && fullnote != 0) speaker <= ~speaker;

// A 7 bit counter is 0 once every 128 cycles.
// At 100MHz, this is too fast to make a sonic difference,
// but will average out the analog signal to a much lower
// volume.
assign jd[0] = speaker & (tone[6:0] == 0);
// Set switch 0 to gain control. 1 is low gain, so lets make that default
assign jd[1] = ~sw[0];
// Set switch 3 to toggle shutdown pin, turning amplifier on and off.
assign jd[3] = sw[3];

// LEDs to help with debugging
assign led[0] = speaker;   // Current wave form
assign led[1] = jd[0];     // Attenuated signal sent to PMOD AMP
assign led[3] = sw[3];     // Sound on or off

endmodule

module divide_by12(numer, quotient, remain);
input [5:0] numer;
output [2:0] quotient;
output [3:0] remain;

reg [2:0] quotient;
reg [3:0] remain_bit3_bit2;

assign remain = {remain_bit3_bit2, numer[1:0]}; // the first 2 bits are copied through

always @(numer[5:2]) // and just do a divide by "3" on the remaining bits
case(numer[5:2])
   0: begin quotient=0; remain_bit3_bit2=0; end
   1: begin quotient=0; remain_bit3_bit2=1; end
   2: begin quotient=0; remain_bit3_bit2=2; end
   3: begin quotient=1; remain_bit3_bit2=0; end
   4: begin quotient=1; remain_bit3_bit2=1; end
   5: begin quotient=1; remain_bit3_bit2=2; end
   6: begin quotient=2; remain_bit3_bit2=0; end
   7: begin quotient=2; remain_bit3_bit2=1; end
   8: begin quotient=2; remain_bit3_bit2=2; end
   9: begin quotient=3; remain_bit3_bit2=0; end
 10: begin quotient=3; remain_bit3_bit2=1; end
 11: begin quotient=3; remain_bit3_bit2=2; end
 12: begin quotient=4; remain_bit3_bit2=0; end
 13: begin quotient=4; remain_bit3_bit2=1; end
 14: begin quotient=4; remain_bit3_bit2=2; end
 15: begin quotient=5; remain_bit3_bit2=0; end
endcase
endmodule


module sw_ROM(
	input clk,
	input [7:0] address,
	output reg [7:0] note
);

always @(posedge clk)
case(address)
    0:note <= 34;
    1:note <= 34;
    2:note <= 34;
    3:note <= 34;
    4:note <= 39;
    5:note <= 39;
    6:note <= 39;
    7:note <= 39;
    8:note <= 39;
    9:note <= 39;
    10:note <= 41 
    10:note <= 41; 
    11:note <= 41;
    11:note <= 41;
    12:note <= 41;
    12:note <= 41;
    13:note <= 41;
    13:note <= 41;
    14:note <= 41; 
    14:note <= 41; 
    15:note <= 41;
    15:note <= 41;
    16:note <= 41;
    16:note <= 41;
    17:note <= 41;
    17:note <= 41;
    18:note <= 39;
    19:note <= 39;
    20:note <= 39;
    21:note <= 39;
    22:note <= 39;
    23:note <= 39;
    24:note <= 39;
    25:note <= 39;
    26:note <= 46;
    27:note <= 46;
    28:note <= 46;
    29:note <= 46;
    30:note <= 44;
    31:note <= 44;
    32:note <= 44;
    33:note <= 44;
    34:note <= 44;
    35:note <= 44;
    36:note <= 44;
    37:note <= 44;
    38:note <= 44;
    39:note <= 44;
    40:note <= 44;
    41:note <= 44;
    42:note <= 41;
    43:note <= 41;
    44:note <= 41;
    45:note <= 41;
    46:note <= 41;
    47:note <= 41;
    48:note <= 41;
    49:note <= 41;
    50:note <= 41;
    51:note <= 41;
    52:note <= 41;
    53:note <= 41;
    54:note <= 39;
    55:note <= 39;
    56:note <= 39;
    57:note <= 39;
    58:note <= 39;
    59:note <= 39;
    60:note <= 42;
    61:note <= 42;
    62:note <= 41;
    63:note <= 41;
    64:note <= 41;
    65:note <= 41;
    66:note <= 41;
    67:note <= 41;
    68:note <= 41;
    69:note <= 41;
    70:note <= 38;
    71:note <= 38;
    72:note <= 38;
    73:note <= 38;
    74:note <= 38;
    75:note <= 38;
    76:note <= 38;
    77:note <= 38;
    78:note <= 40;
    79:note <= 40;
    80:note <= 40;
    81:note <= 40;
    82:note <= 34;
    83:note <= 34;
    84:note <= 34;
    85:note <= 34;
    86:note <= 34;
    87:note <= 34;
    88:note <= 34;
    89:note <= 34;
    90:note <= 34;
    91:note <= 34;
    92:note <= 34;
    93:note <= 34;
    94:note <= 34;
    95:note <= 34;
    96:note <= 34;
    97:note <= 34;
    98:note <= 34;
    99:note <= 34;
    100:note <= 34;
    101:note <= 34;
    102:note <= 0;
    103:note <= 0;
    104:note <= 34;
    104:note <= 34;
    104:note <= 34;
    105:note <= 34;
    105:note <= 34;
    105:note <= 34;
    106:note <= 34;
    106:note <= 34;
    106:note <= 34;
    107:note <= 34;
    107:note <= 34;
    107:note <= 34;
    108:note <= 39;
    108:note <= 39;
    108:note <= 39;
    109:note <= 39;
    109:note <= 39;
    109:note <= 39;
    110:note <= 39;
    110:note <= 39;
    110:note <= 39;
    111:note <= 39;
    111:note <= 39;
    111:note <= 39;
    112:note <= 39;
    112:note <= 39;
    112:note <= 39;
    113:note <= 39;
    113:note <= 39;
    113:note <= 39;
    114:note <= 42;
    114:note <= 42;
    114:note <= 42;
    115:note <= 42;
    115:note <= 42;
    115:note <= 42;
    116:note <= 41;
    116:note <= 41;
    116:note <= 41;
    117:note <= 41;
    117:note <= 41;
    117:note <= 41;
    118:note <= 41;
    118:note <= 41;
    118:note <= 41;
    119:note <= 41;
    119:note <= 41;
    119:note <= 41;
    120:note <= 41;
    121:note <= 41;
    122:note <= 41;
    123:note <= 41;
    124:note <= 39;
    125:note <= 39;
    126:note <= 39;
    127:note <= 39;
    128:note <= 39;
    129:note <= 39;
    130:note <= 39;
    131:note <= 39;
    132:note <= 46;
    133:note <= 46;
    134:note <= 46;
    135:note <= 46;
    136:note <= 49;
    137:note <= 49;
    138:note <= 49;
    139:note <= 49;
    140:note <= 49;
    141:note <= 49;
    142:note <= 49;
    143:note <= 49;
    144:note <= 48;
    145:note <= 48;
    146:note <= 48;
    147:note <= 48;
    148:note <= 47;
    149:note <= 47;
    150:note <= 47;
    151:note <= 47;
    152:note <= 47;
    153:note <= 47;
    154:note <= 47;
    155:note <= 47;
    156:note <= 43;
    157:note <= 43;
    158:note <= 43;
    159:note <= 43;
    160:note <= 47;
    161:note <= 47;
    162:note <= 47;
    163:note <= 47;
    164:note <= 47;
    165:note <= 47;
    166:note <= 46;
    167:note <= 46;
    168:note <= 45;
    169:note <= 45;
    170:note <= 45;
    171:note <= 45;
    172:note <= 33;
    173:note <= 33;
    174:note <= 33;
    175:note <= 33;
    176:note <= 33;
    177:note <= 33;
    178:note <= 33;
    179:note <= 33;
    180:note <= 42;
    181:note <= 42;
    182:note <= 42;
    183:note <= 42;
    184:note <= 39;
    185:note <= 39;
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
    196:note <= 39;
    197:note <= 39;
    198:note <= 39;
    199:note <= 39;
    200:note <= 39;
    201:note <= 39;
    202:note <= 39;
    203:note <= 39;
    204:note <= 42;
    205:note <= 42;
    206:note <= 42;
    207:note <= 42;
    208:note <= 46;
    209:note <= 46;
    210:note <= 46;
    211:note <= 46;    
    212:note <= 46;
    213:note <= 46;
    214:note <= 46;
    215:note <= 46;
    216:note <= 42;
    217:note <= 42;    
    218:note <= 42;
    219:note <= 42;
    220:note <= 46;
    221:note <= 46;
    222:note <= 46;
    223:note <= 46;    
    224:note <= 46;
    225:note <= 46;
    226:note <= 46;
    227:note <= 46;
    228:note <= 42;
    229:note <= 42;
    230:note <= 42;
    231:note <= 42;
    232:note <= 47;
    233:note <= 47;
    234:note <= 47;
    235:note <= 47;
    236:note <= 47;
    237:note <= 47;
    238:note <= 47;
    239:note <= 47;
    240:note <= 46;
    241:note <= 46;
    242:note <= 46;
    243:note <= 46;
    244:note <= 45;
    245:note <= 45;
    246:note <= 45;
    247:note <= 45;    
    248:note <= 45;
    249:note <= 45;
    250:note <= 45;
    251:note <= 45;
    252:note <= 41;
    253:note <= 41;    
    254:note <= 41;
    255:note <= 41;
    256:note <= 42;
    257:note <= 42;
    258:note <= 42;
    259:note <= 42;
    260:note <= 46;
    261:note <= 46;
    262:note <= 45;
    263:note <= 45;    
    264:note <= 45;
    265:note <= 45;
    266:note <= 33;
    267:note <= 33;
    268:note <= 33;
    269:note <= 33;    
    270:note <= 33;
    271:note <= 33;
    272:note <= 33;
    273:note <= 33;
    274:note <= 34;
    275:note <= 34;
    276:note <= 34;
    277:note <= 34;
    278:note <= 46;
    279:note <= 46;
    280:note <= 46;
    281:note <= 46;
    282:note <= 46;
    283:note <= 46;
    284:note <= 46;
    285:note <= 46;
    286:note <= 46;
    287:note <= 46;
    288:note <= 46;
    289:note <= 46;
    290:note <= 46;
    291:note <= 46;
    292:note <= 46;
    293:note <= 46;
    294:note <= 46;
    295:note <= 46;
    296:note <= 46;
    297:note <= 46;
    298:note <= 42;
    299:note <= 42;
    300:note <= 42;
    301:note <= 42;
    302:note <= 46;
    303:note <= 46;
    304:note <= 46;
    305:note <= 46;    
    306:note <= 46;
    307:note <= 46;
    308:note <= 46;
    309:note <= 46;
    310:note <= 42;
    311:note <= 42;    
    312:note <= 42;
    313:note <= 42;
    314:note <= 46;
    315:note <= 46;
    316:note <= 46;    
    317:note <= 46;
    318:note <= 46;
    319:note <= 46;
    320:note <= 42;
    321:note <= 42;    
    322:note <= 42;
    323:note <= 42;
    324:note <= 49;
    325:note <= 49;
    326:note <= 49;
    327:note <= 49;    
    328:note <= 49;
    329:note <= 49;
    330:note <= 49;
    331:note <= 49;
    332:note <= 48;
    333:note <= 48;
    334:note <= 48;
    335:note <= 48;
    336:note <= 47;
    337:note <= 47;
    338:note <= 47;
    339:note <= 47;
    340:note <= 47;
    341:note <= 47;
    342:note <= 47;
    343:note <= 47;
    344:note <= 43;
    345:note <= 43;
    346:note <= 43;
    347:note <= 43;
    348:note <= 47;
    349:note <= 47;
    350:note <= 47;
    351:note <= 47;
    352:note <= 47;
    353:note <= 47;
    354:note <= 46;
    355:note <= 46;
    356:note <= 45;
    357:note <= 45;
    358:note <= 45;
    359:note <= 45;
    360:note <= 33; 
    361:note <= 33; 
    362:note <= 33; 
    363:note <= 33;
    364:note <= 33; 
    365:note <= 33; 
    366:note <= 33; 
    367:note <= 33;  
    368:note <= 42;
    369:note <= 42;
    370:note <= 42;
    371:note <= 42;
    372:note <= 39;
    373:note <= 39;
    374:note <= 39;
    375:note <= 39;
    376:note <= 39;
    377:note <= 39;
    378:note <= 39;
    379:note <= 39;
    380:note <= 39;
    381:note <= 39;
    382:note <= 39;
    383:note <= 39;
    384:note <= 39;
    385:note <= 39;
    386:note <= 39;
    387:note <= 39;
    388:note <= 39;
    389:note <= 39;
    390:note <= 39;
    391:note <= 39;
    392:note <= 0;
    393:note <= 0;
    394:note <= 0;
    395:note <= 0;
    396:note <= 0;
    397:note <= 0;
    398:note <= 0;
    399:note <= 0;
	default: note <= 8'd0;
endcase
endmodule

module rudolph_ROM(
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
