/*****
Hair, clothes and hats for npcs and player

See scr_races for race incexes.
*****/

global.accessories = noone;

global.haircolors = noone;
var hairColorsHuman = noone;
hairColorsHuman = scr_push_array(hairColorsHuman,c_white);
hairColorsHuman = scr_push_array(hairColorsHuman,c_aqua);
hairColorsHuman = scr_push_array(hairColorsHuman,c_blue);
hairColorsHuman = scr_push_array(hairColorsHuman,c_dkgray);
hairColorsHuman = scr_push_array(hairColorsHuman,c_fuchsia);
hairColorsHuman = scr_push_array(hairColorsHuman,c_gray);
hairColorsHuman = scr_push_array(hairColorsHuman,c_lime);
hairColorsHuman = scr_push_array(hairColorsHuman,c_maroon);
hairColorsHuman = scr_push_array(hairColorsHuman,c_orange);
hairColorsHuman = scr_push_array(hairColorsHuman,c_purple);
hairColorsHuman = scr_push_array(hairColorsHuman,c_red);
hairColorsHuman = scr_push_array(hairColorsHuman,c_silver);
hairColorsHuman = scr_push_array(hairColorsHuman,c_teal);
hairColorsHuman = scr_push_array(hairColorsHuman,c_yellow);
global.haircolors[0] = hairColorsHuman;// This index should match the race index.

var hairColorsChicken = noone;
hairColorsChicken = scr_push_array(hairColorsChicken,c_aqua);
hairColorsChicken = scr_push_array(hairColorsChicken,c_fuchsia);
hairColorsChicken = scr_push_array(hairColorsChicken,c_red);
hairColorsChicken = scr_push_array(hairColorsChicken,c_yellow);
hairColorsChicken = scr_push_array(hairColorsChicken,c_maroon);
hairColorsChicken = scr_push_array(hairColorsChicken,c_navy);
global.haircolors[1] = hairColorsChicken;

var hairColorsFlow = noone;
hairColorsFlow = scr_push_array(hairColorsFlow,c_aqua);
hairColorsFlow = scr_push_array(hairColorsFlow,c_blue);
hairColorsFlow = scr_push_array(hairColorsFlow,c_fuchsia);
hairColorsFlow = scr_push_array(hairColorsFlow,c_orange);
hairColorsFlow = scr_push_array(hairColorsFlow,c_purple);
hairColorsFlow = scr_push_array(hairColorsFlow,c_red);
hairColorsFlow = scr_push_array(hairColorsFlow,c_teal);
hairColorsFlow = scr_push_array(hairColorsFlow,c_yellow);
global.haircolors[3] = hairColorsFlow;

global.skincolors = noone;
var skincolorsHuman = noone;
skincolorsHuman = scr_push_array(skincolorsHuman,make_colour_rgb(249, 234, 232));
skincolorsHuman = scr_push_array(skincolorsHuman,make_colour_rgb(255,210,210));
skincolorsHuman = scr_push_array(skincolorsHuman,make_colour_rgb(255,220,160));
skincolorsHuman = scr_push_array(skincolorsHuman,make_colour_rgb(160,140,100));
skincolorsHuman = scr_push_array(skincolorsHuman,make_colour_rgb(70,60,35));
skincolorsHuman = scr_push_array(skincolorsHuman,make_colour_rgb(50,35,10));
global.skincolors[0]=skincolorsHuman;

var skincolorsChicken = noone;
skincolorsChicken = scr_push_array(skincolorsChicken,make_colour_rgb(255,255,237));
skincolorsChicken = scr_push_array(skincolorsChicken,make_colour_rgb(10,250,255));
skincolorsChicken = scr_push_array(skincolorsChicken,make_colour_rgb(150,30,52));
skincolorsChicken = scr_push_array(skincolorsChicken,make_colour_rgb(15,30,52));
global.skincolors[1]=skincolorsChicken;

