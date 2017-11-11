/**********
Load inventory from file.
**********/
//scr_inv_load(game)

inventory_clear();

var game = argument0;
var i_string = ini_read_string(game, "inventory", "");
if(i_string != ""){
    ds_map_read(global.inventory, i_string);
}

