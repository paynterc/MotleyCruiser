/// scr_cargo_update_water()
if(global.supply_water<1){
    if(cargo_water>0){
        scr_cargo_item_decrement(3,1);
        cargo_water=scr_cargo_item_count(3);
        global.supply_water = 100;
    }else{
        global.supply_water=0;
    }
}
