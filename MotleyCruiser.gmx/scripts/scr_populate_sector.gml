/// instantiate objects based on SEED
var sx = global.sector_x;
var sy = global.sector_y;
var gxindex = 0; // Use this to generate a dsmap index for each location.
var gxkey;


var sector_key = "x"+string(sx)+"y"+string(sy)+"~seed";
var sector_seed = ds_map_find_value(global.galaxy,sector_key);
if(is_undefined(sector_seed)){
    // We haven't been here yet. Create a new sector and add it to the map.
    randomize();
    ds_map_add(global.galaxy, sector_key, random_get_seed());
                
}else{
    random_set_seed(sector_seed);
}




// ECONOMY. Just a count of each type of economy in the sector:
// agriculture, mining, industrial, tech
global.sector_economy = noone;
global.sector_economy = scr_array(0,0,0,0);// Set all counts to zero.
global.sector_map=scr_galaxy_map_find_sector(sx,sy);
global.sector_landable_count=0;


var curdepth = 1000;

var c;// count of suns
var sun, moon, planet, station;// data arrays
var sun_obj, moon_obj, planet_obj, station_obj;// instantiated objects

/*********************
RANDOM STUFF HAPPENS HERE. CHANGE IT AT YOU'RE OWN RISK!!!!!!!!
***************/

