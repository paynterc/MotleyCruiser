///scr_spawn_npc_ships()
var sector_limit = 20;
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

// Find a target for the ships. Either player, planet or station.
// Hostile targets should retarget to player.
var tgt = noone;
var tgt_count = instance_number(obj_landable);
if(tgt_count>0){
    tgt = instance_find(obj_landable,irandom(tgt_count - 1))
}else{
    tgt = obj_space_level;
}

var max_ships = 3;
var min_ships = 1;
var num_ships = irandom_range(min_ships,max_ships);
for(var i=1; i<=num_ships; i++){
    
    var ship_obj = instance_create(100,100,obj_npc_ship);
    ship_obj.faction = thefaction;
    ship_obj.disposition = thedisposition;
    ship_obj.target = tgt;
    ship_obj.mode = themode;
    with(ship_obj){  
        //var ship_map = scr_make_ship(g_row,g_col);        
        x = clamp( irandom(global.sector_width ), 1, global.sector_width );
        y = clamp( irandom(global.sector_width ), 1, global.sector_width );
        ship_data = scr_array_random(global.ship_library);
        scr_instantiate_ship();    
    }
     
}
