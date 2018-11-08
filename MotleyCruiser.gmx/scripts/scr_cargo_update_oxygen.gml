/// scr_cargo_update_oxygen()
if(global.supply_oxygen<1){
    if(cargo_oxygen>0){
        scr_cargo_item_decrement(1,1);
        cargo_oxygen=scr_cargo_item_count(1);
        global.supply_oxygen = 100;
        flag_outOfOxygen=false;
        scr_ev_cargo_change(1);
    }else{
        global.supply_oxygen=0;
        if(!flag_outOfOxygen){
            flag_outOfOxygen=true;
            event_user(5);  
        }
    }
    
}else{
    flag_outOfOxygen=false;
}
