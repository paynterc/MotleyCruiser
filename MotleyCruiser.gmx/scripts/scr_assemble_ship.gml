/// Instantiate ship modules and assemble at location
var ship_map = argument0;
var x1 = argument1;
var y1 = argument2;

var module_map = ship_map[SHIP_MODULES];
ship_instance = instance_create(x1,y1,obj_player_ship_mod);

with(ship_instance){
    ship_map = argument0;
    modules = ship_map[SHIP_MODULES];
}
