/// scr_gui_has_context()
if(instance_exists(obj_gui_control)){
    return obj_gui_control.has_ball != noone;
}else{
    return false;
}
