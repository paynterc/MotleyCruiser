/// Change the current sector
// scr_move_to_sector(row, column);
var new_row = argument0;
var new_col = argument1;
if(global.galaxy == noone){
    return false;
}
if( new_row > -1 && new_row < array_height_2d(global.galaxy) && new_col > -1 && new_col < array_length_2d(global.galaxy,0) ){
    global.current_sector_row = new_row;
    global.current_sector_col = new_col;
    room_goto(rm_space);
}else{
    return false;
}

