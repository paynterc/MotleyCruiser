///scr_gx_bodies_add(npc)
var npc = argument0;
var len = ds_list_size(global.gx_people);
npc[@ NPC_GLOBAL_INDEX] = len;
ds_list_add(global.gx_people,npc);
return len;
