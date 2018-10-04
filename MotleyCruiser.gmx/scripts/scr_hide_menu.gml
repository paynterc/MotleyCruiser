/// scr_hide_menu(menu object)
var menu = argument0;
if(instance_exists(menu)){
    with(menu){
        event_user(1);// Hide menu + associated steps
    }
}
