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
    boarding_script = "scr_board_ship";// Now you can board it if you actually disable it.
}

scr_crew_bark("It's a trap!");

mode = MODE_TRAVELING;// Refers to player ship. Clears boarding text.
