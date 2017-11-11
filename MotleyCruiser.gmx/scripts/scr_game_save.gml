/**********************
Save the game in its current state to a file
**********************/
// Create an array for all game data
var game = global.game_loaded;

scr_save_galaxy(game);
scr_inv_save(game);

scr_write_array(global.equipped,game,"equipped",SAVE_GAME_FILE);
scr_write_array(global.player_ship,game,"player_ship",SAVE_GAME_FILE);
scr_write_array(global.player_model,game,"player_model",SAVE_GAME_FILE);
scr_write_array(global.fleet,game,"fleet",SAVE_GAME_FILE);
scr_write_array(global.missions,game,"missions",SAVE_GAME_FILE);
scr_write_array(global.crew,game,"crew",SAVE_GAME_FILE);


ini_open(SAVE_GAME_FILE);
ini_write_real(game,"sector_x",global.sector_x);
ini_write_real(game,"sector_y",global.sector_y);
ini_write_real(game,"player_x",global.player_x);
ini_write_real(game,"player_y",global.player_y);
ini_write_real(game,"galaxy_seed",global.galaxy_seed);
ini_write_real(game,"mission_id",global.mission_id);// Current mission increment
ini_write_real(game,"objective_inc",global.objective_inc);// Current objective increment.
ini_write_real(game,"credits",global.credits);// Current credits.
ini_close();
