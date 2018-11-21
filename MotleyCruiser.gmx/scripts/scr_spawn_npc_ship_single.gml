///scr_spawn_npc_ship_single(faction,ship_index,x,y)

var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var faction = args[0];
var ship_index = args[1];
var x1 = args[2];
var y1 = args[3];

if(ship_index >= array_length_1d(global.ship_library)){
    return noone;
}

var ship_obj = instance_create(x1,y1,obj_npc_ship);
    ship_obj.faction = faction;
var found_ship = noone;
with(ship_obj){  
    
         
    if(ship_index==noone){
        //ship_i = irandom(array_length_1d(global.ship_library)-1);
        var ship_results = scr_ship_search(ship_types.ship,noone,faction);
        if(ship_results != noone){
            ship_data = scr_array_random(ship_results);
        }else{
            ship_data=global.ship_library[0];
        }

    }else{
        if(ship_index<array_length_1d(global.ship_library)){
            ship_data = global.ship_library[ship_index];
        }else{
            ship_data=global.ship_library[0];
        }   
    }
    
    scr_instantiate_ship();
    scr_update_ship_data();    
}

return ship_obj;
