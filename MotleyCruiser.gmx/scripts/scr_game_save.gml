/**********************
Save the game in its current state to a file
**********************/
// Create an array for all game data
var game = global.game_loaded;

scr_write_array(global.player_ship,game,"player_ship",SAVE_GAME_FILE);
scr_write_array(global.fleet,game,"fleet",SAVE_GAME_FILE);


ini_open(SAVE_GAME_FILE);
ini_write_real(game,"current_sector_row",global.current_sector_row);
ini_write_real(game,"current_sector_col",global.current_sector_col);
ini_write_real(game,"player_x",global.player_x);
ini_write_real(game,"player_y",global.player_y);
ini_write_real(game,"galaxy_seed",global.galaxy_seed);
ini_close();
