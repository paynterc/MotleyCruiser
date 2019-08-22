/*******************
DO NOT DO THIS IN THE CREATE STEP. This seems to cause issues, leave artifacts. Try it in the STEP event or DRAW event, protecting it with a boolean 
variable so it won't be repeated.

https://docs.yoyogames.com/source/dadiospice/002_reference/game%20assets/sprites/sprite_create_from_surface.html
See also sprite_add_from_surface

Expects an array of arrays. Each subarray should contain a sprite index and a color. ie accessories( array(spr1,color1), array(spr2,color2) ).
If the first sprite has two frames, the script will make a 2 frame animation and impose all other sprites on top of both frames.
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
// Currently, the largest npc sprite would be 20x32. bounding boxes should be calculated automatically
// based on the size and transparency of the sprite.
if(_w==noone){
    //_w = 16;
    _w = 32;
}
if(_h==noone){
    //_h=24;
    _h=32;
}

_oX=_w/2;
_oY=_h-8;


var spr_custom=noone;
var surf=noone;
var surf2=noone;


surf  = surface_create(_w, _h);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

var spr=noone;
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
                draw_sprite_ext( spr, 0, _oX, _oY, 1, 1, 0, aData[1], 1 );
            }
        }
    }
}
spr_custom = sprite_create_from_surface(surf, 0, 0, _w, _h, false, false, _oX, _oY);
if(surface_exists(surf)){
    surface_free(surf);
}
surface_reset_target();

surf2 = surface_create(_w, _h);
surface_set_target(surf2);
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
                draw_sprite_ext( spr, subimg, _oX, _oY, 1, 1, 0, aData[1], 1 );
            }
        }
    }
}
sprite_add_from_surface(spr_custom, surf2, 0, 0, _w, _h, false, false);
if(surface_exists(surf2)){
    surface_free(surf2);
}
surface_reset_target();


return spr_custom;
