/// Create a dsmap with stations attributes
// scr_make_station(sector_row,sector_column)
var map = scr_ent_station();


var x1=0;
var y1=0;
var w1=0;
var clr=noone;
var sector = noone;

sector[0]=argument0;
sector[1]=argument1;

var min_width = sprite_get_width(spr_station) / 2;
var max_width = sprite_get_width(spr_station);

w1 = max(min_width, irandom(max_width));
x1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );
y1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );

map[STATION_X1]=x1;
map[STATION_Y1]=y1;
map[STATION_W1]=w1;
map[STATION_COLOR]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
map[STATION_SPRITE_INDEX]=floor(random(sprite_get_number(spr_station)));
map[STATION_NPCS]=noone;
map[STATION_SECTOR]=sector;
map[STATION_NAME] = totro_plus(1,4,1,0,0);
map[STATION_ECONOMY]=irandom(3);
map[STATION_ECON_MOD] = random_range(.25,1.25);
map[STATION_ECON_OFFSET] = random(1);

return map;
