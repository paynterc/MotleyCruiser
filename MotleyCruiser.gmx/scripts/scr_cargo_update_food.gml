/// scr_cargo_update_food()
if(global.supply_food<1){
    if(cargo_food>0){
        scr_cargo_item_decrement(0,1);
        cargo_food=scr_cargo_item_count(0);
        global.supply_food = 100;
    }else{
        global.supply_food=0;
    }
}
