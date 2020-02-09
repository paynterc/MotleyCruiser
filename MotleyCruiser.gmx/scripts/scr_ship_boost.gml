/// Start boost
if(!boosting && !boost_cooldown){
    boosting=true;
    max_spd_fwd_current = max_spd_fwd * 3;
    acc_spd_fwd_current = acc_spd_fwd * 4;
    
    decel_step = (max_spd_fwd_current - max_spd_fwd)/(room_speed*4)
    
    motion_add(image_angle,acc_spd_fwd_current*3);
    scr_play_sound_at(snd_boost_launch,x,y);
    alarm[8]=room_speed*2;
}

