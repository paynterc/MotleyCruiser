/// Set ship object defaults
// Ship stats
stats_modified = false;

turn_spd = 3;
turn_mod = 0;
max_spd_fwd = 10;
max_spd_rvs = 8;
acc_spd_fwd = 0;//acceleration speed forward
acc_spd_rvs = 0;//acceleration speed reverse
thrust_fwd = 0;
thrust_rvs = 0;
mass=0;

shields = 100;
shields_current = shields;
shields_regen_speed = 3;//frequency of shield regen ticks.
shields_regen_points = 5;//shield regenerated on each tick.

hull = 5;
hull_current = hull;

energy = 500;
energy_current = energy;
energy_regen_speed = 1;//frequency of energy regen ticks.
energy_regen_points = 5;//energy regenerated on each tick.

weapon_speed = 0.1;//DEPRECATD: multiplied by 1 second or room_speed
weapon_range = 600;//used for npcs

bunks = 0;
