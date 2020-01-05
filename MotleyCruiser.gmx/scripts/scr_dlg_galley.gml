/// Crew grievances and responses
var npcSprite = noone;
var npcData = noone;
var cIndex = noone;
if(sent != noone){
    npcSprite = sent.sprite_index;
    npcData = sent.npc_data;
    cIndex = scr_get_array_1d(npcData,NPC_CREW_INDEX);

}else{
    npcSprite = spr_ship_ai;
}

if(question==0){
    //  I want more money.
    // "sent" is a sentient character. An obj_npc.

    if(answer==2){
        if(global.credits>=100){
            global.credits -= 100;
            scr_flywriter("Thanks.",npcSprite,true,"10,OK.");// Goes to Default Response below
            scr_morale_add(cIndex,1); 
        }else{
            scr_flywriter("I don't have enough money for that.",global.player_sprite,true,"10,OK.");// Goes to Default Response below
        }
    }else{
        scr_flywriter("You're cheap.",npcSprite,true,"10,OK.");
        scr_morale_add(cIndex,-1);       
    }
    // Delete the grievance, even if denied. No need to keep repeating it.
    if(is_array(npcData)){
        scr_grievance_delete(npcData[NPC_CREW_INDEX],grievances.money);
    }

}else if(question==1){

    //  The food is terrible. How about hiring a new cook.
    if(answer==2){
        // Ok, I'll start looking for a cook.
        scr_flywriter("Great.",npcSprite,true,"10,Bye.");// Goes to Default Response below
        // This grievance won't be delted until the cook is hired.
    }else{
        scr_flywriter("Grr.",npcSprite,true,"10,OK."); 
        scr_morale_add(cIndex,-1);      
    }
    
}else if(question==2){

    //  I want to rest. More time on station.
    if(answer==2){
        // Ok, we'll rest here for a day.
        scr_flywriter("Great.",npcSprite,true,"10,Bye.");// Goes to Default Response below
        // Delete exhaustion for all crew
        var cidx;
        for(var i=0;i<array_length_1d(global.crew);i++){
            if( !is_array(global.crew[i]) ){
                continue;
            }
            thisCrew = global.crew[i];
            if( !thisCrew[NPC_ACTIVE] ){
                continue;
            }
            cidx = scr_get_array_1d(thisCrew,NPC_CREW_INDEX);
            scr_grievance_delete(cidx,grievances.exhaustion);
            scr_morale_add(cidx,1);
        }
        // A day goes by
        global.day++;
        scr_daily_expenses();
        
    }else{
        scr_flywriter("You're killing me.",npcSprite,true,"10,OK.");
        scr_grievance_delete(cIndex,grievances.exhaustion);     
    }
    

}else if(question==3){
    //  This place is a mess.

    if(answer==2){
    
        // Ok, let's clean up.
        scr_flywriter("Much better.",npcSprite,true,"10,Bye.");// Goes to Default Response below 
        var cidx;
        for(var i=0;i<array_length_1d(global.crew);i++){
            if( !is_array(global.crew[i]) ){
                continue;
            }
            thisCrew = global.crew[i];
            if( !thisCrew[NPC_ACTIVE] ){
                continue;
            }
            cidx = scr_get_array_1d(thisCrew,NPC_CREW_INDEX);
            scr_grievance_delete(cidx,grievances.cleanliness);
            scr_morale_add(cidx,1);
        }

    }else{
        scr_flywriter("You're a slob.",npcSprite,true,"10,OK.");
        scr_grievance_delete(cIndex,grievances.cleanliness);   
    }


}else if(question==4){
    //  I'm lonely. I want a pet.
    if(answer==2){
        // Ok, you can get one.
        scr_flywriter("Great.",npcSprite,true,"10,Bye.");// Goes to Default Response below
        scr_morale_add(cIndex,1);
        // Create a pet and assign it to this crew member. Should appear at next stop.
    }else{
        scr_flywriter("I'm not happy about this.",npcSprite,true,"10,OK.");
        scr_morale_add(cIndex,-1);        
    }
    if(is_array(npcData)){
        scr_grievance_delete(cIndex,grievances.loneliness);
    }
}else{
    // Default Respose
}
