/// Add health to player
//scr_heal_player(amount);
var amt = real(argument0);
if(instance_exists(obj_player)){
    obj_player.hp_current = min(obj_player.hp, obj_player.hp_current + amt);
       
    // Heal the crew
    for(var i=0;i<instance_number(obj_npc);i++){
        var crewmem = instance_find(obj_npc,i);
        if(crewmem.crew_index != noone){
            crewmem.hp_current = min(crewmem.hp, crewmem.hp_current + amt);  
        }
  
    }
}

