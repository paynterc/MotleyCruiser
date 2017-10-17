/**********
Load galaxy from file.
**********/
//scr_load_galaxy(game)
var game = argument0;

ds_map_clear(global.galaxy);

var i_string = ini_read_string(game, "galaxy", "");
if(i_string != ""){
    ds_map_read(global.galaxy, i_string);
}