if(sx == 0 && sy == 0){
    // Home sector
    
    var center_x = global.sector_width/2;
    var center_y = global.sector_width/2;

    c = irandom(3);
    // Home system
    sun = scr_make_sun(sx,sy);
    var sw = sprite_get_width(spr_sun) * 3;
    sun[SUN_X1]=center_x-(sw/2);
    sun[SUN_Y1]=center_y-(sw/2);
    sun[SUN_W1]=sw;

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
    
    

    planet = scr_make_moon(sx,sy,gxindex);
    planet[LOC_TYPE]=GX_PLANET;
    planet[LOC_X1]=center_x;
    planet[LOC_Y1]=center_y;
    planet[LOC_W1]=sprite_get_width(spr_planet) * 2;
    planet[LOC_ECONOMY]=CC_AGRICULTURE;
    planet[LOC_TERRAIN]=terrains.forest;
    planet[LOC_IMAGE_DATA]=scr_planet_imagedata_generator(planet);
    planet[LOC_DESCRIPTION]=scr_planet_description_generator(planet);
    
    planet_obj = instance_create(planet[LOC_X1],planet[LOC_Y1],obj_planet);
    planet_obj.data = planet;
    
    with(planet_obj){
        var psize_mod = planet[LOC_W1] / sprite_get_width(spr_planet); 
        image_xscale = psize_mod;
        image_yscale = psize_mod;                
        depth = curdepth;
        global_index = planet[LOC_INDEX];                  
        global_type = "";
        faction = FACTION_NEUTRAL;
        name = planet[LOC_NAME];
        drawReady=true;
    }
    
    /***
    station = scr_make_station(sx,sy,gxindex);
    station[LOC_TYPE]=GX_STATION;
    station[LOC_X1]=center_x;
    station[LOC_Y1]=center_y;
    station[LOC_W1]=sprite_get_width(spr_) * 2;
    station[LOC_ECONOMY]=CC_AGRICULTURE;
    station[LOC_DESCRIPTION]=scr_station_description_generator(station);
    station_obj = instance_create(station[LOC_X1],station[LOC_Y1],obj_station);
    station_obj.data = station;
    with(station_obj){
               
        depth = curdepth;
        global_index = station[LOC_INDEX];                  
        global_type = "station";
        faction = FACTION_NEUTRAL;
        name = station[LOC_NAME];
        event_user(0);// apply vars
        event_user(1);
    }
    global.sector_economy[station[LOC_ECONOMY]] += 1;
    ***/
    
    global.sector_economy[CC_AGRICULTURE] += 1;
    
    gxindex++;
    
    global.sector_landable_count=1;
    
}else{

    var mainLandable = false;// We will have one landable place at the center of the map. Keep track of whether we have placed it yet using this variable.
    // Add suns
    c = irandom(3);
    
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
    var LL = 3; //landable limit
    var system_landables = irandom(LL);
    
    show_debug_message("total suns: " + string(c));
    show_debug_message("total landables: " + string(system_landables));
    
    var canMakeMoon=false;
    // There won't be planets or moons if there are no suns
    if(c>0){ 
        // Add planets
        c = irandom(system_landables);
        canMakeMoon=true;
        for(var i=0; i<c; i++){
            planet = scr_make_planet(sx,sy,gxindex);
            show_debug_message("make planet");
            if(!mainLandable){
                mainLandable=true;
                planet[LOC_X1] = global.sector_width/2;
                planet[LOC_Y1] = global.sector_width/2;
            }
            
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
                depth = curdepth;
                global_index = planet[LOC_INDEX];                  
                global_type = "planet";
                faction = FACTION_NEUTRAL;
                name = planet[LOC_NAME];
                drawReady=true;
            }
            global.sector_economy[planet[LOC_ECONOMY]] += 1;
            gxindex++;
            
        }
        
        system_landables-=c;      
        if(system_landables>0 && canMakeMoon){
            // Add moons
            c = irandom(system_landables);
            for(var i=0; i<c; i++){
                moon = scr_make_moon(sx,sy,gxindex);
                show_debug_message("make moon");
                if(!mainLandable){
                    mainLandable=true;
                    moon[LOC_X1] = global.sector_width/2;
                    moon[LOC_Y1] = global.sector_width/2;
                }
                // Using obj_planet here because it has code to create the sprite. Basically the same thing as a moon, just different data.
                moon_obj = instance_create(moon[LOC_X1],moon[LOC_Y1],obj_planet);
                moon_obj.data = moon;
                with(moon_obj){
                    var psize_mod = moon[LOC_W1] / sprite_get_width(spr_planet); 
                    image_xscale = psize_mod;
                    image_yscale = psize_mod;                  
                    depth = curdepth;
                    global_index = moon[LOC_INDEX];                  
                    global_type = "moon";
                    faction = FACTION_NEUTRAL;
                    name = moon[LOC_NAME];
                    drawReady=true;
                }
                global.sector_economy[moon[LOC_ECONOMY]] += 1;
                gxindex++;
                
            }
            system_landables-=c;
        }
    
    }
    
    if(system_landables>0){
        // Add stations
        var c = irandom(system_landables);
        for(var i=0; i<c; i++){
            station = scr_make_station(sx,sy,gxindex);
            show_debug_message("make station");
            if(!mainLandable){
                mainLandable=true;
                station[LOC_X1] = global.sector_width/2;
                station[LOC_Y1] = global.sector_width/2;
                show_debug_message("make station as main landable");
            }
            station_obj = instance_create(station[LOC_X1],station[LOC_Y1],obj_station);
            station_obj.data = station;
            with(station_obj){
                //var ssize_mod = sprite_get_width(spr_station)/station[LOC_W1]; 

                global_index = station[LOC_INDEX];                  
                global_type = "station";
                faction = FACTION_NEUTRAL;
                name = station[LOC_NAME];
                depth = curdepth;
                event_user(0);// apply vars
                event_user(1);
            }
     
            
            global.sector_economy[station[LOC_ECONOMY]] += 1;
            
                        
            gxindex++;
            
        }
    }
}
global.sector_landable_count = instance_number(obj_landable);

for(var i=0;i<irandom(5);i++){
    //scr_mining_area(noone,noone);
}

if(sx==0 && sy==0){
    scr_gx_make_path(0,0,-1,-1);
    scr_gx_make_path(0,0,1,0);
    scr_gx_make_path(1,0,2,0);
    scr_gx_make_path(-1,-1,-2,-1);
}

/*********************
END SEEDED RANDOMIZATION. ADDING ANYTHING RANDOM ABOVE THIS POINT COULD CHANGE THE SAVED MAP.
***************/

