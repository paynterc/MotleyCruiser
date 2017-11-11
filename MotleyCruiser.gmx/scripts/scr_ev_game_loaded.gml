/****************
Run these events as soon as the game has loaded
***************/

// Update the inventory object with the player ship cargo stat
if(instance_exists(obj_inventory)){
    //obj_inventory.rows = global.base_inventory_rows + global.player_ship[SHIP_CARGO];
    obj_inventory.rows = global.base_inventory_rows;
}
