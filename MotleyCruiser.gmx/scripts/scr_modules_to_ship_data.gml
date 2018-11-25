/*****
Update ship data after modifying with module data
This is done before scr_module_modify_stats.


*****/
//scr_modules_to_ship_data(ship_data)
var ship_data = argument0;
var module_data = ship_data[SHIP_MODULES];

var mass=0;

var thrust_fwd=0;
var thrust_rvs=0;

var shields=0;
var shields_regen_speed=0;
var shields_regen_points=0;

var hull=0;

var energy=0;
var energy_regen_speed=0;
var energy_regen_points=0;

var bunks=0;
var cargo=0;

var turn_spd = 0;

var max_spd_fwd = 0;
var max_spd_rvs = 0;
var command_mod = 0;
// These go directly into the ship object
// TODO: This isn't good. this script shouldn't be "leaking" variables. 
// This script is sometimes used without the scr_module_modify_stats step. 
// I should put these into the data array and then back into the ship object.
turn_mod = 0;
boostable=false;

for(var m=0;m<array_length_1d(module_data);m++){

    var module_record = module_data[m];
    var MP = global.module_library[module_record[I_MODULE_INDEX]];//Module Prototype
    
    mass += MP[MODULE_MASS_MOD];     

    thrust_fwd += MP[MODULE_THRUSTFWD_MOD];//acceleration speed forward
    thrust_rvs += MP[MODULE_THRUSTRVS_MOD];//acceleration speed reverse
    
         
    shields += MP[MODULE_SHIELD_MOD];
    shields_regen_speed -= MP[MODULE_SHIELDREGEN_MOD];//frequency of shield regen ticks.
    shields_regen_points += MP[MODULE_SHIELDREGENPOINTS_MOD];//shield points regenerated on each tick.
    
    hull += MP[MODULE_HULL_MOD];

    
    energy += MP[MODULE_ENERGY_MOD];
    energy_regen_speed -= MP[MODULE_ENERGYREGEN_MOD];//frequency of energy regen ticks.
    energy_regen_points += MP[MODULE_ENERGYREGENPOINTS_MOD];//energy points regenerated on each tick.
    
    turn_mod += MP[MODULE_TURN_MOD];
    bunks += MP[MODULE_BUNKS_MOD];
    cargo += MP[MODULE_CARGO_MOD];
    
    if(MP[MODULE_TYPE]=="booster"){
        boostable = true;
    }
    
    command_mod+=MP[MODULE_COMMAND_MOD]
           
}

energy = global.ship_default_energy + energy;
energy_regen_points = global.ship_default_energy_regen_points + energy_regen_points;
energy_regen_speed = global.ship_default_energy_regen_speed;// No modifier. Keep it at base value for now

energy = clamp(energy,global.ship_min_energy,global.ship_max_energy);
energy_regen_points = clamp(energy_regen_points,0,energy*.20);// Set max at 20% of energy per tick.

shields=global.ship_default_shields + shields;
// TODO: Find a mechanism to safely modify shield regen speed. I have this set universally now for simplicity
shields_regen_speed = global.ship_default_shields_regen_speed;// Every 1 seconds.
shields_regen_points=global.ship_default_shields_regen_points + shields_regen_points;

shields = clamp(shields,global.ship_min_shields, global.ship_max_shields);
shields_regen_points = clamp(shields_regen_points,0,shields*.20);// Set max at 20% of shields per tick.

var acc_spd_fwd = thrust_fwd /  mass;
var acc_spd_rvs =  thrust_rvs / mass ;
acc_spd_fwd = clamp(acc_spd_fwd,global.ship_min_acc,global.ship_max_acc);
acc_spd_rvs = clamp(acc_spd_rvs,global.ship_min_acc,global.ship_max_acc);

//turn_spd = global.ship_default_turn_spd + (turn_mod/mass);
turn_spd = max( 1, BASE_TURN_SPD - (mass/1000) ) + (turn_mod/mass);
//turn_spd = clamp(turn_spd,global.ship_min_turn_spd,global.ship_max_turn_spd);


max_spd_fwd = global.ship_max_spd_fwd + acc_spd_fwd;
max_spd_rvs = global.ship_max_spd_rvs + acc_spd_rvs;

hull = global.ship_default_hull + hull;
hull = clamp(hull,global.ship_min_hull,global.ship_max_hull);

ship_data[SHIP_TURN_SPEED]=turn_spd;
ship_data[SHIP_THRUST_FWD]=thrust_fwd;
ship_data[SHIP_THRUST_RVS]=thrust_rvs;
ship_data[SHIP_MAX_FWD]=max_spd_fwd;
ship_data[SHIP_MAX_RVS]=max_spd_rvs;
ship_data[SHIP_ACC_FWD]=acc_spd_fwd;
ship_data[SHIP_ACC_RVS]=acc_spd_rvs;
ship_data[SHIP_SHIELDS]=shields;
ship_data[SHIP_SHIELDS_REGEN_SPD]=shields_regen_speed;
ship_data[SHIP_SHIELDS_REGEN_PTS]=shields_regen_points;
ship_data[SHIP_HULL]=hull;
ship_data[SHIP_ENERGY]=energy;
ship_data[SHIP_ENERGY_REGEN_SPD]=energy_regen_speed;
ship_data[SHIP_ENERGY_REGEN_PTS]=energy_regen_points;
ship_data[SHIP_BUNKS]=bunks;
ship_data[SHIP_MASS]=mass;
ship_data[SHIP_CARGO]=cargo * 100;

return ship_data;
