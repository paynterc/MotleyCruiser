/// scr_custom_sprite_deleteall()
var custom_sprite;
for(var i = 0; i < array_length_1d( obj_game_control.custom_sprites ); i++){
    custom_sprite = obj_game_control.custom_sprites[i];
    if(custom_sprite){
        sprite_delete(custom_sprite);
    }
}
