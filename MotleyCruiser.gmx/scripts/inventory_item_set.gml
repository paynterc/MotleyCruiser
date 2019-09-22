/// inventory_item_set(SlotID,ItemID,Amount)
// Set the contents of an existing slot. Don't worry about what was there already.
var slot_id = argument0;
var item_id = argument1;
var amount = argument2;
var slotStatus = ds_map_find_value(global.inventory,"slot"+string(slot_id));
if(!is_undefined(slotStatus)){
    inventory_write("slot",slot_id,true);
    inventory_write("ID",slot_id,item_id);
    inventory_write("Stack",slot_id,amount);
}
