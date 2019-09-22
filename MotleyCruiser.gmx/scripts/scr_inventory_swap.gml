/// scr_inventory_swap(slot_index,item_id)
var slot = argument0;
var item_id = argument1;
var temp_id1 = noone;

// Check to see if there is something in this slot
var slotStatus = inventory_read("slot",slot);
if(slotStatus == true){
    // If so, we return the item id. We'll put this in the player or crew inventory
    temp_id1 = inventory_read("ID",slot);      
}

// Overwrite the slot with the incoming item
inventory_item_set(slot,item_id,1);// Amount is always 1. Maybe allow stacks.

return temp_id1;
