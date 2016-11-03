/// Generate a single mission with a unique id and return it as an array.
// scr_make_mission();

/**
var mission = ds_map_create();
ds_map_add(mission,"id", global.mission_id);
ds_map_add(mission,"text", argument0); //"I need somebody to deliver a thing to a guy."
ds_map_add(mission,"type", argument1);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(mission,"location", argument2);// array[x,y];
ds_map_add(mission,"reward", argument3);//100
ds_map_add(mission,"reward_type", argument4);//credits, item, crew, ship

TODO: Penalty for failure. Maybe run a script. Make an enemy.
**/

global.mission_id ++;
var mission = scr_mission();
mission[MISSION_ID]=global.mission_id;

return mission;
