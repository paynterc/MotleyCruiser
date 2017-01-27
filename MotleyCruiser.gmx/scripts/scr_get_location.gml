/// Return planet, moon, station or npc from global index
// scr_get_location(type, index)
var location_type = argument0;
var location_index = real(argument1);

var location = noone;
var returnmap = noone;

if(location_type=="station"){
    location = global.stations[location_index];

}else if(location_type=="planet"){
    location = global.planets[location_index];

}else if(location_type=="moon"){
    location = global.moons[location_index];

}else if(location_type=="npc"){
    location = global.npcs[location_index];
}

return location;
