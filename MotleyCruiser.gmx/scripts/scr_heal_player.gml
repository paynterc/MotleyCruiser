/// Add health to player
//scr_heal_player(amount);
var amt = real(argument0);
if(instance_exists(obj_player)){
    obj_player.hp_current = min(obj_player.hp, obj_player.hp_current + amt);
    scr_hotbar_update();
}

