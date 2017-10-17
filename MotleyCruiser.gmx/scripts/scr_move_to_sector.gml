/// Change the current sector
// scr_move_to_sector(row, column);
var new_x = argument0;
var new_y = argument1;
if(global.galaxy == noone){
    return false;
}

// Persist game state. Ship status, fleet status, etc.
// Save with the current sector so we will come back here if we die in the next sector.
scr_persist_game_state();


//Update global vars with new sector coords
global.player_x = noone;
global.player_y = noone;
global.sector_x = new_x;
global.sector_y = new_y;
room_goto(rm_space);
 
