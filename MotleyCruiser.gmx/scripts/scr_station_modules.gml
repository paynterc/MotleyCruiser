/// scr_station_modules()
/*********
Store the ids of sprite assets in these arrays.
Then, when saving the modules that make up a station, save
the indexes of these arrays, not the ids of the sprites themselves (which can change)

DON'T CHANGE THE ORDER OF THESE ARRAYS. USER scr_get_array_1d to retrieve values safely.
*********/
var station_modules=noone;


// Central/Main modules
station_modules[0]=scr_array(spr_stat_mod6,spr_stat_mod4,spr_stat_mod11,spr_stat_mod10,spr_stat_mod18,spr_stat_mod19,spr_stat_mod12);

// Sub modules
station_modules[1]=scr_array(spr_stat_mod1,spr_stat_mod2,spr_stat_mod3,spr_stat_mod5,spr_stat_mod6,spr_stat_mod7,spr_stat_mod7,spr_stat_mod7,spr_stat_mod8,spr_stat_mod19,spr_stat_mod18);

// Signs
station_modules[2]=scr_array(spr_sign1,spr_sign2,spr_sign3,spr_sign4,spr_sign5);

// Antenna
station_modules[3]=scr_array(spr_stat_mod13,spr_stat_mod14,spr_stat_mod17,spr_stat_mod20);

return station_modules;





