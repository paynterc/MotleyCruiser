/*******************
https://docs.yoyogames.com/source/dadiospice/002_reference/game%20assets/sprites/sprite_create_from_surface.html

see also sprite_add_from_surface
******************/
//scr_surface_to_sprite()
var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}
if(args==noone) return false;
if(args[0]==noone) return false;

var s_body = args[0];
var spr_custom;
var surf;

surf = surface_create(16, 24);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

draw_sprite(s_body, 0, 8, 16);
for(var i = 1;i<array_length_1d(args);i++){
    if(args[i]!=noone){
        draw_sprite(args[i], 0, 8, 16);
    }
}
spr_custom = sprite_create_from_surface(surf, 0, 0, 16, 24, false, false, 8, 16);


surface_free(surf);
surf = surface_create(16, 24);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

draw_sprite(s_body, 1, 8, 16);// Second frame
for(var i = 1;i<array_length_1d(args);i++){
    if(args[i]!=noone){
        draw_sprite(args[i], 0, 8, 16);
    }
}
sprite_add_from_surface(spr_custom, surf, 0, 0, 16, 24, false, false);

surface_reset_target();
surface_free(surf);

return spr_custom;
