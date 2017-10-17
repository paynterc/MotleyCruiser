///Build new game data
scr_new_game_defaults(); // Clear game variables

scr_clear_galaxy();//Empty the galaxy ds_map

randomize();
global.galaxy_seed = random_get_seed();// Call randomize before this
global.sector_x=0;
global.sector_y=0;


global.player_ship = global.ship_library[10];
global.player_ship = scr_modules_to_ship_data(global.player_ship);
global.new_ship=true;


inventory_clear();
scr_inv_item_add(51,1);//blaster
scr_inv_item_add(42,5);
scr_inv_item_add(2,3);
scr_inv_item_add(53,10);

// Equipment
ds_map_clear(global.equipped);
ds_map_add(global.equipped, "weapon", 55);
ds_map_add(global.equipped, "hot0", 42);//med
ds_map_add(global.equipped, "hot1", 2);//flash
ds_map_add(global.equipped, "hot2", 53);//grenade


scr_ev_game_loaded();
