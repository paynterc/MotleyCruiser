/// scr_ev_sold_slave(npcData)
var npcData = argument0;

if(debug_mode){ show_debug_message("DEBUG: Event Sold slave.") }

var mission = scr_mission_find_by_npc(npcData);
if(mission!=noone){
    mission[? "complete"]=true;
}
