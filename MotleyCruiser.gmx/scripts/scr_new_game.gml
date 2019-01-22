///Build new game data
room_set_persistent(rm_space,false);

scr_new_game_defaults(); // Clear game variables

scr_clear_galaxy();//Empty the galaxy ds_map

randomize();
global.galaxy_seed = random_get_seed();// Call randomize before this
global.sector_x=0;
global.sector_y=0;
global.nav_queue=noone;
global.sector_economy=noone;
scr_racial_centers();// random racial map of galaxy

global.player_ship = global.ship_library[15];//15 DEFAULT_START_SHIP is little red ship
global.player_ship = scr_modules_to_ship_data(global.player_ship);
global.new_ship=true;
with(obj_ship_data){
    event_user(1);// calc stats and set variables
}

inventory_clear();
ds_map_clear(global.cargo_list);

scr_inv_item_add(59,3);//star maps

// Player Equipment
global.equipped = noone;
global.equipped[2]=noone;
global.equipped[1]=noone;
global.equipped[0]=51;

global.crew = noone;
global.crew = scr_push_array( global.crew, scr_npc_oldsalt() );

// Cargo
scr_cargo_add(0,1);// food
scr_cargo_add(1,1);// oxygen
scr_cargo_add(3,1);// water
scr_cargo_add(4,2);// fuel
scr_cargo_add(7,5);// luxury goods

// Tutorial
scr_tutorial_init();

scr_ev_game_loaded();

