/// Create a dsmap with attributes
var map = ds_map_create();

var x1=0;
var y1=0;
var w1=0;
var clr=noone;
var min_width = sprite_get_width(spr_moon) / 5;
var max_width = sprite_get_width(spr_moon);

w1 = max(min_width, irandom(max_width));
x1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );
y1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );

map[? "x1"]=x1;
map[? "y1"]=y1;
map[? "w1"]=w1;
map[? "clr"]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
map[? "idx"]=floor(random(sprite_get_number(spr_moon)));

return map;
