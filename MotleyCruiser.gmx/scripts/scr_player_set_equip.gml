/// scr_crew_set_equip(slot,item);
// update an equipment slot and return whatever was previously in the slot

var slot = argument0;
var item_index = argument1;//index of item in index library.
var previous = noone;// Whatever is currently in the slot

if( is_array(global.equipped) && slot < array_length_1d(global.equipped) ){
    previous = global.equipped[slot];
    global.equipped[slot]=item_index;
}

return previous;
