/// Create a planet with attributes
// scr_make_planet(sector_row, sector_column)
var map = noone;


var x1=0;
var y1=0;
var w1=0;
var clr=noone;
var min_width = sprite_get_width(spr_planet) / 2;
var max_width = sprite_get_width(spr_planet) * 3;

var sector = noone;
sector[0]=argument0;
sector[1]=argument1;

var moons = noone;
var moonmax = 3;



w1 = max(min_width, irandom(max_width));
x1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );
y1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );



map[PLANET_X1]=x1;
map[PLANET_Y1]=y1;
map[PLANET_W1]=w1;
map[PLANET_COLOR]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
map[PLANET_MOONS]=noone;
map[PLANET_SPRITE_INDEX]=floor(random(sprite_get_number(spr_planet)));
map[PLANET_SECTOR]=sector;
map[PLANET_NPCS] = noone;
map[PLANET_SUN] = noone;


return map;
