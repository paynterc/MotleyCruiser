/*******************
https://docs.yoyogames.com/source/dadiospice/002_reference/game%20assets/sprites/sprite_create_from_surface.html

see also sprite_add_from_surface

Expects an array of arrays. Each subarray should contain a sprite index and a color.
******************/
/// scr_surface_to_sprite(array of arrays)

var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}


var _spriteData = args[0];
if( !is_array(_spriteData) || !is_array(_spriteData[0]) ){
    return false;
}

var _w = args[1];
var _h = args[2];
if(_w==noone){
    _w = 16;
}
if(_h==noone){
    _h=24;
}

var spr_custom;
var surf;

surf = surface_create(_w, _h);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);


var spr;
if(is_array(_spriteData)){
    for(var i = 0; i<array_length_1d(_spriteData); i++){
        var aData = _spriteData[i];
        if(is_array(aData)){
            if(aData[0]!=noone){
                if(sprite_exists(aData[0])){
                    spr = aData[0];
                }else{
                    spr = spr_default;
                }
                draw_sprite_ext( spr, 0, 8, 16, 1, 1, 0, aData[1], 1 );
            }
        }
    }
}
spr_custom = sprite_create_from_surface(surf, 0, 0, _w, _h, false, false, 8, 16);


surface_free(surf);
surf = surface_create(_w, _h);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

//draw_sprite(s_body, 1, 8, 16);// Second frame
if(is_array(_spriteData)){
    for(var i = 0; i<array_length_1d(_spriteData); i++){
        var aData = _spriteData[i];
        if(is_array(aData)){
            if(aData[0]!=noone){
                if(sprite_exists(aData[0])){
                    spr = aData[0];
                }else{
                    spr = spr_default;
                }
                var subimg = 0;
                if(sprite_get_number(spr)>1){
                    subimg = 1;
                }
                draw_sprite_ext( spr, subimg, 8, 16, 1, 1, 0, aData[1], 1 );
            }
        }
    }
}
sprite_add_from_surface(spr_custom, surf, 0, 0, _w, _h, false, false);

surface_reset_target();
surface_free(surf);

return spr_custom;
