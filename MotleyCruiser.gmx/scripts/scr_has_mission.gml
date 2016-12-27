/// Check to see if player already has an ACTIVE mission from the given npc
// scr_check_mission(npc_id);
var check_mission = noone;
var has_mission = false;
var npc_id = argument0;
if(npc_id==noone || global.missions == noone) return false;


for(var i=0;i< array_length_1d(global.missions);i++)
{
    check_mission = global.missions[i];
    if(MISSION_GRANTED_BY>=array_length_1d(check_mission)){
        continue;// Ignore this one if the mission doesn't have the MISSION_GRANTED_BY attribute.
    }
    if(npc_id == check_mission[MISSION_GRANTED_BY] && check_mission[MISSION_STATE]=="active"){
        has_mission = true;
        break;
    }
}

return has_mission;