var skincolorsFlowridian = noone;
skincolorsFlowridian = scr_push_array(skincolorsFlowridian,make_colour_rgb(0, 127, 255));
skincolorsFlowridian = scr_push_array(skincolorsFlowridian,make_colour_rgb(255, 205, 0));
skincolorsFlowridian = scr_push_array(skincolorsFlowridian,make_colour_rgb(0, 250, 115));
global.skincolors[3]=skincolorsFlowridian;

var races = global.races;
// Instantiate array. One index for each race
for(var i = 0; i<array_height_2d(races); i++){
    global.accessories[i]=noone;
}

// Human
var a = noone;
var chests = noone;
var hairs = noone;
var hats = noone;
var eyes = noone;

chests=scr_array_size(3);
chests = scr_push_array(chests,spr_human_body1);
chests = scr_push_array(chests,spr_human_body2);
chests = scr_push_array(chests,spr_human_body3);
chests = scr_push_array(chests,spr_human_body4);
chests = scr_push_array(chests,spr_human_body5);
chests = scr_push_array(chests,spr_human_body6);

hairs=scr_array_size(7);
hairs[1]=spr_human_hair1;
hairs[2]=spr_human_hair2;
hairs[3]=spr_human_hair3;
hairs[4]=spr_human_hair4;
hairs[5]=spr_human_hair5;

hats=scr_array_size(6);
hats = scr_push_array(hats,spr_human_helm1);
hats = scr_push_array(hats,spr_human_helm2);
hats = scr_push_array(hats,spr_human_hat1);
hats = scr_push_array(hats,spr_human_hat2);
hats = scr_push_array(hats,spr_human_helm3);
hats = scr_push_array(hats,spr_human_helm4);

eyes=scr_array_size(6);
eyes = scr_push_array(eyes,spr_goggles1);
eyes = scr_push_array(eyes,spr_goggles2);
eyes = scr_push_array(eyes,spr_goggles3);
eyes = scr_push_array(eyes,spr_goggles4);

a[0]=chests;
a[1]=hairs;
a[2]=hats;
a[3]=eyes;

global.accessories[0]=a;


// Chicken
a = noone;
chests = noone;
hairs = noone;
hats = noone;
eyes = noone;

chests=scr_array_size(6);
chests[0]=spr_chicken_chest1;
chests[2]=spr_chicken_chest2;

hairs=scr_array_size(6);
hairs[0]=spr_chicken_hair1;
hairs[1]=spr_chicken_hair2;
hairs[2]=spr_chicken_hair3;
hairs[3]=spr_chicken_hair4;

hats=scr_array_size(15);
hats[0]=spr_chicken_helm1;
hats[1]=spr_chicken_helm2;
hats[2]=spr_chicken_helm3;
hats[3]=spr_chicken_helm4;
hats[4]=spr_chicken_helm5;

eyes=scr_array_size(4);
eyes[0]=spr_chicken_eyes0;
eyes[1]=spr_chicken_eyes1;
eyes[2]=spr_chicken_eyes2;
eyes[3]=spr_chicken_eyes3;

a[0]=chests;
a[1]=hairs;
a[2]=hats;
a[3]=eyes;

global.accessories[1]=a;

// Flowridian 3
a = noone;
chests = noone;
hairs = noone;
hats = noone;

chests=scr_array_size(5);
chests[0]=spr_flow_chest1;
chests[1]=spr_flow_chest2;

hairs=scr_array_size(8);
hairs[0]=spr_flow_hair1;
hairs[1]=spr_flow_hair2;
hairs[2]=spr_flow_hair3;
hairs[3]=spr_flow_hair4;
hairs[4]=spr_flow_hair5;
hairs[5]=spr_flow_hair6;

hats=scr_array_size(6);
hats[0]=spr_flow_head1;
hats[1]=spr_flow_head2;
hats[2]=spr_flow_head3;
hats[3]=spr_flow_head4;

a[0]=chests;
a[1]=hairs;
a[2]=hats;
a[3]=noone;

global.accessories[3]=a;


