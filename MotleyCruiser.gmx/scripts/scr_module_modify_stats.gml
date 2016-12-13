/// Update ship stats with module modifiers
for(var m=0;m<array_length_1d(module_data);m++){
    var module_record = module_data[m];
    var MP = global.module_library[module_record[I_MODULE_INDEX]];//Module Prototype
    
    mass += MP[MODULE_MASS_MOD];     

    thrust_fwd += MP[MODULE_THRUSTFWD_MOD];//acceleration speed forward
    thrust_rvs += MP[MODULE_THRUSTRVS_MOD];//acceleration speed reverse
    
         
    shields += MP[MODULE_SHIELD_MOD];
    shields_current = shields;
    shields_regen_speed -= MP[MODULE_SHIELDREGEN_MOD];//frequency of shield regen ticks.
    shields_regen_points += MP[MODULE_SHIELDREGENPOINTS_MOD];//shield regenerated on each tick.
    
    hull += MP[MODULE_HULL_MOD];
    hull_current = hull;
    
    energy += MP[MODULE_ENERGY_MOD];
    energy_current = energy;
    energy_regen_speed -= MP[MODULE_ENERGYREGEN_MOD];//frequency of energy regen ticks.
    energy_regen_points += MP[MODULE_ENERGYREGENPOINTS_MOD];//energy regenerated on each tick.
    
    turn_mod += MP[MODULE_TURN_MOD];
    
        
}
energy_regen_speed = max(energy_regen_speed,0.1);
shields_regen_speed = max(shields_regen_speed,0.1);

acc_spd_fwd = thrust_fwd/mass;
acc_spd_rvs = thrust_rvs/mass;
turn_spd += turn_mod/mass;
max_spd_fwd -= mass/thrust_fwd;
max_spd_rvs -= mass/thrust_rvs;

max_spd_fwd = max(1,max_spd_fwd);
max_spd_rvs = max(1,max_spd_rvs);


