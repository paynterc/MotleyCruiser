///Load a saved game from file or create a new one. This would probably be called from a select menu.
// scr_game_load(GAME_ID)
var game = argument0;
var rm = noone;//next room


scr_new_game_defaults();
global.game_loaded = game;


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
    var str = ini_read_string(game, "equipped", "");
    ds_list_read(read_list,str);
    global.equipped = read_list[| 0];
    ds_list_destroy(read_list);
        
    /***
    read_list = ds_list_create();
    var str = ini_read_string(game, "npcs", "");
    ds_list_read(read_list,str);
    global.npcs = read_list[| 0];
    ds_list_destroy(read_list);
    ***/
      
    scr_load_galaxy(game);
    scr_inv_load(game);
    

    global.current_sector_row =  ini_read_real(game, "current_sector_row", 10);//TODO: remove
    global.current_sector_col =  ini_read_real(game, "current_sector_col", 10);//TODO: remove
    
    global.sector_x =  ini_read_real(game, "sector_x", 0);
    global.sector_y =  ini_read_real(game, "sector_y", 0);
    
    global.player_x =  ini_read_real(game, "player_x", 0);
    global.player_y =  ini_read_real(game, "player_y", 0);
    global.mission_id =  ini_read_real(game, "mission_id", 0);
    global.objective_inc =  ini_read_real(game, "objective_inc", 0);
    global.credits =  ini_read_real(game, "credits", 0);
    
    scr_load_player_sprite();
    
    // Equipment - created map in obj_game_control
    global.equipped = noone;
    global.equipped[2]=noone;
    global.equipped[1]=noone;
    global.equipped[0]=51;
      
    //global.galaxy_seed = ini_read_real(game, "galaxy_seed", 0);
    //random_set_seed(global.galaxy_seed);
    
    global.player_ship = scr_modules_to_ship_data(global.player_ship);
    
    scr_ev_game_loaded();
    
    rm = rm_space;
    //rm = rm_inventory;
}else{

    // Make a new player character
    rm = rm_player_edit;
    
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



room_goto(rm);
