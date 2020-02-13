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
if(cIndex==noone){
    if(debug_mode){show_debug_message("DEBUG: No crew index sent to scr_dlg_galley")}
    return false;
}

var textNegative = choose("I'm not happy about this","Disapointing","You'll regret this.","You're killing me.","I'm getting tired of this.","You haven't heard the last of this.");
var textPositive = choose("Great.","Thanks.","I approve.","Good choice.");
if(question==0){
    //  I want more money.
    // "sent" is a sentient character. An obj_npc.

    if(answer==2){
        if(global.credits>=100){
            global.credits -= 100;
            scr_flywriter("Thanks.",npcSprite,true,"10,OK.");// Goes to Default Response below
            scr_grievance_delete(cIndex,grievances.money);
            scr_morale_add(cIndex,1); 
        }else{
            scr_flywriter("I don't have enough money for that.",global.player_sprite,true,"10,OK.");// Goes to Default Response below
        }
    }else{
        scr_flywriter(textNegative,npcSprite,true,"10,OK.");
        //scr_morale_add(cIndex,-1);       
    }


}else if(question==1){

    //  The food is terrible. How about hiring a new cook.
    if(answer==2){
        // Ok, I'll start looking for a cook.
        scr_flywriter("Great.",npcSprite,true,"10,Bye.");// Goes to Default Response below
        // This grievance won't be delted until the cook is hired.
    }else{
        scr_flywriter(textNegative,npcSprite,true,"10,OK.");
    }
    
}else if(question==2){

    //  I want to rest. More time on station.
    if(answer==2){
        // Ok, we'll rest here for a day.
        scr_flywriter("Great.",npcSprite,true,"10,Bye.");// Goes to Default Response below
        // Delete exhaustion for all crew
        scr_grievance_delete_all(grievances.exhaustion);
        // A day goes by
        global.day++;
        scr_daily_expenses();
        
    }else{
        scr_flywriter(textNegative,npcSprite,true,"10,OK.");    
    }
    

}else if(question==3){
    //  This place is a mess.

    if(answer==2){
    
        // Ok, let's clean up.
        scr_flywriter("Much better.",npcSprite,true,"10,Bye.");// Goes to Default Response below 
        scr_grievance_delete_all(grievances.cleanliness);

    }else{
        scr_flywriter(textNegative,npcSprite,true,"10,OK."); 
    }


}else if(question==4){
    //  I'm lonely. I want a pet.
    if(answer==2){
        // Ok, you can get one.
        scr_flywriter("Great.",npcSprite,true,"10,Bye.");// Goes to Default Response below
        // Grievance will be deleted after the user purchases a pet. This should fire the boughtPet event and run a script to improve morale.
    }else{
        // Grievance has been addressed and can be removed, but at a morale cost.
        scr_flywriter(textNegative,npcSprite,true,"10,OK.");   
    }

}else{
    // Default Respose
}
