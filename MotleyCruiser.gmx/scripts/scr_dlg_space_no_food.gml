/// scr_dlg_space_no_food
if(question==0){
    // Question 0. Eat crewmate?
    if(answer==1){
        
        //Do manufacture
        if( scr_get_active_crew_count() > 0 ){
            var unCrew = scr_crew_get_random();
            if(instance_exists(obj_player_ship)){
                obj_player_ship.disabled=false;
                scr_cargo_drop(obj_player_ship.x, obj_player_ship.y,0,1,true);
            }
            scr_flywriter("You decided to eat " + unCrew[NPC_NAME_FIRST] + ". They were delicious.",spr_ship_ai,true,"10,Bye " +unCrew[NPC_NAME_FIRST]);
            
            scr_queue_bark( string(unCrew[NPC_NAME_FIRST]) + ": You'll be sorry!",unCrew[NPC_SPRITE_TEMP]);
            scr_global_update(global.crew,unCrew[NPC_CREW_INDEX],NPC_ACTIVE,false);
            
        }else{
        
            scr_flywriter("You don't have any crew members to eat.",spr_ship_ai,true,"10,Uh oh.");// Goes to Default Response below
             
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
