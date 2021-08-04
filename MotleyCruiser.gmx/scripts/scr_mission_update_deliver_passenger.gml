/// scr_mission_update_deliver_passenger()
if(debug_mode){ show_debug_message("DEBUG: Deliver Passenger MISSION UPDATE") }


// Iterate over missions
for (var k = ds_map_find_first(global.mission_map); !is_undefined(k); k = ds_map_find_next(global.mission_map, k)) {

    var mission = global.mission_map[? k];
    if(debug_mode){ show_debug_message("DEBUG: Checking mission: " + string(mission[? "id"]) ) }
    if(!mission[? "complete"]){
        
        // Get the current objective
        var currentObjective = scr_mission_objective_current(mission);
        if(is_undefined(currentObjective)) continue;
        if(debug_mode){ show_debug_message("DEBUG: Checking objective: " + string(currentObjective[? "description"]) ) }
        var objectiveType = currentObjective[? "type"];
        if(objectiveType==missionTypes.deliverPassenger){

            var locGlbIndx = currentObjective[? "location"];
            if( !is_undefined(locGlbIndx) ){
                
                if(locGlbIndx == scr_get_array_1d(global.landed_on,LOC_GLOBAL_INDEX) ){
                    
                    currentObjective[? "complete"]=true;

                    var npcData = scr_crew_findby(NPC_GLOBAL_INDEX,mission[? "npc"]);// Find first crewmember with this global index
                    scr_crew_set_inactive(scr_get_array_1d(npcData,NPC_CREW_INDEX));
                    scr_flybark("MISSION UPDATE: " + mission[? "name"]);
                    var check=1;
                    if(mission[? "stageCount"] > 1 ){
                        mission[? "stage"] = min(mission[? "stage"] +1, mission[? "stageCount"]);
                        if(debug_mode){ show_debug_message("DEBUG: Passenger MISSION STAGE HAS BEEN UPDATED TO: " + string(mission[? "stage"])) }
                    }else{
                        scr_mission_complete(mission[? "id"]);
                    }
                }
            }
        }
  }
      
}

