/***
Returns an array of arrays having data about locations in this sector
***/
// scr_galaxy_map_find_sector(sector x, sector y);
var sx = argument0;
var sy = argument1;
var result = ds_map_find_value(global.galaxy_map, string(sx) + "," + string(sy));

if(is_undefined(result)){
    return noone;    
}else{
    return result;
}
