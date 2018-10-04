/// scr_trap_pirate_drones
// Requires a closest_boardable variable to be set in the obj_player_ship


// Spawn drones at player location
scr_spawn_pirate_drones();

scr_spawn_pirate_drones();// do it twice?

// Blow up ship?
with(closest_boardable){
    //alarm[4]=room_speed * 4;//self destruct 
    shields_current = shields;
    hull_current = hull;
    disabled = false;
    disposition = DISPOSITION_HOSTILE;
    faction = FACTION_PIRATE;
}

var flash = instance_create(display_get_gui_width()/2,display_get_gui_height()/2,obj_flash_message);
flash.text = "TRAP!";
flash._color = c_red;

mode = MODE_TRAVELING;// Refers to player ship. Clears boarding text.
