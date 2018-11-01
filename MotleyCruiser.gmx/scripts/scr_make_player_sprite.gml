/// scr_make_player_sprite()

/*******************
Draws the player selections to a surface, then creates a sprite.

https://docs.yoyogames.com/source/dadiospice/002_reference/game%20assets/sprites/sprite_create_from_surface.html
https://docs.yoyogames.com/source/dadiospice/002_reference/game%20assets/sprites/sprite_save.html

see also sprite_add_from_surface
******************/


// Get player appearance selections
/// Make sprite
var spr_custom;
var surf;
var s_body;

/***
var a = global.accessories[0];
var tops = a[0];
var hairs = a[1];
var hats = a[2];
var eyes = a[3];
***/

var pm = scr_get_player_model();
//var skincolorsHuman = global.skincolors[0];
//var haircolorsHuman = global.haircolors[0];

// Assumes colors_skin, tops, hats, etc  were set in the creation step of the obj_player_edit
skincolor = colors_skin[pm[0]];
hair = hairs[pm[1]];
haircolor = haircolors[pm[2]];
top = tops[pm[3]];
hat = hats[pm[4]];
eye = eyes[pm[5]];


if(pm[6]==1){
    s_body=spr_human_fml;
}else{
    s_body=spr_human;
}


/***
s_body = spr_human;
skincolor = make_colour_rgb(50,35,10);
hair = spr_human_hair3;
haircolor=c_fuchsia;
top = spr_human_body1;
eye = noone;
hat = noone;
***/


surf = surface_create(24, 24);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);


draw_sprite_ext( s_body, 0, 12, 16, 1, 1, 0, skincolor, 1 );
if(hair != noone){
    draw_sprite_ext( hair, 0, 12, 16, 1, 1, 0, haircolor, 1 );
}

if(top != noone){
    draw_sprite(top, 0, 12, 16);
}
if(eye != noone){
    draw_sprite(eye, 0, 12, 16);
}
if(hat != noone){
    draw_sprite(hat, 0, 12, 16);
}

spr_custom = sprite_create_from_surface(surf, 0, 0, 24, 24, false, false, 8, 16);


draw_clear_alpha(c_black, 0);

draw_sprite_ext( s_body, 1, 12, 16, 1, 1, 0, skincolor, 1 );// Second frame
if(hair != noone){
    draw_sprite_ext( hair, 0, 12, 16, 1, 1, 0, haircolor, 1 );
}

if(top != noone){
    draw_sprite(top, 0, 12, 16);
}
if(eye != noone){
    draw_sprite(eye, 0, 12, 16);
}
if(hat != noone){
    draw_sprite(hat, 0, 12, 16);
}

sprite_add_from_surface(spr_custom, surf, 0, 0, 24, 24, false, false);

surface_free(surf);
surface_reset_target();

return spr_custom;
