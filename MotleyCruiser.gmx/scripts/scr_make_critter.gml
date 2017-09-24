/// Make a random critter species
var critter = scr_critter();

// Max/min dimensions
var d_max = 64;
var d_min = 4;

critter[CRITTER_W_LOW]=irandom_range(d_min,d_max);
critter[CRITTER_W_HIGH]=critter[CRITTER_W_LOW] + 8;
critter[CRITTER_H_LOW]=irandom_range(8,32);
critter[CRITTER_H_HIGH]=critter[CRITTER_H_LOW] + 8;
critter[CRITTER_LEG_SHAPE]=choose("rectangle","triangle");
critter[CRITTER_LEG_COLOR]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
critter[CRITTER_LEG_COLOR2]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
critter[CRITTER_LEG_COUNT]=choose(4,6,8);
critter[CRITTER_BODY_COLOR]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
critter[CRITTER_BODY_SHAPE]=choose("rectangle","elipse");
critter[CRITTER_HEAD_SIZE_MOD_W] = irandom(8) - 4;
critter[CRITTER_HEAD_SIZE_MOD_H] = irandom(8) - 4;
critter[CRITTER_HEAD_SHAPE]=choose("rectangle","elipse","circle","triangle");
critter[CRITTER_TAIL_L_LOW]=irandom_range(0,16);
critter[CRITTER_TAIL_L_HIGH]=critter[CRITTER_TAIL_L_LOW] + 8;
critter[CRITTER_EYE_COLOR]=choose(c_green,c_yellow,c_red,c_blue,c_aqua,c_lime);
critter[CRITTER_HAS_HORNS] = (irandom(5)==5);
critter[CRITTER_HORN_COUNT] = irandom(3)+1;
critter[CRITTER_SYMETRICAL] = (irandom(3) == 3);
critter[CRITTER_HORN_LENGTH] = irandom_range(2,16);
critter[CRITTER_EYE_COUNT] = irandom(5);
critter[CRITTER_HAS_TEETH] = (irandom(5) == 5 && critter[CRITTER_HEAD_SHAPE]!="triangle");
critter[CRITTER_TOOTH_COUNT] = irandom(3)+2;
critter[CRITTER_SPEED] = irandom(4)+1;

return critter;
