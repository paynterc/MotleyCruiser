var npcSprite = noone;
if(sent != noone){
    npcSprite = sent.sprite_index;
}else{
    npcSprite = spr_ship_ai;
}

if(question==0){
    //  Do you want to buy fuel from me?
    // "sent" is a sentient character. An obj_npc.

    if(answer==1){
        // Yes, I want to buy fuel for gold.

        if( global.credits >= priceRefuel ){
            global.credits -= priceRefuel;
            if(instance_exists(obj_player_ship)){
                obj_player_ship.disabled=false;
                scr_cargo_drop(obj_player_ship.x, obj_player_ship.y,4,1,true);
            }                   
            scr_flywriter("Pleasure doing business with you.",npcSprite,true,"10,Thanks!");

            
        }else{
            scr_flywriter("You don't have enough gold!",npcSprite,true,"10,Ummmm.");// Goes to Default Response below 
        }
        
    }else if(answer==2){
    
        if( scr_get_active_crew_count() > 0 ){
        
            var unCrew = scr_crew_get_random();
            if(instance_exists(obj_player_ship)){
                obj_player_ship.disabled=false;
                scr_cargo_drop(obj_player_ship.x, obj_player_ship.y,4,1,true);
            }
            scr_flywriter("Fine. Slaves fetch a decent price around here.",npcSprite,true,"10,Bye " +unCrew[NPC_NAME_FIRST]);
            
            scr_queue_bark( string(unCrew[NPC_NAME_FIRST]) + ": You'll regret this!",unCrew[NPC_SPRITE_TEMP]);
            scr_global_update(global.crew,unCrew[NPC_CREW_INDEX],NPC_ACTIVE,false);

            
        }else{
            scr_flywriter("Wait, you don't have any crew.",npcSprite,true,"10,Oops.");// Goes to Default Response below                      
        }

    }else if(answer==3){
        // Board ship
        alarm[2]=room_speed;
        obj_ship_data.distressBeacon=false;
    }else{
        scr_flywriter("Have it your way.",npcSprite,true,"10,Later.");        
    }

}else if(question==1){
    if(answer==1){
        // Yes, I want to buy fuel for gold.
        if( global.credits >= priceRefuel ){
            global.credits -= priceRefuel;
            if(instance_exists(obj_player_ship)){
                obj_player_ship.disabled=false;
                scr_cargo_drop(obj_player_ship.x, obj_player_ship.y,4,1,true);
            }                   
            scr_flywriter("Pleasure doing business with you.",npcSprite,true,"10,Thanks!");

            
        }else{
            scr_flywriter("You don't have enough gold!",npcSprite,true,"10,Ummmm.");// Goes to Default Response below 
        }
        
    }else if(answer==2){
        // Board ship
        alarm[2]=room_speed;
        obj_ship_data.distressBeacon=false;
    }else{   
        scr_flywriter("Have it your way.",npcSprite,true,"10,Later.");
    }
    
}else if(question==2){
    if(answer==1){
    
        if( scr_get_active_crew_count() > 0 ){
        
            var unCrew = scr_crew_get_random();
            if(instance_exists(obj_player_ship)){
                obj_player_ship.disabled=false;
                scr_cargo_drop(obj_player_ship.x, obj_player_ship.y,4,1,true);
            }
            scr_flywriter("Fine. Slaves fetch a decent price around here.",npcSprite,true,"10,Bye " +unCrew[NPC_NAME_FIRST]);
            
            scr_queue_bark( string(unCrew[NPC_NAME_FIRST]) + ": You'll regret this!",unCrew[NPC_SPRITE_TEMP]);
            scr_global_update(global.crew,unCrew[NPC_CREW_INDEX],NPC_ACTIVE,false);
            
        }else{
            scr_flywriter("Wait, you don't have any crew.",npcSprite,true,"10,Oops.");// Goes to Default Response below                     
        }

    }else if(answer==2){
        // Board ship
        alarm[2]=room_speed;
        
    }else{   
        scr_flywriter("Have it your way.",npcSprite,true,"10,Later.");
    }
}else if(question==3){


    if(answer==1){
        if(instance_exists(obj_player_ship)){
            obj_player_ship.disabled=false;
            scr_cargo_drop(obj_player_ship.x, obj_player_ship.y,4,1,true);
        }
    }else if(answer==2){
        // Board ship
        alarm[2]=room_speed;
        
    }
    obj_ship_data.distressBeacon=false;
    scr_dlg_end_dialogue();
}else{
    // Default Respose
    // User responed to some other question like "10,Oops". Back to first question.
    scr_dlg_end_dialogue();
    obj_ship_data.distressBeacon=false;
             
}
