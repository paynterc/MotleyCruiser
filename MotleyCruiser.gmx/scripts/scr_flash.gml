/// Slows down time
if(!global.bullet_time && instance_exists(obj_flash_timer)){
    global.bullet_time=true;
    audio_play_sound(snd_slowdown,1,0);
    with(obj_flash_timer){
        event_user(0);
    }
    scr_hotbar_update();
}
