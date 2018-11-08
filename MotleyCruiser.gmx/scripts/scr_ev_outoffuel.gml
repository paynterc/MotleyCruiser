/**********
Present options
1. call for help 
2. manufacture fuel (requires mechanic or scientist)
3. abandon ship
***********/
/// scr_ev_outoffuel()
if(instance_exists(obj_dialog_control)){
    with(obj_dialog_control){
        alarm[1]=room_speed;
    }
}

