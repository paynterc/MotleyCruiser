//scr_location_translate(type,index)
/****
LOC_X1=0
LOC_X2=1
LOC_NAME=2
LOC_NPCS=3
LOC_SECTOR=4
LOC_GLOBAL_INDEX=5
LOC_TYPE=6
LOC_NAME_1=7

****/


var type = argument0;
var index = argument1;
var loc_map = scr_location();

var loc = scr_get_location(type,index);
if(loc==noone){
    return noone;
}

var name;
if(type=="planet"){
    name = loc[PLANET_NAME];
    loc_map[LOC_X1] = loc[PLANET_X1];
    loc_map[LOC_Y1] = loc[PLANET_Y1];
    loc_map[LOC_NAME] = loc[PLANET_NAME];
    loc_map[LOC_NPCS] = loc[PLANET_NPCS];
    loc_map[LOC_SECTOR] = loc[PLANET_SECTOR];
    loc_map[LOC_GLOBAL_INDEX] = loc[PLANET_GLOBAL_INDEX];
    loc_map[LOC_TYPE] = "planet";
    loc_map[LOC_NAME_1] = name[0];
}else if(type=="moon"){
    name = loc[MOON_NAME];
    loc_map[LOC_X1] = loc[MOON_X1];
    loc_map[LOC_Y1] = loc[MOON_Y1];
    loc_map[LOC_NAME] = loc[MOON_NAME];
    loc_map[LOC_NPCS] = loc[MOON_NPCS];
    loc_map[LOC_SECTOR] = loc[MOON_SECTOR];
    loc_map[LOC_GLOBAL_INDEX] = loc[MOON_GLOBAL_INDEX];
    loc_map[LOC_TYPE] = "moon";
    loc_map[LOC_NAME_1] = name[0];
}else if(type=="station"){
    name = loc[STATION_NAME];
    loc_map[LOC_X1] = loc[STATION_X1];
    loc_map[LOC_Y1] = loc[STATION_Y1];
    loc_map[LOC_NAME] = loc[STATION_NAME];
    loc_map[LOC_NPCS] = loc[STATION_NPCS];
    loc_map[LOC_SECTOR] = loc[STATION_SECTOR];
    loc_map[LOC_GLOBAL_INDEX] = loc[STATION_GLOBAL_INDEX];
    loc_map[LOC_TYPE] = "station";
    loc_map[LOC_NAME_1] = name[0];
}

return loc_map;
