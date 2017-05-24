/*****
Hair, clothes and hats for npcs and player
*****/

global.accessories = noone;

var haircolors = noone;
haircolors = scr_push_array(haircolors,c_white);
haircolors = scr_push_array(haircolors,c_aqua);
haircolors = scr_push_array(haircolors,c_blue);
haircolors = scr_push_array(haircolors,c_dkgray);
haircolors = scr_push_array(haircolors,c_fuchsia);
haircolors = scr_push_array(haircolors,c_gray);
haircolors = scr_push_array(haircolors,c_lime);
haircolors = scr_push_array(haircolors,c_maroon);
haircolors = scr_push_array(haircolors,c_orange);
haircolors = scr_push_array(haircolors,c_purple);
haircolors = scr_push_array(haircolors,c_red);
haircolors = scr_push_array(haircolors,c_silver);
haircolors = scr_push_array(haircolors,c_teal);
haircolors = scr_push_array(haircolors,c_yellow);
global.haircolors = haircolors;


var skincolors = noone;
skincolors = scr_push_array(skincolors,c_white);
skincolors = scr_push_array(skincolors,make_colour_rgb(255,210,210));
skincolors = scr_push_array(skincolors,make_colour_rgb(255,220,160));
skincolors = scr_push_array(skincolors,make_colour_rgb(160,140,100));
skincolors = scr_push_array(skincolors,make_colour_rgb(70,60,35));
skincolors = scr_push_array(skincolors,make_colour_rgb(50,35,10));
global.skincolors = skincolors;

var races = scr_races();
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

chests = scr_push_array(chests,noone);
chests = scr_push_array(chests,spr_human_body1);
chests = scr_push_array(chests,spr_human_body2);
chests = scr_push_array(chests,spr_human_body3);
chests = scr_push_array(chests,spr_human_body4);
chests = scr_push_array(chests,spr_human_body5);
chests = scr_push_array(chests,spr_human_body6);

hairs[0]=noone;
hairs[1]=spr_human_hair1;
hairs[2]=spr_human_hair2;
hairs[3]=spr_human_hair3;
hairs[4]=spr_human_hair4;
hairs[5]=spr_human_hair5;

hats[0]=noone;
hats = scr_push_array(hats,spr_human_helm1);
hats = scr_push_array(hats,spr_human_helm2);
hats = scr_push_array(hats,spr_human_hat1);
hats = scr_push_array(hats,spr_human_hat2);
hats = scr_push_array(hats,spr_human_helm3);
hats = scr_push_array(hats,spr_human_helm4);

eyes = scr_push_array(eyes,noone);
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

chests[0]=spr_chicken_chest1;
hats[0]=spr_chicken_helm1;
hats[1]=spr_chicken_helm2;
hats[2]=spr_chicken_helm3;
hats[2]=spr_chicken_helm4;

a[0]=chests;
a[1]=hairs;
a[2]=hats;

global.accessories[1]=a;


