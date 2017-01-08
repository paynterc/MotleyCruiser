///Load a saved game from file or create a new one. This would probably be called from a select menu.
// scr_game_load(GAME_ID)
var game = argument0;
scr_new_game_defaults();

inventory_clear();

ini_open(SAVE_GAME_FILE);
if(ini_section_exists(game)){
    // LOAD EXISTING GAME
    var read_list;
      
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
    
    read_list = ds_list_create();
    var str = ini_read_string(game, "missions", "");
    ds_list_read(read_list,str);
    global.missions = read_list[| 0];
    ds_list_destroy(read_list);
        
    read_list = ds_list_create();
    var str = ini_read_string(game, "crew", "");
    ds_list_read(read_list,str);
    global.crew = read_list[| 0];
    ds_list_destroy(read_list);
    
    
    
    read_list = ds_list_create();
    var str = ini_read_string(game, "suns", "");
    ds_list_read(read_list,str);
    global.suns = read_list[| 0];
    ds_list_destroy(read_list);
    
    read_list = ds_list_create();
    var str = ini_read_string(game, "planets", "");
    ds_list_read(read_list,str);
    global.planets = read_list[| 0];
    ds_list_destroy(read_list);
    
    read_list = ds_list_create();
    var str = ini_read_string(game, "moons", "");
    ds_list_read(read_list,str);
    global.moons = read_list[| 0];
    ds_list_destroy(read_list);
    
    read_list = ds_list_create();
    var str = ini_read_string(game, "stations", "");
    ds_list_read(read_list,str);
    global.stations = read_list[| 0];
    ds_list_destroy(read_list);
    
    read_list = ds_list_create();
    var str = ini_read_string(game, "ships", "");
    ds_list_read(read_list,str);
    global.ships = read_list[| 0];
    ds_list_destroy(read_list);
    
    read_list = ds_list_create();
    var str = ini_read_string(game, "npcs", "");
    ds_list_read(read_list,str);
    global.npcs = read_list[| 0];
    ds_list_destroy(read_list);
    
    read_list = ds_list_create();
    var str = ini_read_string(game, "galaxy", "");
    ds_list_read(read_list,str);
    global.galaxy = read_list[| 0];
    ds_list_destroy(read_list);
    
    
     
    var i_string = ini_read_string(game, "inventory", "");
    if(i_string != ""){
        ds_map_read(global.inventory, i_string);
    }

    global.current_sector_row =  ini_read_real(game, "current_sector_row", 10);
    global.current_sector_col =  ini_read_real(game, "current_sector_col", 10);
    global.player_x =  ini_read_real(game, "player_x", 0);
    global.player_y =  ini_read_real(game, "player_y", 0);
    global.mission_id =  ini_read_real(game, "mission_id", 0);
    global.objective_inc =  ini_read_real(game, "objective_inc", 0);
    global.credits =  ini_read_real(game, "credits", 0);
        
    //global.galaxy_seed = ini_read_real(game, "galaxy_seed", 0);
    //random_set_seed(global.galaxy_seed);
    
}else{

    // NEW GAME 
    randomize();
    global.galaxy_seed = random_get_seed();// Call randomize before this
    scr_make_galaxy_WEIGHTED();
}
ini_close();





/***

//Random crew
for(var i=0; i<2; i++){
    global.crew[i]=scr_array_random(global.npcs);
}

//Random fleet
global.fleet = noone;
for(var i=0; i<20; i++){
    global.fleet[i]=scr_array_random(global.ship_library);
}

***/

global.game_loaded = game;

room_goto(rm_space);
