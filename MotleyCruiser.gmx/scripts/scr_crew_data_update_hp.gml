//scr_crew_update_all(pos or neg value)
var val = argument0;
if( is_array(global.crew) ){
    for(var i=0; i<array_length_1d(global.crew); i++){
        var thisCrew = global.crew[i];
        if(thisCrew[NPC_ACTIVE]){
            thisCrew[@ NPC_HP_CURRENT]+=val;
        }
    }
    for(var i=0; i<array_length_1d(global.crew); i++){
        var thisCrew = global.crew[i];
        if(thisCrew[NPC_ACTIVE] && thisCrew[NPC_HP_CURRENT]<1){
            thisCrew[@ NPC_ACTIVE]=false;
            scr_ev_crew_died(i);
        }
    }
    
    
}
