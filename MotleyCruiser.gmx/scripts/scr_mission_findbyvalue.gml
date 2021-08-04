/// scr_mission_findbyvalue(key,value)
var key = argument0;
var value = argument1;

var foundMission = noone;
for (var k = ds_map_find_first(global.mission_map); !is_undefined(k); k = ds_map_find_next(global.mission_map, k)) {
    var mission = global.mission_map[? k];
    if(mission[? key] == value){
        foundMission = mission;
        if(debug_mode){ show_debug_message("Found mission " + foundMission[? "id"]); }
        break;
    }
}

return foundMission;
