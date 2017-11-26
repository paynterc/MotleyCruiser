/// Save inventory, equipped team and crew

var game = global.game_loaded;

scr_inv_save(game);
scr_write_array(global.equipped,game,"equipped",SAVE_GAME_FILE);
scr_write_array(global.crew,game,"crew",SAVE_GAME_FILE);
scr_write_array(global.team,game,"team",SAVE_GAME_FILE);
