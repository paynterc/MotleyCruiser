if(question==0){
    // Question 0. Out of fuel, what now
    if(answer==1){
        // Out of fuel. Send distress signal.
        scr_flywriter("Activating distress beacon could also alert unfriendly ships to our location. Do you want to proceed?",spr_ship_ai,true,"1,Yes,No");
    }else if(answer==2){
        // Out of fuel. Manufacture fuel.
        scr_flywriter("Manufacturing 1 unit of fuel will require 2 oxygen, 1 water, 100 gold. Do you want to proceed?",spr_ship_ai,true,"2,Yes,No");
    }else if(answer==3){
        // Out of fuel. Abandon ship.
        scr_flywriter("You will lose your ship and escape pods will be sent to your last port of landing. Do you want to proceed?",spr_ship_ai,true,"3,Yes,No");
    }else{
        scr_dlg_end_dialogue();
    }
}else if(question==1){
    // Question 1. Distress Beacon?
    if(answer==1){
        //Do distress beacon
        if(!obj_ship_data.distressBeacon){
            obj_ship_data.distressBeacon=true;
            obj_game_control.pauseForce = false;
            global.paused=false;
            if(instance_exists(obj_player_ship)){
                var rship = scr_spawn_npc_ship_single(FACTION_NEUTRAL,noone,obj_player_ship.x + 500,obj_player_ship.y+500);
                rship.target = obj_player_ship;
                rship.mode = MODE_REFUELING;
            }
            state=noone;
        }else{
            scr_flywriter("You're already sending out a distress signal.",spr_ship_ai,true,"10,Right");
        }
        
        
    }else{
        // No
        alarm[1]=room_speed*2;// Back to question 0.                
    }
}else if(question==2){
    // Question 2. Manufacture fuel?
    if(answer==1){
        
        //Do manufacture
        var oxyCount = scr_cargo_item_count(1);
        var waterCount = scr_cargo_item_count(3);
        if(oxyCount>=2 && waterCount>=1 && global.credits>=100){
            scr_cargo_item_decrement(1,2);
            scr_cargo_item_decrement(3,1);
            global.credits -= 100;
            if(instance_exists(obj_player_ship)){
                obj_player_ship.disabled=false;
                scr_cargo_drop(obj_player_ship.x, obj_player_ship.y,4,2,true);
            }
            scr_dlg_end_dialogue();
        }else{
        
            scr_flywriter("You don't have enough materials to make fuel.",spr_ship_ai,true,"10,Ummmm.");// Goes to Default Response below
             
        }
        
    }else{
        // No
        alarm[1]=room_speed*2;// Back to question 0.                
    }
}else if(question==3){
    // Question 3. Abandon ship?
    if(answer==1){
        //Do abandon
        scr_dlg_end_dialogue();
    }else{
        // No
        alarm[1]=room_speed*2;// Back to question 0.                
    }
}else{
    scr_dlg_end_dialogue();
}
