/// scr_get_mission_contacts_for_location()
var locName = scr_get_array_1d(global.landed_on,LOC_NAME);
var landedId = scr_get_array_1d(global.landed_on,LOC_GLOBAL_INDEX);

var locNpcs = noone;
var stageCount, objective, type, npc, objectiveLoc;


if(debug_mode){ show_debug_message("DEBUG: Checking for NPC Contacts at " + string(locName) ) }

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
                     npc = objective[? "npc"];// Should be an ID
                     objectiveLoc = objective[? "location"];// Should be an ID
                     if(!is_undefined(npc) && !is_undefined(objectiveLoc)){
          
                         if(objectiveLoc == landedId){
                             npcData = global.gx_people[| npc];
                             if(!is_undefined(npcData)){
                                npcData[@ NPC_MISSION] = mission[? "id"];
                                locNpcs = scr_push_array(locNpcs,npcData);
                             }
                         }                     
                     } 
                 }
             }         
    }

}

locNpcs = scr_array_nodupes(locNpcs);
return locNpcs;
