/// Add health to player
//scr_heal_player(amount);
var amt = real(argument0);
if(instance_exists(obj_player)){
    obj_player.hp_current = min(obj_player.hp, obj_player.hp_current + amt);
       
    // Heal the crew
    for(var i=0;i<instance_number(obj_crew);i++){
        var crewmem = instance_find(obj_crew,i);
        crewmem.hp_current = min(crewmem.hp, crewmem.hp_current + amt);    
    }
    scr_hotbar_update("heal",-1);
}

