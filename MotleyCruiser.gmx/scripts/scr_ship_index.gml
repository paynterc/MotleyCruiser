/**********
References the library scr_ships
Returns ships by type and faction
Type: Ship, Drone, Platform
Factions: Pirates, Traders, Race Factions
**********/
var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var type = args[0];
var faction = args[1];
var race = args[2];

if(type!=noone){
    if(type=="drone"){
        return scr_array(20);
    }else if(type=="platform"){
        return scr_array(22);
    }else{
        var ships = scr_new_array();
        for(var i=0; i<array_length_1d(global.ship_library); i++){
            if(i!=21 && i!=23){
                ships = scr_push_array(ships,i);
            }
        }
        return ships;
    }
}
