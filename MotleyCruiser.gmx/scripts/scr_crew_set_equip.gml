/// scr_crew_set_equip(crew_index,slot index,item index);
// update an equipment slot and return whatever was previously in the slot
var c_index = argument0;
var slot = argument1;
var item_index = argument2;//index of item in index library.
var equipment;
var previous = noone;// Whatever is currently in the slot
if(c_index<array_length_1d(global.crew)){
    cmate = global.crew[c_index];
    if( NPC_EQUIPMENT < array_length_1d(cmate) && slot < array_length_1d(cmate[NPC_EQUIPMENT]) ){
        equipment = cmate[NPC_EQUIPMENT];
        previous = equipment[slot];
        equipment[@ slot]=item_index;
    }
}
return previous;
