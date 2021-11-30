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
    //B
    0:note <= 34;
    1:note <= 34;
    2:note <= 34;
    3:note <= 34;
    //E
    4:note <= 39;
    5:note <= 39;
    6:note <= 39;
    7:note <= 39;
    8:note <= 39;
    9:note <= 39;
    //G
    10:note <= 42;
    11:note <= 42;
    //F#
    12:note <= 41;
    13:note <= 41;
    14:note <= 41;
    15:note <= 41;
    //E
    16:note <= 39;
    17:note <= 39;
    18:note <= 39;
    19:note <= 39;
    20:note <= 39;
    21:note <= 39;
    22:note <= 39;
    23:note <= 39;
    //B
    24:note <= 46;
    25:note <= 46;
    26:note <= 46;
    27:note <= 46;
    //A
    28:note <= 44;
    29:note <= 44;
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
    //F#
    40:note <= 41;
    41:note <= 41;
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
    //E
    52:note <= 39;
    53:note <= 39;
    54:note <= 39;
    55:note <= 39;
    56:note <= 39;
    57:note <= 39;
    //G
    58:note <= 42;
    59:note <= 42;
    //F#
    60:note <= 41;
    61:note <= 41;
    62:note <= 41;
    63:note <= 41;
    //Eb
    64:note <= 38;
    65:note <= 38;
    66:note <= 38;
    67:note <= 38;
    68:note <= 38;
    69:note <= 38;
    70:note <= 38;
    71:note <= 38;
    //F
    72:note <= 40;
    73:note <= 40;
    74:note <= 40;
    75:note <= 40;
    //B
    76:note <= 34;
    77:note <= 34;
    78:note <= 34;
    79:note <= 34;
    80:note <= 34;
    81:note <= 34;
    82:note <= 34;
    83:note <= 34;
    84:note <= 34;
    85:note <= 34;
    86:note <= 34;
    87:note <= 34;
    //START OF PHRASE 2
    88:note <= 0;
    89:note <= 0;
    //B
    90:note <= 34;
    91:note <= 34;
    92:note <= 34;
    93:note <= 34;
    //E
    94:note <= 39;
    95:note <= 39;
    96:note <= 39;
    97:note <= 39;
    98:note <= 39;
    99:note <= 39;
    //G
    100:note <= 42;
    101:note <= 42;
    //F#
    102:note <= 41;
    103:note <= 41;
    104:note <= 41;
    105:note <= 41;
    //E
    106:note <= 39;
    107:note <= 39;
    108:note <= 39;
    109:note <= 39;
    110:note <= 39;
    111:note <= 39;
    112:note <= 39;
    113:note <= 39;
    //B
    114:note <= 46;
    115:note <= 46;
    116:note <= 46;
    117:note <= 46;
    //D
    118:note <= 49;
    119:note <= 49;
    120:note <= 49;
    121:note <= 49;
    122:note <= 49;
    123:note <= 49;
    124:note <= 49;
    125:note <= 49;
    //Db
    126:note <= 48;
    127:note <= 48;
    128:note <= 48;
    129:note <= 48;
    //C
    131:note <= 47;
    132:note <= 47;
    133:note <= 47;
    134:note <= 47;
    135:note <= 47;
    136:note <= 47;
    137:note <= 47;
    138:note <= 47;
    //Ab
    139:note <= 43;
    140:note <= 43;
    141:note <= 43;
    142:note <= 43;
    //C
    143:note <= 47;
    144:note <= 47;
    145:note <= 47;
    146:note <= 47;
    147:note <= 47;
    148:note <= 47;
    //B
    149:note <= 46;
    150:note <= 46;
    //Bb
    151:note <= 45;
    152:note <= 45;
    153:note <= 45;
    154:note <= 45;
    //Bb
    155:note <= 34;
    156:note <= 34;
    157:note <= 34;
    158:note <= 34;
    159:note <= 34;
    160:note <= 34;
    161:note <= 34;
    162:note <= 34;
    //G
    163:note <= 42;
    164:note <= 42;
    165:note <= 42;
    166:note <= 42;
    //E
    167:note <= 39;
    168:note <= 39;
    169:note <= 39;
    170:note <= 39;
    171:note <= 39;
    172:note <= 39;
    173:note <= 39;
    174:note <= 39;
    //START OF PHRASE 3
    //G
    175:note <= 42;
    176:note <= 42;
    177:note <= 42;
    178:note <= 42;
    //B
    179:note <= 46;
    180:note <= 46;
    181:note <= 46;
    182:note <= 46;
    183:note <= 46;
    184:note <= 46;
    185:note <= 46;
    186:note <= 46;
    //G
    187:note <= 42;
    188:note <= 42;
    189:note <= 42;
    190:note <= 42;
    //B
    191:note <= 46;
    192:note <= 46;
    193:note <= 46;
    194:note <= 46;
    195:note <= 46;
    196:note <= 46;
    197:note <= 46;
    198:note <= 46;
    //G
    199:note <= 42;
    200:note <= 42;
    201:note <= 42;
    202:note <= 42;
    //C
    203:note <= 47;
    204:note <= 47;
    205:note <= 47;
    206:note <= 47;
    207:note <= 47;
    208:note <= 47;
    209:note <= 47;
    210:note <= 47;
    //B
    211:note <= 46;
    212:note <= 46;
    213:note <= 46;
    214:note <= 46;
    //Bb
    215:note <= 45;
    216:note <= 45;
    217:note <= 45;
    218:note <= 45;
    219:note <= 45;
    220:note <= 45;
    221:note <= 45;
    222:note <= 45;
    //Gb
    223:note <= 41;
    224:note <= 41;
    225:note <= 41;
    226:note <= 41;
    //G
    227:note <= 42;
    228:note <= 42;
    229:note <= 42;
    230:note <= 42;
    231:note <= 42;
    232:note <= 42;
    //B
    233:note <= 46;
    234:note <= 46;
    //Bb
    235:note <= 45;
    236:note <= 45;
    //Bb
    237:note <= 33;
    238:note <= 33;
    239:note <= 33;
    240:note <= 33;
    //B
    241:note <= 34;
    242:note <= 34;
    243:note <= 34;
    244:note <= 34;
    //B
    245:note <= 46;
    246:note <= 46;
    247:note <= 46;
    248:note <= 46;
    249:note <= 46;
    250:note <= 46;
    251:note <= 46;
    252:note <= 46;
    253:note <= 46;
    254:note <= 46;
    255:note <= 46;
    256:note <= 46;
    257:note <= 46;
    258:note <= 46;
    259:note <= 46;
    260:note <= 46;
    261:note <= 46;
    262:note <= 46;
    263:note <= 46;
    264:note <= 46;
    //START OF PHRASE 4
    //G
    265:note <= 42;
    266:note <= 42;
    267:note <= 42;
    268:note <= 42;
    //B
    269:note <= 46;
    270:note <= 46;
    271:note <= 46;
    272:note <= 46;
    273:note <= 46;
    274:note <= 46;
    275:note <= 46;
    276:note <= 46;
    //G
    277:note <= 42;
    278:note <= 42;
    279:note <= 42;
    280:note <= 42;
    //B
    281:note <= 46;
    282:note <= 46;
    283:note <= 46;
    284:note <= 46;
    285:note <= 46;
    286:note <= 46;
    287:note <= 46;
    288:note <= 46;
    //G
    289:note <= 42;
    290:note <= 42;
    291:note <= 42;
    292:note <= 42;
    //D
    293:note <= 49;
    294:note <= 49;
    295:note <= 49;
    296:note <= 49;
    297:note <= 49;
    298:note <= 49;
    299:note <= 49;
    300:note <= 49; 
    //Db
    301:note <= 48;
    302:note <= 48;
    303:note <= 48;
    304:note <= 48; 
    //C
    305:note <= 47;
    306:note <= 47;
    307:note <= 47;
    308:note <= 47;
    309:note <= 47;
    310:note <= 47;
    311:note <= 47;
    312:note <= 47;
    //Ab
    313:note <= 43;
    314:note <= 43;
    315:note <= 43;
    316:note <= 43;
    //C
    317:note <= 47;
    318:note <= 47;
    319:note <= 47;
    320:note <= 47;
    321:note <= 47;
    322:note <= 47;
    //B
    323:note <= 46;
    324:note <= 46;
    //Bb
    325:note <= 45;
    326:note <= 45;
    327:note <= 45;
    328:note <= 45;
    //Bb
    329:note <= 33;
    330:note <= 33;
    331:note <= 33;
    332:note <= 33;
    333:note <= 33;
    334:note <= 33;
    335:note <= 33;
    336:note <= 33;
    //G
    337:note <= 42;
    338:note <= 42;
    339:note <= 42;
    340:note <= 42;
    //E
    341:note <= 39;
    342:note <= 39;
    343:note <= 39;
    344:note <= 39;
    345:note <= 39;
    346:note <= 39;
    347:note <= 39;
    348:note <= 39;
    349:note <= 39;
    350:note <= 39;
    351:note <= 39;
    352:note <= 39;
    353:note <= 39;
    354:note <= 39;
    355:note <= 39;
    356:note <= 39;
    357:note <= 39;
    358:note <= 39;
    359:note <= 39;
    360:note <= 39;
    361:note <= 39;
    362:note <= 39;
    363:note <= 39;
    364:note <= 39;
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
    //A 44
    0:note <= 44;
    1:note <= 44;
    2:note <= 44;
    3:note <= 44;
    //G 42
    4:note <= 42;
    5:note <= 42;
    6:note <= 42;
    7:note <= 42;
    //F# 41
    8:note <= 41;
    9:note <= 41;
    10:note <= 41; 
    11:note <= 41;
    12:note <= 41;
    13:note <= 41;
    14:note <= 41; 
    15:note <= 41;
    //E 39
    16:note <= 39;
    17:note <= 39;
    //F# 41
    18:note <= 41;
    19:note <= 41;
    20:note <= 41;
    21:note <= 41;
    //E 39
    22:note <= 39;
    //C# 36
    23:note <= 36;
    //D 37
    24:note <= 37;
    25:note <= 37;
    //A 32
    26:note <= 32;
    27:note <= 32;
    //A 44
    28:note <= 44;
    29:note <= 44;
    30:note <= 44;
    31:note <= 44;
    //G 42
    32:note <= 42;
    33:note <= 42;
    34:note <= 42;
    35:note <= 42;
    //F# 41
    36:note <= 41;
    37:note <= 41;
    38:note <= 41;
    39:note <= 41;
    40:note <= 41;
    41:note <= 41;
    42:note <= 41;
    43:note <= 41;
    //E 39
    44:note <= 39;
    45:note <= 39;
    //F# 41
    46:note <= 41;
    47:note <= 41;
    48:note <= 41;
    49:note <= 41;
    //E 39
    50:note <= 39;
    //C# 36
    51:note <= 36;
    //D 37
    52:note <= 37;
    53:note <= 37;
    54:note <= 37;
    55:note <= 37;
    //FIRST ENDING
    //B 46
    56:note <= 46;
    57:note <= 46;
    58:note <= 46;
    59:note <= 46;
    //A 44
    60:note <= 44;
    61:note <= 44;
    62:note <= 44;
    63:note <= 44;
    //G 42
    64:note <= 42;
    65:note <= 42;
    66:note <= 42;
    67:note <= 42;
    68:note <= 42;
    69:note <= 42;
    70:note <= 42;
    71:note <= 42;
    //A 44
    72:note <= 44;
    73:note <= 44;
    //D 49
    74:note <= 49;
    75:note <= 49;
    //A 44
    76:note <= 44;
    77:note <= 44;
    //D 37
    78:note <= 37;
    79:note <= 37;
    //F# 41
    80:note <= 41;
    81:note <= 41;
    82:note <= 41;
    83:note <= 41;
    //E 39
    84:note <= 39;
    85:note <= 39;
    86:note <= 39;
    87:note <= 39;
    //A 44
    88:note <= 44;
    89:note <= 44;
    90:note <= 44;
    91:note <= 44;
    //eight note rest
    92:note <= 0;
    93:note <= 0;
    //G 42
    94:note <= 42;
    95:note <= 42;
    //F# 41
    96:note <= 41;
    97:note <= 41;
    98:note <= 41;
    99:note <= 41;
    //D 37
    100:note <= 37;
    101:note <= 37;
    102:note <= 37;
    103:note <= 37;
    //E 39
    104:note <= 39;
    105:note <= 39;
    106:note <= 39;
    107:note <= 39;
    108:note <= 39;
    109:note <= 39;
    110:note <= 39;
    111:note <= 39;
    112:note <= 39;
    113:note <= 39;
    114:note <= 39;
    115:note <= 39;
    //quarter note rest
    116:note <= 0;
    117:note <= 0;
    118:note <= 0;
    119:note <= 0;
    //FIRST REPEAT
    //A 44
    120:note <= 44;
    121:note <= 44;
    122:note <= 44;
    123:note <= 44;
    //G 42
    124:note <= 42;
    125:note <= 42;
    126:note <= 42;
    127:note <= 42;
    //F# 41
    128:note <= 41;
    129:note <= 41;
    130:note <= 41; 
    131:note <= 41;
    132:note <= 41;
    133:note <= 41;
    134:note <= 41; 
    135:note <= 41;
    //E 39
    136:note <= 39;
    137:note <= 39;
    //F# 41
    138:note <= 41;
    139:note <= 41;
    140:note <= 41;
    141:note <= 41;
    //E 39
    142:note <= 39;
    //C# 36
    143:note <= 36;
    //D 37
    144:note <= 37;
    145:note <= 37;
    //A 32
    146:note <= 32;
    147:note <= 32;
    //A 44
    148:note <= 44;
    149:note <= 44;
    150:note <= 44;
    151:note <= 44;
    //G 42
    152:note <= 42;
    153:note <= 42;
    154:note <= 42;
    155:note <= 42;
    //F# 41
    156:note <= 41;
    157:note <= 41;
    158:note <= 41;
    159:note <= 41;
    160:note <= 41;
    161:note <= 41;
    162:note <= 41;
    163:note <= 41;
    //E 39
    164:note <= 39;
    165:note <= 39;
    //F# 41
    166:note <= 41;
    167:note <= 41;
    168:note <= 41;
    169:note <= 41;
    //E 39
    170:note <= 39;
    //C# 36
    171:note <= 36;
    //D 37
    172:note <= 37;
    173:note <= 37;
    174:note <= 37;
    175:note <= 37;
    //SECOND ENDING
    //B 46
    176:note <= 46;
    177:note <= 46;
    178:note <= 46;
    179:note <= 46;
    //A 44
    180:note <= 44;
    181:note <= 44;
    182:note <= 44;
    183:note <= 44;
    //G
    184:note <= 42;
    185:note <= 42;
    186:note <= 42;
    187:note <= 42;
    //eight note rest
    188:note <= 0;
    189:note <= 0;
    //D 37
    190:note <= 37;
    191:note <= 37;
    //C# 48
    192:note <= 48;
    193:note <= 48;
    194:note <= 48;
    195:note <= 48;
    //B 46
    196:note <= 46;
    197:note <= 46;
    198:note <= 46;
    199:note <= 46;
    //A 44
    200:note <= 44;
    201:note <= 44;
    202:note <= 44;
    203:note <= 44;
    //D 37
    204:note <= 37;
    205:note <= 37;
    //D 49
    206:note <= 49;
    207:note <= 49;
    208:note <= 49;
    209:note <= 49;
    210:note <= 49;
    211:note <= 49;
    //C# 48
    212:note <= 48;
    213:note <= 48;
    //B 46
    214:note <= 46;
    215:note <= 46;
    216:note <= 46;
    217:note <= 46;   
    218:note <= 46;
    219:note <= 46;
    //F# 41
    220:note <= 41;
    221:note <= 41;
    //A
    222:note <= 44;
    223:note <= 44;   
    224:note <= 44;
    225:note <= 44;
    226:note <= 44;
    227:note <= 44;
    228:note <= 44;
    229:note <= 44;
    //eight note rest
    230:note <= 0;
    231:note <= 0;
    //B 46
    232:note <= 46;
    233:note <= 46;
    //C# 48
    234:note <= 48;
    235:note <= 48;
    //D 49
    236:note <= 49;
    237:note <= 49;
    238:note <= 49;
    239:note <= 49;
    //G 42
    240:note <= 42;
    241:note <= 42;
    242:note <= 42;
    243:note <= 42;
    //rest to imitate articulation
    244:note <= 0
    //G 42
    245:note <= 42;
    246:note <= 42;
    247:note <= 42;    
    248:note <= 42;
    249:note <= 42;
    250:note <= 42;
    //F# 41
    251:note <= 41;
    252:note <= 41;
    //A 44
    253:note <= 44;   
    254:note <= 44;
    255:note <= 44;
    256:note <= 44;
    257:note <= 44;
    258:note <= 44;
    259:note <= 44;
    260:note <= 44;
    //quarter note rest
    261:note <= 0;
    262:note <= 0;
    263:note <= 0;
    264:note <= 0;
    //D 37
    265:note <= 37;
    266:note <= 37;
    //E 39
    267:note <= 39;
    268:note <= 39;
    //sixteenth note rest to imitate articulation
    269:note <= 0
    //E 39
    270:note <= 39;
    271:note <= 39;
    272:note <= 39;
    273:note <= 39;
    274:note <= 39;
    275:note <= 39;
    //sixteenth note rest to imitate articulation
    276:note <= 0
    //E 39
    277:note <= 39;
    278:note <= 39;
    //A 44
    279:note <= 44;
    280:note <= 44;
    281:note <= 44;
    282:note <= 44;
    283:note <= 44;
    284:note <= 44;
    //G 42
    285:note <= 42;
    286:note <= 42;
    //G 42
    287:note <= 42;
    288:note <= 42;
    289:note <= 42;
    290:note <= 42;
    //F# 41
    291:note <= 41;
    292:note <= 41;
    293:note <= 41;
    294:note <= 41;
    //quarter note rest
    295:note <= 0;
    296:note <= 0;
    297:note <= 0;
    298:note <= 0;
    //B 46
    299:note <= 46;
    300:note <= 46;
    //C# 48
    301:note <= 48;
    302:note <= 48;
    //D 49
    303:note <= 49;
    304:note <= 49;
    305:note <= 49;    
    306:note <= 49;
    //G 42
    307:note <= 42;
    308:note <= 42;
    309:note <= 42;
    310:note <= 42;
    //sixteenth note rest to imitate articulation
    311:note <= 0
    //G 42    
    312:note <= 42;
    313:note <= 42;
    314:note <= 42;
    315:note <= 42;
    316:note <= 42;    
    317:note <= 42;
    //F# 41
    318:note <= 41;
    319:note <= 41;
    //A 44
    320:note <= 44;
    321:note <= 44;    
    322:note <= 44;
    323:note <= 44;
    324:note <= 44;
    325:note <= 44;
    326:note <= 44;
    327:note <= 44;
    //quarter note rest    
    328:note <= 40;
    329:note <= 40;
    330:note <= 40;
    331:note <= 40;
    //D 37
    332:note <= 37;
    333:note <= 37;
    //E 39
    334:note <= 39;
    334:note <= 39;
    //F# 41
    335:note <= 41;
    336:note <= 41;
    337:note <= 41;
    338:note <= 41;
    339:note <= 41;
    340:note <= 41;
    //G 42
    341:note <= 42;
    342:note <= 42;
    //F# 41
    343:note <= 41;
    344:note <= 41;
    345:note <= 41;
    346:note <= 41;
    347:note <= 41;
    348:note <= 41;
    //E 39
    349:note <= 39;
    350:note <= 39;
    //D 37
    351:note <= 37;
    352:note <= 37;
    353:note <= 37;
    354:note <= 37;
    355:note <= 37;
    356:note <= 37;
    357:note <= 37;
    358:note <= 37;
    //quarter note rest
    359:note <= 0;
    360:note <= 0; 
    361:note <= 0; 
    362:note <= 0;
    //B 46
    363:note <= 46;
    364:note <= 46;
    //C# 48
    365:note <= 48;
    366:note <= 48;
    //D 49
    367:note <= 49;
    368:note <= 49;
    369:note <= 49;
    370:note <= 49;
    371:note <= 49;
    372:note <= 49;
    //G 42
    373:note <= 42;
    374:note <= 42;
    //sixteenth note rest to imitate articulation
    375:note <= 0;
    //G
    376:note <= 42;
    377:note <= 42;
    378:note <= 42;
    379:note <= 42;
    //F# 41
    380:note <= 41;
    381:note <= 41;
    382:note <= 41;
    383:note <= 41;
    //A 44
    384:note <= 44;
    385:note <= 44;
    386:note <= 44;
    387:note <= 44;
    //D 37
    388:note <= 37;
    389:note <= 37;
    390:note <= 37;
    391:note <= 37;
    392:note <= 37;
    393:note <= 37;
    394:note <= 37;
    395:note <= 37;
    //quarter noter est
    396:note <= 0;
    397:note <= 0;
    398:note <= 0;
    399:note <= 0;
    //D 37
    400:note <= 37; 
    401:note <= 37;
    402:note <= 39;
    403:note <= 39;
    404:note <= 0;
    405:note <= 0;
    406:note <= 0;
    407:note <= 0;
    default: note <= 8'd0;
endcase
endmodule
