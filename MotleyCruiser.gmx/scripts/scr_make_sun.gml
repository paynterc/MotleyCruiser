/// Create a dsmap with sun attributes
var sun = noone;
sun[4] = 0;// Initialize array with 5 slots.

var x1=0;
var y1=0;
var w1=0;
var clr=noone;
var min_width = sprite_get_width(spr_sun) / 2;
var max_width = sprite_get_width(spr_sun) * 3;

var planets = noone;
var planetmax = 2;


w1 = max(min_width, irandom(max_width));
x1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );
y1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );

var planetcount = irandom_range(0,planetmax);
for(var i=0; i<planetcount; i++){
    planets[i]=scr_make_planet();
}

sun[SUN_X1]=x1;
sun[SUN_Y1]=y1;
sun[SUN_W1]=w1;
sun[SUN_COLOR]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
sun[SUN_PLANETS]=planets;

var sun_index = scr_push_array_1d(global.suns,sun);


return sun_index;
