/// scr_add_mission(mission)

var mission = argument0;

var mId = mission[? "id"];
if(!is_undefined(mId)){
    if(debug_mode) show_debug_message("ERROR: The submitted mission already has an ID.");
    return false;
}

global.mission_id ++;
var missionKey = "m"+string(global.mission_id);
var missionValidate = ds_map_find_value(global.mission_map,missionKey);
if(!is_undefined(missionValidate)){
    if(debug_mode) show_debug_message("ERROR: That mission ID is already in use.");
    return false;
}

mission[? "id"] = missionKey;
ds_map_add_map(global.mission_map,missionKey,mission);

if(debug_mode){
    var lookupMission = ds_map_find_value(global.mission_map,missionKey);
    if(!is_undefined(lookupMission)){
        show_debug_message("DUBUG: Mission " + string(missionKey) + " added and looked up." );
        show_debug_message("DUBUG: Mission name is " + string(lookupMission[? "name"]) );
    }
}

return missionKey;
