/// scr_dlg_space_start_no_oxy()
// Create "out of oxygen" dialogue box
if(instance_exists(obj_dialog_control)){
    obj_game_control.pauseForce = true;// Locks pause status. Can not be undone through "Continue" menu option.
    global.paused=true;
    with(obj_dialog_control){
        txt = "You can manufacture oxygen. Producing 1 unit of oxygen will require 2 units of water and 1 unit of fuel.";
        scr_flywriter(txt,spr_ship_ai,true,"0,Make oxygen,Abandon ship,Cancel");
        state = dStates.spaceNoOxygen;
    }
}
