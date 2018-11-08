/// What happens
// scr_ev_cargo_change(comm_index);
var comm_index = argument0;
/***
var cargo_food=scr_cargo_item_count(0);
var cargo_oxygen=scr_cargo_item_count(1);
var cargo_water=scr_cargo_item_count(3);
var cargo_fuel=scr_cargo_item_count(4);
***/
var commName = scr_commodity_lib_read(comm_index,0);// get name
var qty = scr_cargo_item_count(comm_index);
if(commName!=noone){
    if(qty<1){
        scr_crew_bark("We're running low on " + commName + ".");
    }
}
