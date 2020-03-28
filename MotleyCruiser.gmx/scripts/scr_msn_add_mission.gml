/// scr_msn_add_mission(mission)

var mission = argument0;

var mId = mission[? "id"];
if(!is_undefined(mId)){
    if(debug_mode) show_debug_message("ERROR: The submitted mission already has an ID.");
    return false;
}
