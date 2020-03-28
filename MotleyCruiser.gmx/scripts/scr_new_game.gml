///Build new game data
room_set_persistent(rm_space,false);

scr_clear_galaxy();//Empty the galaxy ds_map
ds_map_clear(global.mission_map);

randomize();
// Galaxy
global.galaxy_seed = random_get_seed();// Call randomize before this
scr_racial_centers();// random racial map of galaxy

// Ship
global.player_ship = global.ship_library[15];//15 DEFAULT_START_SHIP is little red ship
global.player_ship = scr_modules_to_ship_data(global.player_ship);
global.new_ship=true;
with(obj_ship_data){
    event_user(1);// calc stats and set variables
}

// Cargo
inventory_clear();
ds_map_clear(global.cargo_list);
scr_inv_item_add(59,3);//star maps

// Player Equipment
global.equipped = noone;
global.equipped[2]=noone;
global.equipped[1]=noone;
global.equipped[0]=51;

var oldSalt = scr_npc_oldsalt();
oldSalt[NPC_CREW_INDEX]=0;
global.crew = noone;
global.crew = scr_push_array( global.crew, oldSalt );

// Pet
global.pets = noone;
var newPet = scr_pet("obj_pet1","Cuddles",0);
global.pets = scr_push_array( global.pets, newPet );

// Cargo
scr_cargo_add(0,1);// food
scr_cargo_add(1,1);// oxygen
scr_cargo_add(3,1);// water
scr_cargo_add(4,2);// fuel
scr_cargo_add(7,5);// luxury goods

// Morale
scr_grievance_clear_map();

// Tutorial
scr_tutorial_init();

scr_ev_game_loaded();

