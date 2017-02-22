/// Grant a random weapon to an npc
// scr_grant_random_weapon()

var weapon_list = scr_npc_weapons();
var weapon_id = scr_array_random(weapon_list);
weapon_index = scr_inv_item_read(weapon_id,6);// Slot 6 holds the object name
if(weapon_index!=noone && object_exists(weapon_index)){
    return weapon_id;
}

return noone;
