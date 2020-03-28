///scr_remove_restriction(npc,restriction)
var npc = argument0;
var restriction = argument1;

npc[@ NPC_RESTRICTIONS] = scr_array_remove(npc[@ NPC_RESTRICTIONS],restriction);
