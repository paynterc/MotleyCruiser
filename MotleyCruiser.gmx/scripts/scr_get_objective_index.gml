/// Return the index of the submitted objective
// scr_get_objective_index(objective)
var objective=argument0;

if(objective == noone) return noone;

var mission = scr_find_mission(objective[OBJECTIVE_MISSION_ID]);
if(mission != noone){
    var objectives = mission[MISSION_OBJECTIVES];
    var obcount = array_length_1d(objectives);
    if(obcount>1){
        for(var i = 0; i<obcount; i++){
            var obchx = objectives[i];
            if(obchx[OBJECTIVE_ID]==objective[OBJECTIVE_ID]){
                return i;
            }
        }
    }
}

return noone;
