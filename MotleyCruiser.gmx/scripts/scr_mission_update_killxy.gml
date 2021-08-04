/// scr_mission_update_killxy()
if(debug_mode){ show_debug_message("DEBUG: KILL XofY MISSION UPDATE") }

// Iterate over missions
for (var k = ds_map_find_first(global.mission_map); !is_undefined(k); k = ds_map_find_next(global.mission_map, k)) {

    var mission = global.mission_map[? k];
    if(debug_mode){ show_debug_message("DEBUG: Checking mission: " + string(mission[? "id"]) ) }
    var showBark = false;
    if(!mission[? "complete"]){
        
        // Get the current objective
        var currentObjective = scr_mission_objective_current(mission);
        if(is_undefined(currentObjective)) continue;
        if(debug_mode){ show_debug_message("DEBUG: Checking objective: " + string(currentObjective[? "description"]) ) }
        var type = currentObjective[? "type"];
        if(type==missionTypes.killXofY){
            var killType = currentObjective[? "killType"];
            var killFaction = currentObjective[? "killFaction"];
            var sectorX = currentObjective[? "sectorX"];
            var sectorY = currentObjective[? "sectorY"];

            if( !is_undefined(killType) && !is_undefined(killFaction) ){
                if(killType=="ship" && killFaction==FACTION_PIRATE){
                    if(is_undefined(sectorX)){
                        // increment kill count
                        currentObjective[? "killedCurrent"] = min(currentObjective[? "killedCurrent"] + 1, currentObjective[? "killedRequired"]);
                        showBark = true;
                    }else{
                        if(sectorX == global.sector_x && sectorY ==global.sector_y){
                            // increment kill count
                            currentObjective[? "killedCurrent"] = min(currentObjective[? "killedCurrent"] + 1, currentObjective[? "killedRequired"]);
                            showBark = true;
                            if(debug_mode){ show_debug_message("DEBUG: MISSION UPDATED. KILL COUNT SET TO: " + string(currentObjective[? "killedCurrent"])) }
                        }
                    }
                    
                    if(showBark) scr_flybark("MISSION UPDATED: " + mission[? "name"] + ". " + string(currentObjective[? "killedCurrent"]) + " of " + string(currentObjective[? "killedRequired"]));
                     
                    // Check status                   
                    if(currentObjective[? "killedCurrent"] >= currentObjective[? "killedRequired"]){
                        currentObjective[? "complete"]=true;
                        if(mission[? "stageCount"] > 1 ){
                            mission[? "stage"] = min(mission[? "stage"] +1, mission[? "stageCount"]);
                            if(debug_mode){ show_debug_message("DEBUG: MISSION STAGE HAS BEEN UPDATED TO: " + string(mission[? "stage"])) }
                        }else{
                            scr_mission_complete(mission[? "id"]);
                        }
                    }                           
                }
            }
        }
  }
      
}

