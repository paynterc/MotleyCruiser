/// Create a dsmap with stations attributes
// scr_make_station(sector_x,sector_y,location index)
var map = scr_location();

var x1=0;
var y1=0;
var w1=0;
var clr=noone;
var min_width = sprite_get_width(spr_station) / 2;
var max_width = sprite_get_width(spr_station);

var sector = noone;
sector[0]=argument0;
sector[1]=argument1;
loc_index = argument2;

w1 = max(min_width, irandom(max_width));
x1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );
y1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );

map[LOC_TYPE]=GX_STATION;
map[LOC_X1]=x1;
map[LOC_Y1]=y1;
map[LOC_W1]=w1;
map[LOC_COLOR]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
map[LOC_SPRITE]=floor(random(sprite_get_number(spr_station)));
map[LOC_SECTOR]=sector;
map[LOC_NPCS] = noone;
map[LOC_INDEX]=scr_make_loc_index(argument0,argument1,argument2);
var cmnName = scr_planet_name_generator();
show_debug_message("stationName:"+cmnName);
map[LOC_NAME] = cmnName;
map[LOC_NAME_1] = cmnName;
map[LOC_ECONOMY]=irandom(3);
map[LOC_ECON_MOD] = random_range(.01,.05);
map[LOC_ECON_OFFSET] = irandom(global.commodity_lib_count -1);
map[LOC_CONDITION]=choose("good","bad");
map[LOC_ATTITUDE]=choose("good","bad","mixed");
map[LOC_DESCRIPTION]=scr_station_description_generator(map);
map[LOC_SERVICES]=scr_loc_add_services();
return map;
