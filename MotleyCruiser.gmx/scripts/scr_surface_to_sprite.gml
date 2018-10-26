/*******************
https://docs.yoyogames.com/source/dadiospice/002_reference/game%20assets/sprites/sprite_create_from_surface.html

see also sprite_add_from_surface
******************/
/// scr_surface_to_sprite(color_array,body,sprite, sprite, sprite)
var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}
if(args==noone) return false;
if(array_length_1d(args)<2) return false;
if(!is_array(args[0])) return false;
if(args[1]==noone) return false;

var colors = args[0]
var s_body = args[1];
var spr_custom;
var surf;

surf = surface_create(16, 24);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);


var skincolor = scr_get_array_1d(colors,0);
if(skincolor==noone){
    skincolor=c_white;
}
draw_sprite_ext( s_body, 0, 8, 16, 1, 1, 0, skincolor, 1 );
//draw_sprite(s_body, 0, 8, 16);
var thisColor;
for(var i = 2;i<array_length_1d(args);i++){
    if(args[i]!=noone){
        //draw_sprite(args[i], 0, 8, 16);
        if(scr_get_array_1d(colors,i)!=noone){
            thisColor = scr_get_array_1d(colors,i);
        }else{
            thisColor =c_white;
        }
        draw_sprite_ext( args[i], 0, 8, 16, 1, 1, 0, thisColor, 1 );
    }
}
spr_custom = sprite_create_from_surface(surf, 0, 0, 16, 24, false, false, 8, 16);


surface_free(surf);
surf = surface_create(16, 24);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

//draw_sprite(s_body, 1, 8, 16);// Second frame
draw_sprite_ext( s_body, 0, 8, 16, 1, 1, 0, skincolor, 1 );
for(var i = 1;i<array_length_1d(args);i++){
    if(args[i]!=noone){
        //draw_sprite(args[i], 0, 8, 16);
        if(scr_get_array_1d(colors,i)!=noone){
            thisColor = scr_get_array_1d(colors,i);
        }else{
            thisColor =c_white;
        }
        draw_sprite_ext( args[i], 0, 8, 16, 1, 1, 0, thisColor, 1 );
    }
}
sprite_add_from_surface(spr_custom, surf, 0, 0, 16, 24, false, false);

surface_reset_target();
surface_free(surf);

return spr_custom;
