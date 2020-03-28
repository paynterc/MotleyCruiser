///scr_add_restriction(npc,restriction)
var npc = argument0;
var restriction = argument1;

npc[@ NPC_RESTRICTIONS] = scr_push_array(npc[@ NPC_RESTRICTIONS],restriction);
