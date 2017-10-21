/// instantiate objects based on SEED
var sx = global.sector_x;
var sy = global.sector_y;
var gxindex = 0; // Use this to generate a dsmap index for each location.
var gxkey;

var sector_key = "x"+string(sx)+"y"+string(sy)+"seed";
var sector_seed = ds_map_find_value(global.galaxy,sector_key);
if(is_undefined(sector_seed)){
    // We haven't been here yet. Create a new sector.
    randomize();
    ds_map_add(global.galaxy, sector_key, random_get_seed());
}else{
    random_set_seed(sector_seed);
}

var curdepth = 1000;

// Add suns
var c = irandom(3);
var sun;
var sun_obj;
for(var i=0; i<c; i++){
    sun = scr_make_sun(sx,sy);
    sun_obj = instance_create(sun[SUN_X1],sun[SUN_Y1],obj_sun);
    sun_obj.data = sun;
    with(sun_obj){
        var size_mod = data[SUN_W1] / sprite_get_width(spr_sun); 
        image_xscale = size_mod;
        image_yscale = size_mod;
        image_blend = data[SUN_COLOR];
        depth = curdepth;
        faction = FACTION_NEUTRAL;
    }
    gxindex++;
}

// Add planets
var c = irandom(5);
var planet;
var planet_obj;
for(var i=0; i<c; i++){
    planet = scr_make_planet(sx,sy,gxindex);
    planet_obj = instance_create(planet[LOC_X1],planet[LOC_Y1],obj_planet);
    planet_obj.data = planet;
    
    /***
    if(!scr_gx_loc_exists(sx,sy,gxindex)){
        scr_gx_loc_array_to_map(planet);// Insert to global.gx_locations
    }
    ***/
    
    with(planet_obj){
        var psize_mod = planet[LOC_W1] / sprite_get_width(spr_planet); 
        image_xscale = psize_mod;
        image_yscale = psize_mod;
        image_blend = planet[LOC_COLOR];
        image_index = planet[LOC_SPRITE];                  
        depth = curdepth;
        global_index = planet[LOC_INDEX];                  
        global_type = "planet";
        faction = FACTION_NEUTRAL;
        var tname = planet[LOC_NAME];
        name = tname[0];
    }
    gxindex++;
}


// Add moons
var c = irandom(5);
var moon;
var moon_obj;
for(var i=0; i<c; i++){
    moon = scr_make_moon(sx,sy,gxindex);
    moon_obj = instance_create(moon[LOC_X1],moon[LOC_Y1],obj_moon);
    moon_obj.data = moon;
    with(moon_obj){
        var msize_mod = moon[LOC_W1] / sprite_get_width(spr_moon); 
        image_xscale = msize_mod;
        image_yscale = msize_mod;
        image_blend = moon[LOC_COLOR];
        image_index = moon[LOC_SPRITE];
        depth = curdepth;
        global_index = moon[LOC_INDEX];
        global_type = "moon";
        faction = FACTION_NEUTRAL;
        var tname = moon[LOC_NAME];
        name = tname[0];
    }
    gxindex++;
}

// Add stations
var c = irandom(5);
var station;
var station_obj;
for(var i=0; i<c; i++){
    station = scr_make_station(sx,sy,gxindex);
    station_obj = instance_create(station[LOC_X1],station[LOC_Y1],obj_station);
    with(station_obj){
        var ssize_mod = station[LOC_W1] / sprite_get_width(spr_station); 
        image_xscale = ssize_mod;
        image_yscale = ssize_mod;
        image_blend = station[LOC_COLOR];
        image_index = station[LOC_SPRITE];
        depth = curdepth;
        global_index = station[LOC_INDEX];
        global_type = "station";
        faction = FACTION_NEUTRAL;
        var tname = station[LOC_NAME];
        name = tname[0];
    }
    gxindex++;
}


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
