/// scr_populate_sector()
/*****
Generate data for the sector if none exists
Instantiate persistent objects based on data
Generate new random elements like npc ships

*****/

scr_generate_sector();
scr_instantiate_sector();

global.sector_map=scr_galaxy_map_find_sector(global.sector_x,global.sector_y);

if(global.sector_x==0 && global.sector_y==0){
    scr_gx_make_path(0,0,-1,-1);
    scr_gx_make_path(0,0,1,0);
    scr_gx_make_path(1,0,2,0);
    scr_gx_make_path(-1,-1,-2,-1);
}

// Save galaxy
var game = global.game_loaded;
scr_save_galaxy(game);
scr_dsmap_save(global.galaxy_map,"gmap");

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
    /***
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
    ***/
    global.ship_boarded=noone;
}else if(global.landed_on != noone && global.landed_type!=noone){

    global.landed_on = noone;
    global.landed_type = noone;
    
}else if(global.sector_x != global.last_sector_x || global.sector_y != global.last_sector_y){
    // We just came from a different sector. Do the entry animation.
    //player_angle = point_direction(global.last_sector_x,global.last_sector_y, global.sector_x,global.sector_y);
    //player_speed = 1000;
    //player_speed = 0;

    player_x = 0;
    player_y = 0;
    player_mode = MODE_JUMP_REENTRY;
    
    var entryAngle = point_direction(global.sector_x,global.sector_y, global.last_sector_x,global.last_sector_y);
    var re_x = (global.sector_width/2) + lengthdir_x(5000, entryAngle);
    var re_y = (global.sector_width/2) + lengthdir_y(5000, entryAngle);
    view_xview[0]=re_x-(view_wview[0]/2);
    view_yview[0]=re_y-(view_hview[0]/2);
    
    alarm[3]=room_speed/2;// Doo the reentry animation
}


if(instance_exists(obj_player_ship)){
    with(obj_player_ship){
        x=player_x;
        y=player_y;
        image_angle = player_angle;
        //direction = player_angle;
        //speed = player_speed;
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


global.player_x = player_x;
global.player_y = player_y;




/******************
NEW RANDOM STUFF
Different every time you return to the sector.

******************/
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

// Test ship
/***
var ship_obj = scr_spawn_npc_ship_single(FACTION_PIRATE,36,player_x + 120,player_y+120);
ship_obj.disabled = true;
ship_obj.boardable = true;
ship_obj.disposition = DISPOSITION_HOSTILE;
***/

/*** TEST ITEMS ***/
//scr_mining_area(player_x + 500,player_y+500);
/***
var ship_obj = scr_spawn_npc_ship_single(FACTION_PIRATE,36,player_x + 120,player_y+120);
ship_obj.disabled = true;



//scr_flybark("WHAT UP DOG?",spr_old_salt,3,true);

***/
