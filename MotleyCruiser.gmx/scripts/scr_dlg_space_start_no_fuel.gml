/// scr_dlg_space_start_no_fuel()
// Create "out of oxygen" dialogue box
if(instance_exists(obj_dialog_control)){
    if(!obj_ship_data.distressBeacon){
        /// Create "out of fuel" dialogue box
        obj_game_control.pauseForce = true;// Locks pause status. Can not be undone through "Continue" menu option.
        global.paused=true;
        with(obj_dialog_control){
            var txt = "You're out of fuel and adrift in space. Now what? You can send out a distress signal asking for help, try to manufacture some fuel out of resources or abandon ship.";
            scr_flywriter(txt,spr_ship_ai,true,"0,Distress call,Make fuel,Abandon ship,Cancel");
            state = dStates.spaceNoFuel;
        }
    }else{
        scr_queue_bark( "Distress beacon is already active.",spr_ship_ai);
    }

}
