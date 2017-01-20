/*******************
https://docs.yoyogames.com/source/dadiospice/002_reference/game%20assets/sprites/sprite_create_from_surface.html
******************/
//scr_surface_to_sprite()
var spr_Body = argument0;
var spr_Clothes = argument1;
var spr_Hair = argument2;
var surf;
surf = surface_create(32, 32);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_sprite(spr_Body, 0, 0, 0);
draw_sprite(spr_Clothes, 0, 0, 0);
draw_sprite(spr_Hair, 0, 0, 0);
var spr_custom = sprite_create_from_surface(surf, 0, 0, 32, 32, true, true, 16, 16);
surface_reset_target();
surface_free(surf);

return spr_custom;
