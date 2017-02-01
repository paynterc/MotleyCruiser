/**********************
Save the game in its current state to a file
**********************/
// Create an array for all game data
var game = global.game_loaded;

scr_write_array(global.player_ship,game,"player_ship",SAVE_GAME_FILE);
scr_write_array(global.fleet,game,"fleet",SAVE_GAME_FILE);
scr_write_array(global.missions,game,"missions",SAVE_GAME_FILE);
scr_write_array(global.crew,game,"crew",SAVE_GAME_FILE);

scr_write_array(global.suns,game,"suns",SAVE_GAME_FILE);
scr_write_array(global.planets,game,"planets",SAVE_GAME_FILE);
scr_write_array(global.moons,game,"moons",SAVE_GAME_FILE);
scr_write_array(global.stations,game,"stations",SAVE_GAME_FILE);
scr_write_array(global.ships,game,"ships",SAVE_GAME_FILE);
scr_write_array(global.npcs,game,"npcs",SAVE_GAME_FILE);
scr_write_array(global.galaxy,game,"galaxy",SAVE_GAME_FILE);

scr_inv_save(game);

ini_write_real(game,"current_sector_row",global.current_sector_row);
ini_write_real(game,"current_sector_col",global.current_sector_col);
ini_write_real(game,"player_x",global.player_x);
ini_write_real(game,"player_y",global.player_y);
ini_write_real(game,"galaxy_seed",global.galaxy_seed);
ini_write_real(game,"mission_id",global.mission_id);// Current mission increment
ini_write_real(game,"objective_inc",global.objective_inc);// Current objective increment.
ini_write_real(game,"credits",global.credits);// Current objective increment.
ini_close();
