/// scr_cargo_update_water()
if(global.supply_water<1){
    if(cargo_water>0){
        scr_cargo_item_decrement(3,1);
        cargo_water=scr_cargo_item_count(3);
        global.supply_water = 100;
        flag_outOfWater=false;
        scr_ev_cargo_change(3);
    }else{
        global.supply_water=0;
        if(!flag_outOfWater){
            flag_outOfWater=true;
            event_user(4);  
        }
    }
}else{
    flag_outOfWater=false;
}
