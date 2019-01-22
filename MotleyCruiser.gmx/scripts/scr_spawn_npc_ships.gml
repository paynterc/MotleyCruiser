///scr_spawn_npc_ships()
var sector_limit = GLOBAL_SHIP_LIMIT;
var sector_count = instance_number(obj_ship);

if(sector_count>sector_limit) exit;

var wp1, wp2, wp3;
var waypoints = noone;

//Choose a faction
var thefaction = choose(FACTION_PIRATE,FACTION_TRADER,FACTION_TRADER,FACTION_REBEL,FACTION_FEDERATION,FACTION_BOUNTYHUNTER);
var thedisposition = DISPOSITION_NEUTRAL;
var themode = MODE_TRAVELING;

if(thefaction == FACTION_PIRATE){
    thedisposition = DISPOSITION_HOSTILE;
    themode = MODE_PATROLING;  
    wp1 = scr_array(irandom(room_width),irandom(room_height));
    wp2 = scr_array(irandom(room_width),irandom(room_height));
    wp3 = scr_array(irandom(room_width),irandom(room_height));
    waypoints = scr_array(wp1,wp2,wp3); 
}



var max_ships = 3;
var min_ships = 1;
var num_ships = irandom_range(min_ships,max_ships);
var tgt;
for(var i=1; i<=num_ships; i++){
    
    show_debug_message("make npc ship");
    // Find a target for the ships. Either planet, moon or station.
    // Hostile will retarget to player based on rules in obj_npc_ship.alarm3
    
    if(themode == MODE_TRAVELING){
        tgt = scr_find_landable_target();
    }else{
        tgt = noone;
    }
    
    


    var ship_obj = instance_create(100,100,obj_npc_ship);
    ship_obj.faction = thefaction;
    ship_obj.disposition = thedisposition;
    ship_obj.target = tgt;
    ship_obj.target_save = tgt;
    ship_obj.mode = themode;
    ship_obj.waypoints = waypoints;
    with(ship_obj){  
        //var ship_map = scr_make_ship(g_row,g_col);        
        x = clamp( irandom(global.sector_width ), 1, global.sector_width );
        y = clamp( irandom(global.sector_width ), 1, global.sector_width );
        //ship_index = irandom(array_length_1d(global.ship_library)-1);
        var ship_results = scr_ship_search(ship_types.ship);
        if(ship_results != noone){
            ship_data = scr_array_random(ship_results);
        }else{
            ship_data=global.ship_library[0];
        }
        scr_instantiate_ship();
        //scr_update_ship_data();    
    }
     
}
