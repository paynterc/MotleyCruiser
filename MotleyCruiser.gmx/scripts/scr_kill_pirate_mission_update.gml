/// scr_kill_pirate_mission_update()
if(debug_mode){ show_debug_message("DEBUG: KILL PIRATE MISSION UPDATE") }
// Check for mission update
for (var k = ds_map_find_first(global.mission_map); !is_undefined(k); k = ds_map_find_next(global.mission_map, k)) {

    var mission = global.mission_map[? k];
    if(debug_mode){ show_debug_message("DEBUG: Checking mission: " + string(mission[? "id"]) ) }
    if(!mission[? "complete"]){
        var type = mission[? "type"];
        if(type==missionTypes.killXofY){
            var killType = mission[? "killType"];
            var killFaction = mission[? "killFaction"];
            var sectorX = mission[? "sectorX"];
            var sectorY = mission[? "sectorY"];

            if( !is_undefined(killType) && !is_undefined(killFaction) ){
                if(killType=="ship" && killFaction==FACTION_PIRATE){
                    if(is_undefined(sectorX)){
                        // increment kill count
                        mission[? "killedCurrent"] = min(mission[? "killedCurrent"] + 1, mission[? "killedRequired"]);
                    }else{
                        if(sectorX == global.sector_x && sectorY ==global.sector_y){
                            // increment kill count
                            mission[? "killedCurrent"] = min(mission[? "killedCurrent"] + 1, mission[? "killedRequired"]);
                            if(debug_mode){ show_debug_message("DEBUG: MISSION UPDATED. KILL COUNT SET TO: " + string(mission[? "killedCurrent"])) }
                        }
                    }
                    // Check status
                    
                    if(mission[? "stage"]==0 && mission[? "killedCurrent"] >= mission[? "killedRequired"]){
                        var objectives = mission[? "objectives"];
                        if(!is_undefined(objectives)){
                            // Advance to the next objective
                            if( array_length_1d(objectives) > 1 ){
                                mission[? "stage"] = 1;
                                if(debug_mode){ show_debug_message("DEBUG: MISSION STAGE HAS BEEN UPDATED TO: " + string(mission[? "stage"])) }
                            }
                        }else{
                            //Complete mission, grant rewards
                        }
                    }                           
                }
            }
        }
        
  }
      
}

