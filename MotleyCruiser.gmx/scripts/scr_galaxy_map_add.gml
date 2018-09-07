/// scr_galaxy_map_add(sector x, sector y, value)
// value will be an array or arrays containing data about locations

var key = string(argument0) + "," + string(argument1);
var value = argument2;

//var key = "0,0";
//var value = noone;
//value[0]=scr_array(10000,1000,"sun");
//value[1]=scr_array(1000,1000,"planet");
//value[2]=scr_array(5000,8000,"planet");

ds_map_replace(global.galaxy_map, key, value);

