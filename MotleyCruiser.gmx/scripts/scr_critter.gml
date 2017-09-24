/// An array used as a framework to generate random critters
//scr_critter()
var critter = noone;

critter[CRITTER_W_LOW]=16;//body width
critter[CRITTER_W_HIGH]=64;
critter[CRITTER_H_LOW]=4;//body height
critter[CRITTER_H_HIGH]=64;
critter[CRITTER_LEG_SHAPE]="square";// square, elipse, triangle
critter[CRITTER_LEG_COLOR]=noone;
critter[CRITTER_LEG_COLOR2]=noone;
critter[CRITTER_LEG_COUNT]=4;// 4,6,8
critter[CRITTER_BODY_COLOR]=noone;
critter[CRITTER_BODY_SHAPE]="rectangle";// rectangle,triangle,elipse
critter[CRITTER_HEAD_SIZE_MOD_W] = 4;
critter[CRITTER_HEAD_SIZE_MOD_H] = 4;
critter[CRITTER_HEAD_SHAPE]="circle";
critter[CRITTER_TAIL_L_LOW]=0;
critter[CRITTER_TAIL_L_HIGH]=64;
critter[CRITTER_EYE_COLOR]=noone;
critter[CRITTER_SYMETRICAL]=false;
critter[CRITTER_HORN_LENGTH]=0;
critter[CRITTER_EYE_COUNT]=1;
critter[CRITTER_HAS_TEETH]=0;
critter[CRITTER_TOOTH_COUNT]=0;
critter[CRITTER_SPEED]=2;
return critter;
