/// instantiate objects based on galaxy map

if(global.galaxy == noone){
    return false;
}
// pick a random sector
g_row = irandom(global.galaxy_width-1);
g_col = irandom(global.galaxy_width-1);

var sector = global.galaxy[g_row,g_col];
var suns = sector[? "suns"];
var sun = noone;

for(var i = 0; i < array_length_1d(suns); i++){
    sun = suns[i];
    // Instanitate an object with properties
    sun_obj = instance_create(sun[? "x1"],sun[? "y1"],obj_sun);
    with(sun_obj){
        var size_mod = sun[? "w1"] / sprite_get_width(spr_sun); 
        image_xscale = size_mod;
        image_yscale = size_mod;
        image_blend = sun[? "clr"];
        depth = 1000;
    }
}

var max_ships = 5;
var min_ships = 1;
var num_ships = irandom_range(min_ships,max_ships);
for(var i=1; i<=num_ships; i++){
    ship_obj = instance_create(irandom(global.sector_width),irandom(global.sector_width),obj_enemy_ship);
    with(ship_obj){
        image_index = floor( random( sprite_get_number(spr_ship_en) ) );
    } 
}
