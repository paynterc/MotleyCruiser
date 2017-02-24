/// Player has died while boarding ship or in other room

corpse = instance_create(x,y,obj_corpse);
corpse.sprite = sprite_index;

if(global.game_loaded!=noone){
    with(obj_game_control){
        event_user(0);
    }
}else{
    room_goto(rm_main_menu);
}


instance_destroy();
