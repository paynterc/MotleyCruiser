///scr_spawn_npc_ships_ext(count,faction,ship_index,x,y)

var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var count = args[0];
var faction = args[1];
var ship_index = args[2];
var x1 = args[3];
var y1 = args[4];

var sector_limit = 40;
var sector_count = instance_number(obj_ship);

if(sector_count>sector_limit) exit;

if( ship_index >= array_length_1d(global.ship_library) ){
    ship_index  = 0;
}

//Choose a faction
var thefaction = faction;
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


var num_ships = count;
var ship_i;
for(var i=1; i<=num_ships; i++){
    
    var ship_obj = instance_create(100,100,obj_npc_ship);
    ship_obj.faction = thefaction;
    ship_obj.disposition = thedisposition;
    ship_obj.target = tgt;
    ship_obj.mode = themode;
    with(ship_obj){  
        //var ship_map = scr_make_ship(g_row,g_col); 
        if(x1==noone){
            x = clamp( irandom(global.sector_width ), 1, global.sector_width );
        }else{
            x = x1;
        } 
        
        if(y1==noone){
            y = clamp( irandom(global.sector_width ), 1, global.sector_width );
        }else{
            y = y1;
        }  
             
        if(ship_index==noone){
            ship_i = irandom(array_length_1d(global.ship_library)-1);
        }else{
            ship_i = ship_index;
        }
        ship_data = global.ship_library[ship_index];
        scr_instantiate_ship();    
    }
     
}
