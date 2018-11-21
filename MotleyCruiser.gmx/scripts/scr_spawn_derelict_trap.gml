/// scr_spawn_derelict_trap(x,y)
var _x = argument0;
var _y = argument1;
var ship_obj = instance_create(_x,_y,obj_npc_ship);


ship_obj.faction = FACTION_PIRATE;
ship_obj.disposition = DISPOSITION_NEUTRAL;
ship_obj.mode = MODE_WAITING;
ship_obj.disabled = true;

with(ship_obj){
    ship_index = irandom(array_length_1d(global.ship_library)-1);
    ship_data = global.ship_library[ship_index];
    scr_instantiate_ship();
    //scr_update_ship_data();
    
    shields_current = 0;
    hull_current= irandom_range(1,hull-1);   
}



ship_obj.boarding_script = "scr_trap_pirate_drones"; // Important!
// Now, when the user attempts to board the ship (see obj_player_ship for function)
// it will spawn pirate drones instead of actually boarding the ship.

return ship_obj;
