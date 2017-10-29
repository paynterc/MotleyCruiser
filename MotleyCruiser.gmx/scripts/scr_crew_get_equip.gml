/// scr_crew_get_equip(npc_data,slot,index);
var npc_data = argument0;
var slot = argument1;
var index = argument2;//attribute of equipment. 6 holds the object id. 2 is the sprite.
var equipment=noone;
var weapon_id=noone;
var weapon_index=noone;
if(array_length_1d(npc_data)>=NPC_EQUIPMENT){
    equipment = npc_data[NPC_EQUIPMENT];
    if(is_array(equipment) && slot < array_length_1d(equipment) ){
        weapon_id = equipment[slot];
        if(weapon_id!=noone){
            weapon_index = scr_inv_item_read(weapon_id,index);// index 6 holds the object name
        }
    }
}
return weapon_index;
