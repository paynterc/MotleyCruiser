/****
Cargo is commodities you are carrying. See scr_commoditiy_lib_int for possible
cargo. 
****/
// scr_cargo_init()

global.cargo_list = ds_map_create();
global.cargo_total = 0;// Holds the total units of cargo
