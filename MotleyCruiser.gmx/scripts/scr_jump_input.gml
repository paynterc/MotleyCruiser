/// scr_jump_input
if(scr_user_input(pin.sector_jump) && !disabled){
    if(scr_cargo_item_count(4)>0){ // Do we have one full unit of fuel?
        if(is_array(global.nav_queue) && array_length_1d(global.nav_queue)>0 ){
            jumpSector = scr_gx_popfirstnav();
            scr_play_sound(snd_boost_charging);
            max_spd_fwd_hold=max_spd_fwd;
            acc_spd_fwd_hold=acc_spd_fwd;
            max_spd_fwd *= 3;
            acc_spd_fwd *= 3;
            motion_add(image_angle,acc_spd_fwd);
            mode=MODE_JUMPING;
            tgt_angle=point_direction(global.sector_x,global.sector_y,jumpSector[0],jumpSector[1]);
            alarm[9]=room_speed*3;                           
        }else{
            scr_play_sound(snd_fail);
        }
    }else{
        scr_play_sound(snd_fail);
    }
   
}
