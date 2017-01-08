/// See if an npc has a given trait
// scr_has_trait(trait_id, traits)
var trait_id = argument0;
var traits = argument1;
if( !is_array(traits) || traits == noone){
    return false;
}
for(var i=0; i<array_length_1d(traits); i++){
    if(traits[i]==trait_id){
        return true;
    }
}
return false;
