/// Change the current sector
// scr_move_to_sector(row, column);
var new_x = real(argument0);
var new_y = real(argument1);
if(global.galaxy == noone){
    return false;
}

// Persist game state. Ship status, fleet status, etc.
// Save with the current sector so we will come back here if we die in the next sector.
scr_persist_game_state();

show_debug_message("MOVE TO SECTOR: " + string(new_x) + ", " +string(new_y));
//Update global vars with new sector coords
global.player_x = noone;
global.player_y = noone;
global.last_sector_x=global.sector_x;// sector we just came from
global.last_sector_y=global.sector_y;
global.sector_x = new_x;
global.sector_y = new_y;
scr_cargo_item_decrement(4,1);
room_persistent = false;
room_goto(rm_space);
 
