/// scr_dlg_space_start_no_water()
// Create "out of water" dialogue box
if(instance_exists(obj_dialog_control)){
    obj_game_control.pauseForce = true;// Locks pause status. Can not be undone through "Continue" menu option.
    global.paused=true;
    with(obj_dialog_control){
        var txt = "You can manufacture oxygen. Producing 1 unit of oxygen will require 2 units of oxygen and 1 unit of fuel.";
        scr_flywriter(txt,spr_ship_ai,true,"0,Make water,Abandon ship,Cancel");
        state = dStates.spaceNoWater;
    }
}
