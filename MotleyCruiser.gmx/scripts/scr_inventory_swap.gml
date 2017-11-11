/// scr_inventory_swap(slot_index,item_id)
var slot = argument0;
var item_id = argument1;
var temp_id1 = noone;

// Check to see if there is something in this slot
if inventory_read("slot",slot) = true{
    // If so, we return the item id. We'll put this in the player or crew inventory
   temp_id1 = inventory_read("ID",slot); 
   
   // Overwrite the slot with the incoming item
    inventory_write("ID",slot,item_id);
    inventory_write("Stack",slot,1);   
    inventory_write("slot",slot,slot); 
}else{
    inventory_item_add(item_id,1);
}

return temp_id1;
