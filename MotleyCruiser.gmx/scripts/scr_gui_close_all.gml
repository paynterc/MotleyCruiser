/// scr_gui_close_all()
if(instance_exists(obj_gui_control)){
    with(obj_gui_control){
        event_user(0);// close all and reset
    }
}
