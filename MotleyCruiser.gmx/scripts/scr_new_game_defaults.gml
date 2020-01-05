/// Initialize variablies for new game. You may need to do this more than once.

/****************************************************************/
/*                      GAME CONTROL                            */
/****************************************************************/

global.bullet_time=false;
global.room_return = noone;// Hold the room to return to after visiting galaxy map or some other ui

/****************************************************************/
/*                      DYNAMIC PLAYER DATA                     */
/****************************************************************/
// PLAYER DATA
if(sprite_exists(global.player_sprite)){
    sprite_delete(global.player_sprite);
}
global.player_ship = noone;// PLAYER SHIP: An array containing current ship state.
global.player_model = noone;// An array containing player clothing and body selections.
global.player_data = scr_player();// PLAYER STATS: Save between levels.
global.player_dead=false;

// PLAYER SHIP: An array containing current ship state.
global.player_ship = noone;

// PLAYER FLEET: An array of ships in the fleet and their current state.
global.fleet = noone;

// PLAYER CREW: An array of arrays for crew. Maybe a dsmap or dslist.
global.crew = noone;
global.team = scr_array_size(3);
   
// PLAYER MISSIONS: An array of ds_maps for missions
global.mission_id = 1000; //A number to start mission ids with. Increment this with each mission granted.
global.missions = noone;
global.objective_inc = 100

// Money
global.credits = 100;

// Time
global.day = 1;
global.increment_day=false;// Mark true to add one day and perform daily functions

/****************************************************************/
/*                      GALAXY VARS                             */
/****************************************************************/
global.galaxy_seed = noone;
global.nav_queue = noone; //An array to keep track of the sectors we will travel to, as selected on the map
global.sector_map = noone;// An array of locations in this sector
global.racial_centers = noone;// A map of coordinates of sectors that are the center for each RACE. set this at new game or game load.

/****************************************************************/
/*                      LOCATION                                */
/****************************************************************/
global.landed_on = noone;// planet or moon
global.landed_type = noone;
global.current_sector_row = global.galaxy_width/2;// old galaxy navigation values
global.current_sector_col = global.galaxy_width/2;
global.sector_x=0;// new galaxy navigation values
global.sector_y=0;
global.player_x = noone;// in-room coordinates. default to room_width/2
global.player_y = noone;
global.last_sector_x=0;// sector we just came from
global.last_sector_y=0;
global.sector_economy=noone;

// Planet side stuff
global.planet_seed = noone;
global.planet_map = noone;// 2d array
global.planet_room_index_x = noone;
global.planet_room_index_y = noone;
global.planet_nextdoor = noone;

/****************************************************************/
/*                      ROOM LEVELS                             */
/****************************************************************/
scr_reset_room_random();

/****************************************************************/
/*                      SPACE LEVELS                            */
/****************************************************************/
global.ship_boarded = noone; // Should be an array of ship data from scr_make_ship;
global.new_ship = false; // Set to true if this is a new game


/****************************************************************/
/*                      SUPPLIES                                */
/****************************************************************/
global.supply_food = 100;
global.supply_water = 100;
global.supply_fuel = 100;
global.supply_oxygen = 100;
global.cargo_total = 0;// Holds the total units of cargo
// Equipped items
global.equipped = noone;
scr_hotbar_init();


