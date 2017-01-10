/// Get a random entitity from galaxy data
// scr_find_random_mission_target(type,range,current_location)

var type = argument0;
var range = argument1;
var current_loc = argument2;//string


if(range<1){
    range=1;
}

var cloc = scr_str_split(current_loc,",");
var ltype = cloc[0];
var lindex = real(cloc[1]);
var srow = real(cloc[2]);
var scol = real(cloc[3]);


var result = noone;

var rrow = clamp(irandom_range(srow-range, srow+range), 0, global.galaxy_width-1);
var rcol = clamp(irandom_range(scol-range, scol+range), 0, global.galaxy_width-1);

var index = noone;
var sector = global.galaxy[rrow,rcol];


switch(type){
    case("npc"):
        index = scr_array_random(sector[SECTOR_NPCS]);
        if(index>0){
            result = index;
        }
        break;
    case("planet"):
        index = scr_array_random(sector[SECTOR_PLANETS]);
        if(index>-1){
            result = global.planets[index];
        }
        break;
    case("moon"):
        index = scr_array_random(sector[SECTOR_MOONS]);
        if(index>-1){
            result = global.moons[index];
        }
        break;
    case("station"):
        index = scr_array_random(sector[SECTOR_STATIONS]);
        if(index>-1){
            result = global.stations[index];
        }
        
        break;
}

return result;
