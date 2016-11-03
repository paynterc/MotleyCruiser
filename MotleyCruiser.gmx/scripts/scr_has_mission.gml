/// Check to see if player already has a mission
// scr_check_mission(mission);
var check_mission = noone;
var has_mission = false;
if(argument0==noone || global.missions == noone) return false;


for(var i=0;i< array_length_1d(global.missions);i++)
{
    check_mission = global.missions[i];
    if(argument0[MISSION_ID] == check_mission[MISSION_ID]){
        has_mission = true;
        break;
    }
}

return has_mission;
