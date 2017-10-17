/**********
Write galaxy to file.
**********/
//scr_save_galaxy(game)
var game = argument0;

ini_open(SAVE_GAME_FILE);
var i_string = ds_map_write(global.galaxy);
ini_write_string(game, "galaxy", i_string);

