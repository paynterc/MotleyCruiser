/// Get all mission objectives for this entity
// scr_is_entity_objectives(type,global_index)
var type = argument0;
var index = argument1;
if(type==noone || index == noone) return noone;

var target = scr_get_location(type,index);
var myobjectives = noone;

//Cycle through current missions
for(var i = 0; i<array_length_1d(global.missions); i++){
    var mission = global.missions[i];
    if(mission[MISSION_STATE]!="completed" && mission[MISSION_STATE]!="failed"){
        var objectives = mission[MISSION_OBJECTIVES];
        for(var o = 0; o < array_length_1d(objectives); o++){
            var objective = objectives[o];
            if(objective[OBJECTIVE_STATE]=="active" && objective[OBJECTIVE_TARGET_TYPE]==type && objective[OBJECTIVE_TARGET_INDEX]==index){
                myobjectives = scr_push_array(myobjectives,objective);
            }            
        }    
    }       
}

return myobjectives;
