/// Player has died while boarding ship or in other room

corpse = instance_create(x,y,obj_corpse);
corpse.sprite = sprite_index;

if(global.game_loaded!=noone){
    scr_display_message("You have died.","scr_game_load,"+string(global.game_loaded));
}else{
    room_goto(rm_main_menu);
}


instance_destroy();
