/// scr_cargo_update_fuel()
if(global.supply_fuel<1){

    if(cargo_fuel>0){
        scr_cargo_item_decrement(4,1);
        cargo_fuel=scr_cargo_item_count(4);
        global.supply_fuel = 100;
    }else{
        global.supply_fuel=0;
    }
    
}