// Position the player ship.
var player_x;
var player_y;
if(global.player_x!=noone){
    player_x = global.player_x;
    player_y = global.player_y;
    
    global.player_x = noone;
    global.player_y = noone;
    
}else{
    player_x = global.sector_width/2;
    player_y = global.sector_width/2;
}

var player_angle = 0;
var player_speed = 0;
var player_mode = MODE_TRAVELING;

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
        direction = image_angle;
        faction = FACTION_PIRATE;
        disposition = DISPOSITION_HOSTILE;
        boardable = false;
        disabled = true;
        
        scr_instantiate_ship();


        alarm[4]=room_speed * 4;//self destruct
        
    } 
    global.ship_boarded=noone;
}else if(global.landed_on != noone && global.landed_type!=noone){

    global.landed_on = noone;
    global.landed_type = noone;
    
}else if(global.sector_x != global.last_sector_x || global.sector_y != global.last_sector_y){
    // We just came from a different sector. Do the entry animation.
    player_angle = point_direction(global.last_sector_x,global.last_sector_y, global.sector_x,global.sector_y);
    player_speed = 1000;
    var entryAngle = point_direction(global.sector_x,global.sector_y, global.last_sector_x,global.last_sector_y);
    player_x = (global.sector_width/2) + lengthdir_x(5000, entryAngle);
    player_y = (global.sector_width/2) + lengthdir_y(5000, entryAngle);
    player_mode = MODE_JUMP_REENTRY;
}


if(instance_exists(obj_player_ship)){
    with(obj_player_ship){
        x=player_x;
        y=player_y;
        image_angle = player_angle;
        direction = player_angle;
        speed = player_speed;
        ship_data = global.player_ship;       
        faction = FACTION_PLAYER;
        mode = player_mode;
        
        if(global.new_ship){
            scr_instantiate_ship();
            global.new_ship = false;
            scr_update_ship_data();
            global.player_ship = ship_data;// Put ship data back into the global array so we have full hitpoints
        }else{
            scr_instantiate_ship(true);
        }     
        
        if(mode==MODE_JUMP_REENTRY){
            alarm[10]=room_speed*2;
        }
        
    }
    
}

//scr_spawn_npc_ship_single(FACTION_PIRATE, 20, player_x+64, player_y+64);

/****
var gate1 = instance_create(room_width/2,0-room_width,obj_gate);
gate1.spx=0;gate1.spy=-1;

var gate2 = instance_create(room_width/2,room_width*2,obj_gate);
gate2.spx=0;gate2.spy=1;

var gate3 = instance_create(0-room_width,room_width/2,obj_gate);
gate3.spx=-1;gate2.spy=0;

var gate4 = instance_create(room_width*2,room_width/2,obj_gate);
gate4.spx=1;gate2.spy=0;
****/



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
        scr_instantiate_ship(true);
        //scr_restore_ship_state();  
    } 
}

// Save the game
global.player_x = player_x;
global.player_y = player_y;
scr_game_save();


randomize();
// NPC Ships
scr_spawn_npc_ships();

var trapcount = irandom(2)+1;
for(var i=0; i<trapcount; i++){
    scr_spawn_derelict_trap(irandom(global.sector_width),irandom(global.sector_width));
}


// Pirate patrols
var ppcount = irandom(3)+1;
for(var i = 0; i<ppcount; i++){
    scr_spawn_patrol(irandom(global.sector_width),irandom(global.sector_width),FACTION_PIRATE,irandom(3)+1);
}



/*** TEST ITEMS ***/
//scr_mining_area(player_x + 500,player_y+500);
/***
var ship_obj = scr_spawn_npc_ship_single(FACTION_PIRATE,36,player_x + 120,player_y+120);
ship_obj.disabled = true;

var ship_obj = scr_spawn_npc_ship_single(FACTION_PIRATE,36,player_x + 120,player_y+120);
ship_obj.disabled = true;
ship_obj.disposition = DISPOSITION_HOSTILE;

//scr_flybark("WHAT UP DOG?",spr_old_salt,3,true);

***/
