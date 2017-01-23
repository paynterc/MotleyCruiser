// Repair percentage of damage
//scr_repair_ship(ship_data)
var ship_data = argument0;

ship_data = scr_modules_to_ship_data(ship_data);
ship_data[SHIP_HULL_CUR] = ship_data[SHIP_HULL];

return ship_data;
