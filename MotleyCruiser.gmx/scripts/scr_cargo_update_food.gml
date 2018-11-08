/// scr_cargo_update_food()
if(global.supply_food<1){
    if(cargo_food>0){
        scr_cargo_item_decrement(0,1);
        cargo_food=scr_cargo_item_count(0);
        global.supply_food = 100;
        flag_outOfFood=false;
        scr_ev_cargo_change(0);
    }else{
        global.supply_food=0;
        if(!flag_outOfFood){
            flag_outOfFood=true;
            event_user(3);  
        }
    }
}else{
    flag_outOfFood=false;
}
