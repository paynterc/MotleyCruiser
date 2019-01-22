/// Start boost
if(!boosting && !boost_cooldown){
    boosting=true;
    max_spd_fwd_hold=max_spd_fwd;
    acc_spd_fwd_hold=acc_spd_fwd;
    max_spd_fwd *= 2;
    acc_spd_fwd *= 3;
    motion_add(image_angle,acc_spd_fwd);
    scr_play_sound_at(snd_boost_launch,x,y);
    alarm[8]=room_speed*2;
}

