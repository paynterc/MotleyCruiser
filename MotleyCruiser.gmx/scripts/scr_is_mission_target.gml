/// Check to see if an entitiy is a mission target
// scr_is_mission_target(type,global_index)
var type = argument0;
var index = argument1;

var target = scr_get_location(type,index);


//Cycle through current missions
for(var i = 0; i<array_length_1d(global.missions); i++){
    var mission = global.missions[i];
    if(mission[MISSION_STATE]!="completed" && mission[MISSION_STATE]!="failed"){
        var objectives = mission[MISSION_OBJECTIVES];
        for(var o = 0; o < array_length_1d(objectives); o++){
            var objective = objectives[o];
            if(objective[OBJECTIVE_STATE]=="active" && objective[OBJECTIVE_TARGET_TYPE]==type && objective[OBJECTIVE_TARGET_INDEX]==index){
                return true;
            }            
        }    
    }       
}

return false;
