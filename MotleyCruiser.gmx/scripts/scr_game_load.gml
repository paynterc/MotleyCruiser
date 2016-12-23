///Load a saved game from file. This would probably be called from a select menu.
// scr_game_load(GAME_ID)
var game = argument0;

var read_list;

ini_open(SAVE_GAME_FILE);

global.galaxy_seed = ini_read_real(game, "galaxy_seed", 0);

read_list = ds_list_create();
var str = ini_read_string(game, "player_ship", "");
ds_list_read(read_list,str);
global.player_ship = read_list[| 0];
ds_list_destroy(read_list);

read_list = ds_list_create();
var str = ini_read_string(game, "fleet", "");
ds_list_read(read_list,str);
global.fleet = read_list[| 0];
ds_list_destroy(read_list);

global.current_sector_row =  ini_read_real(game, "current_sector_row", 10);
global.current_sector_col =  ini_read_real(game, "current_sector_col", 10);
global.player_x =  ini_read_real(game, "player_x", 0);
global.player_y =  ini_read_real(game, "player_y", 0);

ini_close();

random_set_seed(global.galaxy_seed);

global.suns[0] = -1;
global.planets[0] = -1;
global.moons[0] = -1;
global.stations[0] = -1;
global.ships[0] = -1;
global.npcs[0] = -1;
global.galaxy = scr_make_galaxy_NEW();

global.game_loaded = game;

room_goto(rm_space);
