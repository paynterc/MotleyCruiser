/// Generate a single mission with a unique id and return it as a map.
// scr_make_mission(Text, Type, Location, Reward, RewardType);

var mission = ds_map_create();
global.mission_id ++;

ds_map_add(mission,"id", global.mission_id);
ds_map_add(mission,"text", argument0); //"I need somebody to deliver a thing to a guy."
ds_map_add(mission,"type", argument1);//smuggle, deliver, bounty, hit, escort, obtain
ds_map_add(mission,"location", argument2);// array[x,y];
ds_map_add(mission,"reward", argument3);//100
ds_map_add(mission,"reward_type", argument4);//credits, item, crew, ship

return mission;
