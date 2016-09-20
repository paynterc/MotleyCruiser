/// Create a dsmap with attributes
var map = ds_map_create();

var x1=0;
var y1=0;
var w1=0;
var clr=noone;
var min_width = sprite_get_width(spr_planet) / 2;
var max_width = sprite_get_width(spr_planet) * 3;

var moons = noone;
var moonmax = 3;



w1 = max(min_width, irandom(max_width));
x1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );
y1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );

var mooncount = irandom_range(0,moonmax);
for(var i=0; i<mooncount; i++){
    moons[i]=scr_make_moon();
}
/***
var npcs = noone; // An array full of random NPCs
var npc_count = irandom_range(global.min_station_npc, global.max_station_npc);

for(var i=0; i < npc_count; i++){
    npcs[i]=scr_make_npc();
}
***/

map[? "x1"]=x1;
map[? "y1"]=y1;
map[? "w1"]=w1;
map[? "clr"]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
map[? "idx"]=floor(random(sprite_get_number(spr_planet)));
map[? "moons"]=moons;
//map[? "npcs"]=npcs;

return map;
