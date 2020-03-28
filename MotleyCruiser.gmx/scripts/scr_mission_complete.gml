/// scr_mission_complete()
var missionId = argument0;
var mission = global.mission_map[? missionId];
if(is_undefined(mission)) return false;

mission[? "complete"]=true;
// Grant rewards
scr_mission_grant_rewards(mission[? "rewards"]);

