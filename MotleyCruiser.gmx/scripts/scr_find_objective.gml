/// Search through missions for objective id
// scr_find_objective(objective_id);
var obid=argument0;
var objective = noone;
for(var i = 0; i<array_length_1d(global.missions); i++){
    var mission=global.missions[i];
    var objectives = mission[MISSION_OBJECTIVES];
    if(objectives != noone){
        for(var o=0; o < array_length_1d(objectives); o++){
            var objective = objectives[o];
            if(objective[OBJECTIVE_ID]==obid){                            
                return objective;
            }
        }    
    }    
}

return noone;
