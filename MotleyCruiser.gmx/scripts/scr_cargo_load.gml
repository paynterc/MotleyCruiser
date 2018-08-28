/**********
Load inventory from file.
**********/
//scr_cargo_load(game)

ds_map_clear(global.cargo_list);

var game = argument0;
var i_string = ini_read_string(game, "cargo", "");
if(i_string != ""){
    ds_map_read(global.cargo_list, i_string);
}

global.cargo_total = scr_cargo_calc_ttl();
