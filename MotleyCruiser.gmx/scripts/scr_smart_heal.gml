/// scr_smart_heal()
/***
Select the most appropriate healpack. Use whatever we have if there are no other
options.
***/

if(!instance_exists(obj_player)) return false;

var heal_player = obj_player.hp_current<obj_player.hp;
var heal_crewmem = false;

// Check for injured crew
for(var i=0;i<instance_number(obj_crew);i++){
    var crewmem = instance_find(obj_crew,i);
    if(crewmem.hp_current<crewmem.hp){
        heal_crewmem=true;
        break;
    }
}


if(!heal_crewmem && !heal_player){
    audio_play_sound(snd_fail,1,0);
    return false; // No damage. No need to heal
}

var heal1=42;// Item 42 is a healbag.


if(scr_hotbar_count("heal")>0){
    scr_hotbar_update("heal",-1);
    scr_heal_player(10);
    audio_play_sound(snd_heal,2,0);       
}else{
    audio_play_sound(snd_fail,1,0);
}
