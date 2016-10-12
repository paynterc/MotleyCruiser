/// Create a dsmap with attributes
var map = noone;
map[4]=0;

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

var npcs = noone; // An array full of random NPCs
var npc_count = irandom_range(global.min_station_npc, global.max_station_npc);

for(var i=0; i < npc_count; i++){
   npcs[i]=scr_make_npc();
}
map[MOON_NPCS] = npcs;


var moon_index = scr_push_array_1d(global.moons,map);

return moon_index;
