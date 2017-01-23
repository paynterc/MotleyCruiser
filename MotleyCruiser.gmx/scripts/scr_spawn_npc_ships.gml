///scr_spawn_npc_ships()
var sector_limit = GLOBAL_SHIP_LIMIT;
var sector_count = instance_number(obj_ship);

if(sector_count>sector_limit) exit;

//Choose a faction
var thefaction = choose(FACTION_PIRATE,FACTION_TRADER,FACTION_TRADER,FACTION_REBEL,FACTION_FEDERATION,FACTION_BOUNTYHUNTER);
var thedisposition = DISPOSITION_NEUTRAL;
var themode = MODE_TRAVELING;
if(thefaction == FACTION_PIRATE){
    thedisposition = DISPOSITION_HOSTILE;
    themode = MODE_ATTACKING;   
}



var max_ships = 3;
var min_ships = 1;
var num_ships = irandom_range(min_ships,max_ships);
for(var i=1; i<=num_ships; i++){
    

    // Find a target for the ships. Either planet, moon or station.
    // Hostile units WILL retarget to player regardless of what we do here.
    tgt = scr_find_landable_target();

    var ship_obj = instance_create(100,100,obj_npc_ship);
    ship_obj.faction = thefaction;
    ship_obj.disposition = thedisposition;
    ship_obj.target = tgt;
    ship_obj.target_save = tgt;
    ship_obj.mode = themode;
    with(ship_obj){  
        //var ship_map = scr_make_ship(g_row,g_col);        
        x = clamp( irandom(global.sector_width ), 1, global.sector_width );
        y = clamp( irandom(global.sector_width ), 1, global.sector_width );
        ship_index = irandom(array_length_1d(global.ship_library)-1);
        ship_data = global.ship_library[ship_index];
        scr_instantiate_ship();    
    }
     
}
