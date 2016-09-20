/// Create a dsmap with sun attributes
var sun = ds_map_create();

var x1=0;
var y1=0;
var w1=0;
var clr=noone;
var min_width = sprite_get_width(spr_sun) / 2;
var max_width = sprite_get_width(spr_sun) * 3;

var planets = noone;
var planetmax = 5;


w1 = max(min_width, irandom(max_width));
x1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );
y1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );

var planetcount = irandom_range(0,planetmax);
for(var i=0; i<planetcount; i++){
    planets[i]=scr_make_planet();
}

sun[? "x1"]=x1;
sun[? "y1"]=y1;
sun[? "w1"]=w1;
sun[? "clr"]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
sun[? "planets"]=planets;

return sun;
