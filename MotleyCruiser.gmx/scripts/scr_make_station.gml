/// Create a dsmap with stations attributes
var map = noone;
map[5]=0;

var x1=0;
var y1=0;
var w1=0;
var clr=noone;

var min_width = sprite_get_width(spr_station) / 2;
var max_width = sprite_get_width(spr_station);

w1 = max(min_width, irandom(max_width));
x1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );
y1 = clamp( global.sector_width, w1/2, irandom(global.sector_width - (w1/2) ) );


var npcs = noone; // An array full of random NPCs
var npc_count = irandom_range(global.min_station_npc, global.max_station_npc);

for(var i=0; i < npc_count; i++){
   npcs[i]=scr_make_npc();
}


map[STATION_X1]=x1;
map[STATION_Y1]=y1;
map[STATION_W1]=w1;
map[STATION_COLOR]=make_colour_rgb(irandom(255),irandom(255),irandom(255));
map[STATION_SPRITE_INDEX]=floor(random(sprite_get_number(spr_station)));
map[STATION_NPCS]=npcs;

var station_index = scr_push_array_1d(global.stations,map);

return station_index;
