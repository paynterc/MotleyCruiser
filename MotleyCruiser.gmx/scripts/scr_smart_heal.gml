/***
Select the most appropriate healpack. Use whatever we have if there are no other
options.
***/
//scr_smart_heal()
if(!instance_exists(obj_player)) return false;
var hp = obj_player.hp;
var hpc = obj_player.hp_current;
var hpd = hp-hpc;

if(hp==hpc) return false; // No damage. No need to heal

var heal1;
var heal2;

if(hpd>5){
    // More than 5 damage. Use a big heal.
    heal1=42;
    heal2=9;

}else{
    // Prioritize a small heal
    heal1=9;
    heal2=42;
}

if(scr_inv_item_count(heal1)>0){
    scr_inv_item_decrement(heal1);
    scr_script_parse(item_id_read(heal1,4));
    audio_play_sound(snd_heal,2,0);      
}else if(scr_inv_item_count(heal2)>0){
    scr_inv_item_decrement(heal2);
    scr_script_parse(item_id_read(heal2,4));
    audio_play_sound(snd_heal,2,0);       
}else{
    audio_play_sound(snd_fail,1,0);
}
