/// instantiate objects based on galaxy map

if(global.galaxy == noone){
    return false;
}
// get the current sector from globals
var g_row = global.current_sector_row;
var g_col = global.current_sector_col;

var sector = global.galaxy[g_row,g_col];
var suns = sector[SECTOR_SUNS]; //This should be a list of indexes that you can use to cross-reference with global.suns
var curdepth = 1000;

for(var i = 0; i < array_length_1d(suns); i++){

    if(suns[i] < 0 || suns[i] >= array_length_1d(global.suns)){
        continue;
    }

    var sun = global.suns[suns[i]];
    // Instanitate an object with properties
    var sun_obj = instance_create(sun[SUN_X1],sun[SUN_Y1],obj_sun);
    with(sun_obj){
        var size_mod = sun[SUN_W1] / sprite_get_width(spr_sun); 
        image_xscale = size_mod;
        image_yscale = size_mod;
        image_blend = sun[SUN_COLOR];
        depth = curdepth;
    }
    
    if(is_array(sun[SUN_PLANETS])){
        var planets = sun[SUN_PLANETS];
        for(var p = 0; p< array_length_1d(planets); p++){
            if(planets[p] < 0 || planets[p] >= array_length_1d(global.planets)){
                continue;
            }
            var planet = global.planets[planets[p]];     
            if(is_array(planet)){
                var planet_obj = instance_create(planet[PLANET_X1],planet[PLANET_Y1],obj_planet);
                with(planet_obj){
                    var psize_mod = planet[PLANET_W1] / sprite_get_width(spr_planet); 
                    image_xscale = psize_mod;
                    image_yscale = psize_mod;
                    image_blend = planet[PLANET_COLOR];
                    image_index = planet[PLANET_SPRITE_INDEX];
                    depth = curdepth;
                    global_index = planets[p];
                    global_type = "planet";
                }
                
                // Moons
                if(is_array(planet[PLANET_MOONS])){
                    var moons = planet[PLANET_MOONS];
                    for(var m=0; m<array_length_1d(moons); m++){
                        if(moons[m] < 0 || moons[m] >= array_length_1d(global.moons)){
                            continue;
                        }
                    
                        var moon = global.moons[moons[m]];
                        if(is_array(moon)){
                            var moon_obj = instance_create(moon[MOON_X1],moon[MOON_Y1],obj_moon);
                            with(moon_obj){
                                var msize_mod = moon[MOON_W1] / sprite_get_width(spr_moon); 
                                image_xscale = msize_mod;
                                image_yscale = msize_mod;
                                image_blend = moon[MOON_COLOR];
                                image_index = moon[MOON_SPRITE_INDEX];
                                depth = curdepth;
                                global_index = moons[m];
                                global_type = "moon";
                            }
                        }
                    }// End Moons loop
                }
            } 
        }// End Planets loop
    }
}// End Suns loop

var stations = sector[SECTOR_STATIONS]; //This should be a list of indexes that you can use to cross-reference with global.stations.
for(var i = 0; i < array_length_1d(stations); i++){

    if(stations[i] < 0 || stations[i] >= array_length_1d(global.stations)){
        continue;
    }
    
    var station = global.stations[stations[i]];
    // Instanitate an object with properties
    var station_obj = instance_create(station[STATION_X1],station[STATION_Y1],obj_station);
    with(station_obj){
        var ssize_mod = station[STATION_W1] / sprite_get_width(spr_station); 
        image_xscale = ssize_mod;
        image_yscale = ssize_mod;
        image_blend = station[STATION_COLOR];
        depth = curdepth;
        global_index = stations[i];
        global_type = "station";
    }
    
    
}

var max_ships = 5;
var min_ships = 1;
var num_ships = irandom_range(min_ships,max_ships);
for(var i=1; i<=num_ships; i++){
    var ship_map = scr_make_ship(g_row,g_col);
    var ship_obj = instance_create(100,100,obj_npc_ship);
    with(ship_obj){  
        x = ship_map[SHIP_X1];
        y = ship_map[SHIP_Y1];
        
        sprite_index = ship_map[SHIP_SPRITE_INDEX];
        image_index = ship_map[SHIP_IMAGE_INDEX];
        shieldSizeMod = (sprite_width/sprite_get_width(spr_shield)) + 0.5;
        faction = FACTION_PIRATE;
        disposition = DISPOSITION_HOSTILE;
        
    } 
}

