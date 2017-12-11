/// Update ship variables from ship data
if(is_array(ship_data)){
    ship_data = scr_modules_to_ship_data(ship_data);
    
    hull = ship_data[SHIP_HULL];
    hull_current = hull;
    
    shields = ship_data[SHIP_SHIELDS];
    shields_regen_speed = ship_data[SHIP_SHIELDS_REGEN_SPD];
    shields_regen_points = ship_data[SHIP_SHIELDS_REGEN_PTS];
    shields_current = shields;
    
    energy = ship_data[SHIP_ENERGY];
    energy_regen_speed = ship_data[SHIP_ENERGY_REGEN_SPD];
    energy_regen_points = ship_data[SHIP_ENERGY_REGEN_PTS];
    energy_current = energy;
    
    acc_spd_fwd = ship_data[SHIP_ACC_FWD] * .5;
    acc_spd_rvs = ship_data[SHIP_ACC_RVS] * .5;
    turn_spd = ship_data[SHIP_TURN_SPEED];
    max_spd_fwd = ship_data[SHIP_MAX_FWD];
    max_spd_rvs = ship_data[SHIP_MAX_RVS];
    
    bunks = ship_data[SHIP_BUNKS];
    cargo = ship_data[SHIP_CARGO];
    mass = ship_data[SHIP_MASS];
}


//energy_current
//shields_current
//hull_current

