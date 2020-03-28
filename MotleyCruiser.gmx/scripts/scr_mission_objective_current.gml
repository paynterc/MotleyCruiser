/// scr_mission_objective_current(mission)
var mission = argument0;
var stage = mission[? "stage"];
var objectiveKey = "objective-"+string(stage);
var currentObjective = mission[? objectiveKey];
return currentObjective;
