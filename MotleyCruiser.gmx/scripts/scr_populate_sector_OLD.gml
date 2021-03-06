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
        faction = FACTION_NEUTRAL;
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
                    faction = FACTION_NEUTRAL;
                    var tname = planet[PLANET_NAME];
                    name = tname[0];
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
                                faction = FACTION_NEUTRAL;
                                var tname = moon[MOON_NAME];
                                name = tname[0];
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
        faction = FACTION_NEUTRAL;
        var tname = station[STATION_NAME];
        name = tname[0];
    }
    
    
}

/***
var max_ships = 2;
var min_ships = 1;
var num_ships = irandom_range(min_ships,max_ships);
for(var i=1; i<=num_ships; i++){
    
    var ship_obj = instance_create(100,100,obj_npc_ship);
    with(ship_obj){  
        //var ship_map = scr_make_ship(g_row,g_col); 
        
        x = clamp( irandom(global.sector_width ), 1, global.sector_width );
        y = clamp( irandom(global.sector_width ), 1, global.sector_width );   
        faction = FACTION_PIRATE; 
        disposition = DISPOSITION_HOSTILE;
        ship_data = scr_array_random(global.ship_library);
        scr_instantiate_ship();
     
    } 
}
***/



// Position the player ship.
var player_x;
var player_y;
if(global.player_x!=noone){
    player_x = global.player_x;
    player_y = global.player_y;
    
    global.player_x = noone;
    global.player_y = noone;
    
}else{
    player_x = room_width/2;
    player_y = room_height/2;
}

var player_angle = 0;

if(global.ship_boarded != noone){
    
    // This should only happen if we are bugging out and failed to capture the ship.
    player_x = global.ship_boarded[SHIP_X1];
    player_y = global.ship_boarded[SHIP_Y1]-100 ;
    player_angle = global.ship_boarded[SHIP_ANGLE];
    
    var ship_obj = instance_create(100,100,obj_npc_ship);

    with(ship_obj){
    
        ship_data = global.ship_boarded;
        
        can_move = false;
        can_fire = false;
        
        x = ship_data[SHIP_X1];
        y = ship_data[SHIP_Y1];
        image_angle = ship_data[SHIP_ANGLE];
        faction = FACTION_PIRATE;
        disposition = DISPOSITION_HOSTILE;
        boardable = false;
        disabled = true;
        
        scr_instantiate_ship();


        alarm[4]=room_speed * 4;//self destruct
        
    } 
    global.ship_boarded=noone;
}



if(global.landed_on != noone && global.landed_type!=noone){

    var location = noone;
    if(global.landed_type=="station"){
        
        location = global.stations[global.landed_on];
        player_x = location[STATION_X1];
        player_y = location[STATION_Y1];
        
    }else if(global.landed_type=="planet"){
    
        location = global.planets[global.landed_on];
        player_x = location[PLANET_X1];
        player_y = location[PLANET_Y1];
        
    }else if(global.landed_type=="moon"){
    
        location = global.moons[global.landed_on];
        player_x = location[MOON_X1];
        player_y = location[MOON_Y1];
        
    }else{
        location = noone;
    }
    
    global.landed_on = noone;
    global.landed_type = noone;
    
}

if(instance_exists(obj_player_ship)){
    with(obj_player_ship){
        x=player_x;
        y=player_y;
        image_angle = player_angle;
        ship_data = global.player_ship;       
        faction = FACTION_PLAYER;
        scr_instantiate_ship();
        if(global.new_ship){
            global.new_ship = false;
            scr_update_ship_data();
            global.player_ship = ship_data;// Put ship data back into the global array so we have full hitpoints
        }else{
            scr_restore_ship_state();
        }     
    }
}

var gate1 = instance_create(room_width/2,0-room_width,obj_gate);
gate1.spx=0;gate1.spy=-1;

var gate2 = instance_create(room_width/2,room_width*2,obj_gate);
gate2.spx=0;gate2.spy=1;

var gate3 = instance_create(0-room_width,room_width/2,obj_gate);
gate3.spx=-1;gate2.spy=0;

var gate4 = instance_create(room_width*2,room_width/2,obj_gate);
gate4.spx=1;gate2.spy=0;




// Add the fleet ships
for(var i=0; i<array_length_1d(global.fleet); i++){
    
    var ship_obj = instance_create(100,100,obj_npc_ship);
    ship_obj.ship_data = global.fleet[i];
    with(ship_obj){  
        x = player_x;
        y = player_y - 100
        image_angle = player_angle;   
        faction = FACTION_PLAYER;
        disposition = DISPOSITION_HELPFUL;
        mode = MODE_DEFENDING;
        target = obj_player_ship;
        scr_instantiate_ship();
        scr_restore_ship_state();  
    }
    
}

// Save the game
global.player_x = player_x;
global.player_y = player_y;
scr_game_save();

// NPC Ships
randomize();
scr_spawn_npc_ships();
