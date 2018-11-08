/// Return active crew
var activeCrew = noone;
if(!is_array(global.crew) || global.crew==noone){
    return noone;
}
 
for(var i=0; i<array_length_1d(global.crew); i++){
    var cmate=global.crew[i];
    if(cmate[NPC_ACTIVE]){
        activeCrew = scr_push_array(activeCrew,cmate);
    }
}

return activeCrew;
