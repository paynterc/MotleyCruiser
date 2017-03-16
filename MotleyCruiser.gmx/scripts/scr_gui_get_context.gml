//scr_gui_get_context(string);
if( instance_exists(obj_gui_control) ){
    return obj_gui_control.has_ball;
}else{
    return noone;
}
