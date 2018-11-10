if(question==0){
    // Question 0. Manufacture Oxygen?
    if(answer==1){
        
        //Do manufacture
        var waterCount = scr_cargo_item_count(3);
        var fuelCount = scr_cargo_item_count(4);
        if(waterCount>=2 && fuelCount>=1 ){
            scr_cargo_item_decrement(3,2);
            scr_cargo_item_decrement(4,1);
            if(instance_exists(obj_player_ship)){
                obj_player_ship.disabled=false;
                scr_cargo_drop(obj_player_ship.x, obj_player_ship.y,1,2,true);// Drop some oxygen loot
            }
            scr_dlg_end_dialogue();
        }else{
        
            scr_flywriter("You don't have enough materials to make oxygen.",spr_ship_ai,true,"10,Oh.");// Goes to Default Response below
             
        }
        
    }else if(answer==2){
        //Do abandon
        scr_dlg_end_dialogue();
    }else{
        // No
        scr_dlg_end_dialogue();// Back to question 0.                
    }
}else{
    scr_dlg_end_dialogue();
}
