///Load a saved game from file or create a new one. This would probably be called from a select menu.
// scr_game_load(GAME_ID)
room_set_persistent(rm_space,false);
var game = argument0;
var rm = noone;//next room

obj_game_control.pauseForce = false;
global.paused = false;

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
    
        
    if(!is_array(global.crew))
    {
        global.crew = noone;

    }else{
    
        /***
        global.crew = noone;
        global.crew = scr_push_array( global.crew, scr_gx_make_npc(0,0) );
        global.crew = scr_push_array(global.crew,scr_gx_make_npc(0,0));
        global.crew = scr_push_array(global.crew,scr_gx_make_npc(0,0));
        ***/
        
        // Make crew sprites with all accessories. 
        // DELETE THESE AT THE END OF THE GAME.
        // We need these for popup dialog boxes.
        for(var i=0; i<array_length_1d(global.crew); i++){
        
            if( !is_array(global.crew[i]) ){
                continue;
            }
            var npc_entity = scr_npc();
            var npc_data = scr_fill_array(npc_entity,global.crew[i]);
            
            // Convert strings to sprite index. We save strings because the index can change.
            var _sprite_string=scr_get_array_1d(npc_data,NPC_SPRITE_STRING);
            var _sprite_index=noone;
            if( sprite_exists(_sprite_string) ){
                _sprite_index=asset_get_index(_sprite_string);
                npc_data[NPC_SPRITE]=_sprite_index;
            }else{
                _sprite_index=spr_default;
            }
            
            
            var skincolor = scr_get_array_1d(npc_data,NPC_SKIN_COLOR);
            var accessories = scr_get_array_1d(npc_data,NPC_ACCESSORIES);
            if(is_array(accessories)){
        
                for(var n=0; n<array_length_1d(accessories); n++){
                    var thisAcc = accessories[n];
                    var accSpriteIndex = asset_get_index(scr_get_array_1d(thisAcc,ACC_SPR_STRING));
                    if(sprite_exists(accSpriteIndex)){
                        thisAcc[@ ACC_SPR_INDEX]=accSpriteIndex;
                    }else{
                        thisAcc[@ ACC_SPR_INDEX]=noone;
                    }   
                }
                
            }
            var bodyData = scr_array(_sprite_index,skincolor);
    
            // Submit all sprites to a script to merge them and draw them to a surface
            var spriteArray = scr_array(bodyData);
            for(var n=0;n<array_length_1d(accessories); n++){
                spriteArray = scr_push_array(spriteArray,accessories[n]);
            }
            
            npc_data[NPC_SPRITE_TEMP] = scr_surface_to_sprite(spriteArray);
            npc_data[NPC_CREW_INDEX]=i;
            global.crew[i]=npc_data; 
        }
        
        
        
    }
    

    read_list = ds_list_create();
    var str = ini_read_string(game, "team", "");
    ds_list_read(read_list,str);
    global.team = read_list[| 0];
    ds_list_destroy(read_list);
    if(!is_array(global.team))
    {
        global.team = scr_array_size(3);
    }
    
    read_list = ds_list_create();
    var str = ini_read_string(game, "equipped", "");
    ds_list_read(read_list,str);
    global.equipped = read_list[| 0];
    ds_list_destroy(read_list);
    
    /***
    read_list = ds_list_create();
    var str = ini_read_string(game, "hotbar", "");
    ds_list_read(read_list,str);
    global.hotbar = read_list[| 0];
    ds_list_destroy(read_list);
    if(!is_array(global.hotbar))
    {
        scr_hotbar_init();

    }
    ***/
    scr_hotbar_init();
    
    
    read_list = ds_list_create();
    var str = ini_read_string(game, "tutorial", "");
    ds_list_read(read_list,str);
    global.tutorial = read_list[| 0];
    ds_list_destroy(read_list);
    if(!is_array(global.tutorial))
    {
        scr_tutorial_init();

    }
        
    /***
    read_list = ds_list_create();
    var str = ini_read_string(game, "npcs", "");
    ds_list_read(read_list,str);
    global.npcs = read_list[| 0];
    ds_list_destroy(read_list);
    ***/
      
    scr_load_galaxy(game);
    scr_inv_load(game);
    scr_cargo_load(game);
    scr_dsmap_load(global.galaxy_map,"gmap");

    global.current_sector_row =  ini_read_real(game, "current_sector_row", 10);//TODO: remove
    global.current_sector_col =  ini_read_real(game, "current_sector_col", 10);//TODO: remove
    
    global.sector_x =  ini_read_real(game, "sector_x", 0);
    global.sector_y =  ini_read_real(game, "sector_y", 0);
    
    global.player_x =  ini_read_real(game, "player_x", 0);
    global.player_y =  ini_read_real(game, "player_y", 0);
    global.mission_id =  ini_read_real(game, "mission_id", 0);
    global.objective_inc =  ini_read_real(game, "objective_inc", 0);
    global.credits =  ini_read_real(game, "credits", 0);
    global.supply_food =  ini_read_real(game, "supply_food", 0);
    global.supply_water =  ini_read_real(game, "supply_water", 0);
    global.supply_fuel =  ini_read_real(game, "supply_fuel", 0);
    global.supply_oxygen =  ini_read_real(game, "supply_oxygen", 0);
    
    scr_load_player_sprite();
    
    // Equipment - created map in obj_game_control
    /***
    global.equipped = noone;
    global.equipped[2]=noone;
    global.equipped[1]=noone;
    global.equipped[0]=51;
    ***/
      
    
    global.player_ship = scr_modules_to_ship_data(global.player_ship);
    
    /***
    GALAXY LEVEL RANDOMIZATION
    ***/
    global.galaxy_seed = ini_read_real(game, "galaxy_seed", 0);
    random_set_seed(global.galaxy_seed);
    scr_racial_centers();// random racial map of galaxy
    /***
    END GALAXY LEVEL RANDOMIZATION
    ***/
    
    scr_ev_game_loaded();
    
    rm = rm_space;
    //rm = rm_inventory;
}else{

    // Make a new player character
    rm = rm_player_edit;
    
}
ini_close();



room_goto(rm);
