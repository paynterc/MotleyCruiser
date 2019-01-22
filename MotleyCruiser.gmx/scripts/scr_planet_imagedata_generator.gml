/// scr_planet_imagedata_generator(location data)
/*******



*******/
var map = argument0;
var terrain = map[LOC_TERRAIN];
var clr1,clr2,clr3;
var clrR1=255;
var clrR2=255;
var clrR3=255;
var sprContintents;
var greens = scr_array(terrains.forest,terrains.jungle,terrains.swamp);
var blues = scr_array(terrains.ocean,terrains.glacier);
var reds = scr_array(terrains.desert,terrains.plains);
if( scr_in_array(reds,terrain)  ){
    clrR1=irandom_range(155,255);
    clrR2=irandom_range(0,100);
    clrR3=irandom_range(0,50);
}else if( scr_in_array(blues,terrain) ){
    clrR1=irandom_range(0,50);
    clrR3=irandom_range(200,255);
}else if( scr_in_array(greens,terrain) ){
    clrR1=irandom_range(0,50);
    clrR2=irandom_range(200,255);
}
    
clr1 = make_colour_rgb( irandom(clrR1), irandom(clrR2), irandom(clrR3) );
clr2 = make_colour_rgb( irandom(clrR1), irandom(clrR2), irandom(clrR3) );
clr3 = make_colour_rgb( irandom(clrR1), irandom(clrR2), irandom(clrR3) );

if(map[LOC_TYPE]==GX_MOON){
    sprContintents=spr_moon_con;
}else{
    sprContintents=spr_planet_con;
}
var subImageCount = sprite_get_number(sprContintents);
var subImage = irandom(subImageCount-1);
var test = 1;
rslt = scr_array( scr_array(0,0,clr1), scr_array( subImage, irandom(360),clr2), scr_array(0,0,clr3));

return rslt;

