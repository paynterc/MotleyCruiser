/*****
Update ship data after modifying with module data
This is similar to scr_module_modify_stats, but it only updates the data array,
not the variables within the ship object. It is intended for cases where the
ship object is not present.
Call it like ship_data = scr_modules_to_ship_data(ship_data);
*****/
//scr_modules_to_ship_data(ship_data)
var ship_data = argument0;
var module_data = ship_data[SHIP_MODULES];
var mass=0;
var thrust_fwd=0;
var thrust_rvs=0;

var shields=global.ship_default_shields;
var shields_regen_speed=global.ship_default_shields_regen_speed;
var shields_regen_points=global.ship_default_shields_regen_points;

var hull=global.ship_min_hull;

var energy=global.ship_min_energy;
var energy_regen_speed=global.ship_default_energy_regen_speed;
var energy_regen_points=global.ship_default_energy_regen_points;

var bunks=0;

var turn_spd = global.ship_default_turn_spd;
var turn_mod = 0;
var max_spd_fwd = global.ship_max_spd_fwd;
var max_spd_rvs = global.ship_max_spd_rvs;


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
           
}


energy_regen_speed = max(energy_regen_speed,0.1);
shields_regen_speed = max(shields_regen_speed,0.1);

var acc_spd_fwd = thrust_fwd/mass;
var acc_spd_rvs = thrust_rvs/mass;
turn_spd += turn_mod/mass;
max_spd_fwd -= mass/thrust_fwd;
max_spd_rvs -= mass/thrust_rvs;

max_spd_fwd = max(1,max_spd_fwd);
max_spd_rvs = max(1,max_spd_rvs);

ship_data[SHIP_TURN_SPEED]=turn_spd;
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

return ship_data;
