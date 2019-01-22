/// scr_ev_player_died_in_space
if(global.game_loaded!=noone){
    with(obj_game_control){
        event_user(0);
    }
}else{
    scr_rm_persistence();
    room_goto(rm_main_menu);
}
