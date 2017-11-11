/// scr_crew_get_equip(slot,index);
var slot = argument0;
var index = argument1;//attribute of equipment. 6 holds the object id. 2 is the sprite.
var equipment=noone;
var weapon_id=noone;
var weapon_index=noone;


if(is_array(global.equipped) && slot < array_length_1d(global.equipped) ){
    weapon_id = global.equipped[slot];
    if(weapon_id!=noone){
        weapon_index = scr_inv_item_read(weapon_id,index);// index 6 holds the object name
    }
}

return weapon_index;
