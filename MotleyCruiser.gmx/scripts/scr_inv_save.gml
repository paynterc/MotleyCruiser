/**********
Write inventory to file.
**********/
//scr_inv_save(game)
var game = argument0;

ini_open(SAVE_GAME_FILE);
var i_string;
i_string = ds_map_write(global.inventory);
ini_write_string(game, "inventory", i_string);
