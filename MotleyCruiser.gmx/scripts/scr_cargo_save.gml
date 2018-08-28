/**********
Write cargo to file.
**********/
//scr_inv_save(game)
var game = argument0;

ini_open(SAVE_GAME_FILE);
var i_string;
i_string = ds_map_write(global.cargo_list);
ini_write_string(game, "cargo", i_string);
ini_close();
