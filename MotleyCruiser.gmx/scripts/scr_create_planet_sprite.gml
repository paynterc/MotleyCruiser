/*******************
DO NOT DO THIS IN THE CREATE STEP. This seems to cause issues, leave artifacts. Try it in the STEP event or DRAW event, protecting it with a boolean 
variable so it won't be repeated.

https://docs.yoyogames.com/source/dadiospice/002_reference/game%20assets/sprites/sprite_create_from_surface.html
See also sprite_add_from_surface

Layer each sprite, starting from the first.
Expects an array of arrays. Each subarray should contain a sprite subimage, a rotation and a color. ie accessories( array(subimage,rotation,color1), array(subimage,rotation,color2) ).

The actual sprite files themselves will be hardcoded as spr_planet_clr, spr_planet_con (continents), spr_planet_atmo (atmosphere), spr_planet_shading

******************/
/// scr_surface_to_sprite(planet data)
var map = argument0;
var _spriteData = map[LOC_IMAGE_DATA];//array of arrays
if( !is_array(_spriteData) || !is_array(_spriteData[0]) ){
    return spr_planet_clr;
}


var _w = sprite_get_width(spr_planet_clr);
var _h = sprite_get_height(spr_planet_clr);


var spr_custom=noone;
var surf=noone;
var surf2=noone;
var aData;
var o1=_w/2;
var o2=_h/2;
var spr2;
if(map[LOC_TYPE]==GX_MOON){
    spr2=spr_moon_con;
}else{
    spr2=spr_planet_con;
}

surf  = surface_create(_w, _h);
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

// Draw base color and body
aData = _spriteData[0];
if(is_array(aData)){
    if(aData[0]!=noone){
        draw_sprite_ext( spr_planet_clr, 0, o1, o2, 1, 1, 0, aData[2], 1 );
    }
}

if(array_length_1d(_spriteData)>1){
    // Draw continent
    aData = _spriteData[1];
    if(is_array(aData)){
        if(aData[0]!=noone){
            draw_sprite_ext( spr2, aData[0], o1, o2, 1, 1, aData[1], aData[2], 1 );
        }
    }
    
    // Draw atmosphere
    aData = _spriteData[2];
    if(is_array(aData)){
        if(aData[0]!=noone){
            //draw_sprite_ext( spr_planet_atmo, 6, o1, o2, 1, 1, aData[1], aData[2], 1 );
        }
    }
    
}

draw_sprite_ext( spr_planet_shading, 0, o1, o2, 1, 1, 0, c_white, .5 );

spr_custom = sprite_create_from_surface(surf, 0,0, _w, _h, false, false, o1, o2);
if(surface_exists(surf)){
    surface_free(surf);
}
surface_reset_target();

return spr_custom;
