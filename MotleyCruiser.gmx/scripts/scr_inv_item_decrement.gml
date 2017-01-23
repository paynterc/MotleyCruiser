//scr_inv_item_decrement(id)
var ID, count;
ID = argument0;
var slot = noone;
for (i=0; i<(global.InventorySlot*global.InventorySlotH); i+=1)
{
    if ds_map_find_value(global.inventory,"ID"+string(i)) = ID{
       slot = i
       break;
    }
};


if(slot!=noone){

    inventory_item_delete(slot,1);

}
