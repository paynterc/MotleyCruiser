/// scr_show_window(menu object)
var menu = argument0;
if(instance_exists(menu)){
    scr_gui_set_context(menu);
    with(menu){
        event_user(0);// Show menu + associated steps
    }
}
