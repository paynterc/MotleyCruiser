///Load a saved game from file or create a new one. This would probably be called from a select menu.
// scr_game_load(GAME_ID)
var game = argument0;
ini_open(SAVE_GAME_FILE);
if(ini_section_exists(game)){
    // LOAD EXISTING GAME
    var read_list;
      
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
     
    random_set_seed(global.galaxy_seed);
}else{

    // NEW GAME
    randomize();
    global.galaxy_seed = random_get_seed();
    global.current_sector_row = global.galaxy_width/2;
    global.current_sector_col = global.galaxy_width/2;
    global.player_x = global.galaxy_width/2;
    global.player_y = global.galaxy_width/2;
    global.player_ship = noone;
    global.fleet=noone;
    global.crew=noone;
        
    // PLAYER MISSIONS: An array of ds_maps for missions
    global.mission_id = date_current_datetime(); //A number to start mission ids with. Increment this with each mission granted.
    global.missions = noone;
    global.objective_inc = date_current_datetime();//start increment for objective ids
    
    // Money
    global.credits = 1000;
       
}
ini_close();

global.suns[0] = -1;
global.planets[0] = -1;
global.moons[0] = -1;
global.stations[0] = -1;
global.ships[0] = -1;
global.npcs[0] = -1;
global.galaxy = scr_make_galaxy_NEW();

//Random crew
for(var i=0; i<2; i++){
    global.crew[i]=scr_array_random(global.npcs);
}

global.game_loaded = game;

room_goto(rm_space);
