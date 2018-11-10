/// scr_dlg_space_start_no_food()
// Create "out of water" dialogue box
if(instance_exists(obj_dialog_control)){
    obj_game_control.pauseForce = true;// Locks pause status. Can not be undone through "Continue" menu option.
    global.paused=true;
    with(obj_dialog_control){
        var txt = "You're out of food. There's always cannibalism.";
        scr_flywriter(txt,spr_ship_ai,true,"0,Eat somebody,Abandon ship,Cancel");
        state = dStates.spaceNoFood;
    }
}
