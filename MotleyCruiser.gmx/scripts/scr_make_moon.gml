/// Create an array with moon attributes
// scr_make_moon(sector_row, sector_column, location index)
var map = scr_location();

var x1=0;
var y1=0;
var w1=0;
var clr=noone;
var min_width = sprite_get_width(spr_moon) / 5;
var max_width = sprite_get_width(spr_moon);

var sector = noone;
sector[0]=argument0;
sector[1]=argument1;
loc_index = argument2;

w1 = max(min_width, irandom(max_width));
x1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );
y1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );

map[LOC_TYPE]=GX_MOON;
map[LOC_X1]=x1;
map[LOC_Y1]=y1;
map[LOC_W1]=w1;
map[LOC_COLOR]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
map[LOC_SPRITE]=floor(random(sprite_get_number(spr_moon)));
map[LOC_SECTOR]=sector;
map[LOC_NPCS] = noone;
map[LOC_INDEX]=scr_make_loc_index(argument0,argument1,argument2);
var name = totro_plus(1,4,1,1,0);
map[LOC_NAME] = name;
map[LOC_NAME_1] = name[0];
map[LOC_ECONOMY]=irandom(3);
map[LOC_ECON_MOD] = random_range(.01,.05);
map[LOC_ECON_OFFSET] = irandom(global.commodity_lib_count -1);

return map;
