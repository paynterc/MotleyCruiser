/*************
Checks to see if any menu window is open

*************/
if(instance_exists(obj_dialog_control)){
    return (obj_trade.show || 
    obj_mission_log.show || 
    obj_inventory.show || 
    obj_message_box.show || 
    obj_dialog_control.show ||
    obj_game_control.panel_pause[4] ||
    obj_game_control.panel_load_game[4] ||
    instance_exists(obj_flybox)
    );
}else{
    return (obj_trade.show || 
    obj_mission_log.show || 
    obj_inventory.show || 
    obj_message_box.show ||
    obj_game_control.panel_pause[4] ||
    obj_game_control.panel_load_game[4] ||
    instance_exists(obj_form_textbox)
    );
}
