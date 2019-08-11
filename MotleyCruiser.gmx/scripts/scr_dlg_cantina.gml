if(question==0){
    // Hire NPC
    // "sent" is a sentient character. An obj_npc.
    if(answer==1){
    
        var bunks = obj_ship_data.bunks;
        
        if( obj_ship_data.bunks <= scr_get_active_crew_count()+1 ){     
            scr_flywriter("You don't have enough bunks on your ship to hire more crew.",noone,0,"10,OK");
        }else{
            scr_add_npc_to_crew(sent);
        }
        sent=noone;
    }
    
}else if(question==1){

    if(answer==1){
        sent=noone;
    }
    
}else if(question==2){

    // Repair ship
    if(answer==1){
        var repairCost = scr_repair_all_ship_cost();
        if(repairCost<=global.credits || repairCost == 0 ){
            scr_repair_all_ships(repairCost);
            scr_flywriter("Thank you for your business. Your ships will be repaired by the time you depart.",sent.sprite_index,true,"1,OK");
        }else{
            scr_flywriter("You can't afford it. Come back when you've earned enough credits.",sent.sprite_index,true,"1,OK");
        }
        
        sent=noone;
        
    }

        
}
