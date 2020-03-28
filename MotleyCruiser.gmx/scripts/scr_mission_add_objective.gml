/// scr_mission_add_objective(mission,objective)

var mission = argument0;
var objective = argument1;

var stageCount = mission[? "stageCount"]
if(is_undefined(stageCount)){
    stageCount = 1;
}else{
    stageCount = stageCount +1;
}

var stageIndex = max(0,stageCount-1);//start at zero
var objectiveIndex = "objective-"+string(stageIndex);

ds_map_add_map(mission,objectiveIndex,objective);
mission[? "stageCount"] = stageCount;
