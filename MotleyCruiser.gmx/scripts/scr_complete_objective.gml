/// Check objective requirements and run objective script if complete. Send the index and type of the unit which prompted this check.
// scr_complete_objective(objective_id, global_index, global_type);
if(global.missions == noone) return false;

var obid=argument0;
var global_index=argument1;
var global_type=argument2;

var complete = false;
var objective = scr_find_objective(obid);

if(objective!=noone){

    switch (objective[OBJECTIVE_TYPE])
    {
        case "deliver":
            // Check to see if player has required inventory
            var item_count = inventory_item_find(objective[OBJECTIVE_REQUIRED_INVENTORY]);
            if(item_count >= objective[OBJECTIVE_REQUIRED_INVENTORY_COUNT]){
                inventory_delete_item(objective[OBJECTIVE_REQUIRED_INVENTORY],objective[OBJECTIVE_REQUIRED_INVENTORY_COUNT]);
                complete = true;
            }
            break;
        case "visit":
            // Check to see if player has arrived at a target location or npc.
            if(global_index != noone && global_type != noone){
                var entity = scr_get_location(global_type, global_index);
                if(entity != noone){
                    complete = true;
                }                
            }
            
            break;
            
            
        default:
          // Do other stuff;
    
    }    
    
    if(complete){
        // Update the objective to complete in the global 
        objective[@ OBJECTIVE_STATE]="complete";
        sound_play(snd_laser1);
        
        //Find next objective and set it to active
        var mission = scr_find_mission(objective[OBJECTIVE_MISSION_ID]);
        if(mission != noone){
            var objectives = mission[MISSION_OBJECTIVES];
            var obcount = array_length_1d(objectives);
            if(obcount>1){
                for(var i = 0; i<obcount; i++){
                    var obchx = objectives[i];

                    if(obchx[OBJECTIVE_STATE]=="inactive"){
                        obchx[@ OBJECTIVE_STATE]="active";
                        break;
                    }
                }
            }
        }
        
        scr_complete_mission(objective[OBJECTIVE_MISSION_ID]);
        
              
    }

}

return complete;
