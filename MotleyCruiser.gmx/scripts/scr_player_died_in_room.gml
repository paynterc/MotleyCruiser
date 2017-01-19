/// Player has died while boarding ship or in other room

scr_display_message("You have died.","scr_game_load,"+string(global.game_loaded));
corpse = instance_create(x,y,obj_corpse);
corpse.sprite = sprite_index;

instance_destroy();
