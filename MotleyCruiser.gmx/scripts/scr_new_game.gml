///Build new game data
scr_new_game_defaults(); // Clear game variables

scr_clear_galaxy();//Empty the galaxy ds_map

randomize();
global.galaxy_seed = random_get_seed();// Call randomize before this
global.sector_x=0;
global.sector_y=0;
global.sector_economy=noone;

global.player_ship = global.ship_library[10];
global.player_ship = scr_modules_to_ship_data(global.player_ship);
global.new_ship=true;

inventory_clear();
//scr_inv_item_add(55,1);//sword

// Player Equipment
global.equipped = noone;
global.equipped[2]=noone;
global.equipped[1]=noone;
global.equipped[0]=51;

global.crew = noone;
global.crew = scr_push_array( global.crew, scr_npc_oldsalt() );

// Tutorial
scr_tutorial_init();

scr_ev_game_loaded();

