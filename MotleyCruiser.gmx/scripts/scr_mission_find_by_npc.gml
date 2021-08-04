/// scr_mission_find_by_npc(npcData)
// Find an active mission with an active objective for the npc
var npcData = argument0;
var npcId = scr_get_array_1d(npcData,NPC_GLOBAL_INDEX);
if(npcId==noone) return noone;

if(debug_mode){ show_debug_message("DEBUG: Looking for NPC in missions.") }
var stageCount, msnNpcId, objective;
var foundMission = noone;
for (var k = ds_map_find_first(global.mission_map); !is_undefined(k); k = ds_map_find_next(global.mission_map, k)) {
    var mission = global.mission_map[? k];

    if(!mission[? "complete"]){
    
        // Go through the objectives and find any that need an npc at this location
         stageCount = mission[? "stageCount"];
         if(!is_undefined(stageCount)){
             for(var i=0; i < stageCount; i++){
                 objective = scr_mission_objective_get(mission,i);   
                 if(is_undefined(objective)){
                   if(debug_mode){ show_debug_message("DEBUG: Undefined objective: " + string(i)) }
                   continue;
                 }
                 if(objective[? "complete"]=true) continue;
                 msnNpcId = objective[? "npc"];// Should be an ID
                 if(!is_undefined(msnNpcId)){
                    foundMission = mission;
                    break;
                 } 
             }
         }         
    }
    if(foundMission!=noone){
        break;
    }

}

return foundMission;
