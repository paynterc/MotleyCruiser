if(question==0){
    // Question 0. Out of fuel, what now
    if(answer==1){
        // Out of fuel. Send distress signal.
        scr_flywriter("Activating distress beacon could also alert unfriendly ships to our location. Do you want to proceed?",spr_ship_ai,true,"1,Yes,No");
    }else if(answer==2){
        // Out of fuel. Manufacture fuel.
        scr_flywriter("Manufacturing 1 unit of fuel will require 2 oxygen, 1 water, 300 gold. Do you want to proceed?",spr_ship_ai,true,"2,Yes,No");
    }else if(answer==3){
        // Out of fuel. Abandon ship.
        scr_flywriter("You will lose your ship and escape pods will be sent to your last port of landing. Do you want to proceed?",spr_ship_ai,true,"3,Yes,No");
    } 
}else if(question==1){
    // Question 1. Distress Beacon?
    if(answer==1){
        //Do distress beacon
        obj_game_control.pauseForce = false;
        global.paused=false;
        if(instance_exists(obj_player_ship)){
            var rship = scr_spawn_npc_ship_single(FACTION_NEUTRAL,noone,obj_player_ship.x + 500,obj_player_ship.y+500);
            rship.target = obj_player_ship;
            rship.mode = MODE_REFUELING;
        }
        state=noone;
        
    }else{
        // No
        alarm[1]=room_speed*2;// Back to question 0.                
    }
}else if(question==2){
    // Question 2. Manufacture fuel?
    if(answer==1){
        //Do manufacture
        obj_game_control.pauseForce = false;
        global.paused=false;
        state=noone;
    }else{
        // No
        alarm[1]=room_speed*2;// Back to question 0.                
    }
}else if(question==3){
    // Question 3. Abandon ship?
    if(answer==1){
        //Do abandon
        obj_game_control.pauseForce = false;
        global.paused=false;
        state=noone;
    }else{
        // No
        alarm[1]=room_speed*2;// Back to question 0.                
    }
}
