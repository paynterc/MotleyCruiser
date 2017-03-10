/// Create a dsmap with attributes
var map = scr_ent_moon();

var sector = noone;
sector[0]=argument0;
sector[1]=argument1;

var x1=0;
var y1=0;
var w1=0;
var clr=noone;
var min_width = sprite_get_width(spr_moon) / 5;
var max_width = sprite_get_width(spr_moon);

w1 = max(min_width, irandom(max_width));
x1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );
y1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );

map[MOON_X1]=x1;
map[MOON_Y1]=y1;
map[MOON_W1]=w1;
map[MOON_COLOR]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
map[MOON_SPRITE_INDEX]=floor(random(sprite_get_number(spr_moon)));
map[MOON_SECTOR]=sector;
map[MOON_NPCS] = noone;
map[MOON_PLANET]=noone;
map[MOON_NAME] = totro_plus(1,4,1,0,0);
map[MOON_ECONOMY]=irandom(3);
map[MOON_ECON_MOD] = random_range(.25,1.25);
map[MOON_ECON_OFFSET] = random(1);

return map;
