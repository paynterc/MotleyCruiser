/// Set ship object defaults
// Ship stats
stats_modified = false;

turn_spd = global.ship_default_turn_spd;
turn_mod = 0;
max_spd_fwd = global.ship_max_spd_fwd;
max_spd_rvs = global.ship_max_spd_rvs;
acc_spd_fwd = 0;//acceleration speed forward
acc_spd_rvs = 0;//acceleration speed reverse
thrust_fwd = 0;
thrust_rvs = 0;
mass=0;

shields = global.ship_default_shields;
shields_current = shields;
shields_regen_speed = global.ship_default_shields_regen_speed;//frequency of shield regen ticks.
shields_regen_points = global.ship_default_shields_regen_points;//shield regenerated on each tick.

hull = global.ship_min_hull;
hull_current = hull;

energy = global.ship_min_energy;
energy_current = energy;
energy_regen_speed = global.ship_default_energy_regen_speed;//frequency of energy regen ticks.
energy_regen_points = global.ship_default_energy_regen_points;//energy regenerated on each tick.

weapon_speed = 0.1;//DEPRECATD: multiplied by 1 second or room_speed
weapon_range = 600;//used for npcs

bunks = 0;
