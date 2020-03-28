/// scr_mission_objective_get(mission,stage)
var mission = argument0;
var stage = argument1;
var objectiveKey = "objective-"+string(stage);
var ob = mission[? objectiveKey];
return ob;
