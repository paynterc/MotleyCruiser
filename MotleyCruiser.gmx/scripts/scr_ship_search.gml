/**********
References the library scr_ships
Returns ships by class and faction
Type: Ship, Drone, Platform
Factions: Pirates, Traders, Race Factions

see

**********/
/// scr_ship_search(class,faction)
var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var type = args[0];// enum ship_type
var class = args[1];// enum ship_class
var faction = args[2];// macro factions



var ship, mvalue;
var ships = global.ship_library;
var filtered = noone;

if(type!=noone && ships!=noone){
    for(var i = 1; i<array_length_1d(ships); i++){
        ship = ships[i];
        mvalue = scr_get_array_1d(ship,SHIP_TYPE);
        if(mvalue==type){
            filtered=scr_push_array(filtered,ship);      
        }
    }
    ships=filtered;
    filtered = noone;
}

if(class!=noone && ships!=noone){
    for(var i = 1; i<array_length_1d(ships); i++){
        ship = ships[i];
        mvalue = scr_get_array_1d(ship,SHIP_CLASS);
        if(mvalue==class){
            filtered=scr_push_array(filtered,ship);      
        }
    }
    ships=filtered;
    filtered = noone;
}

if(faction!=noone && ships!=noone){

    for(var i = 1; i<array_length_1d(ships); i++){
        ship = ships[i];
        mvalue = scr_get_array_1d(ship,SHIP_FACTION);
        if(real(mvalue)==faction){
            filtered=scr_push_array(filtered,ship);      
        }
    }
    ships=filtered;
    filtered = noone;
}

return ships;
