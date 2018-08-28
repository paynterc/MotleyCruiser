/// Set defaults for new game


/****************************************************************/
/*                      DYNAMIC PLAYER DATA                     */
/****************************************************************/

// PLAYER SHIP: An array containing current ship state.
global.player_ship = noone;

// PLAYER FLEET: An array of ships in the fleet and their current state.
global.fleet = noone;

// PLAYER CREW: An array of arrays for crew. Maybe a dsmap or dslist.
global.crew = noone;
    
// PLAYER MISSIONS: An array of ds_maps for missions
global.mission_id = 1000; //A number to start mission ids with. Increment this with each mission granted.
global.missions = noone;
global.objective_inc = 100

// Money
global.credits = 1000;

/****************************************************************/
/*                      GALAXY VARS                             */
/****************************************************************/
global.galaxy_seed = noone;


/****************************************************************/
/*                      LOCATION                                */
/****************************************************************/
global.landed_on = noone;
global.landed_type = noone;
global.current_sector_row = global.galaxy_width/2;// old galaxy navigation values
global.current_sector_col = global.galaxy_width/2;
global.sector_x=0;
global.sector_y=0;
global.player_x = noone;// default to room_width/2
global.player_y = noone;



