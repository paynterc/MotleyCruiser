///scr_morale_add(crewIndex,amt)
var crewIndex = argument0;
var amt = argument1;
var rslt = noone;
for(var i=0;i<array_length_1d(global.crew);i++){
    if( !is_array(global.crew[i]) ){
        continue;
    }
    thisCrew = global.crew[i];
    if(thisCrew[NPC_CREW_INDEX]==crewIndex){
        if(debug_mode) show_debug_message("DEBUG: Adding " + string(amt) + " morale to " + thisCrew[NPC_NAME] + ". Current morale is " + string(thisCrew[NPC_MORALE]) );
        thisCrew[@NPC_MORALE] = clamp(thisCrew[NPC_MORALE]+amt,0,10);
        if(debug_mode) show_debug_message("DEBUG: New morale is " + string(thisCrew[NPC_MORALE]));
        rslt = thisCrew[NPC_MORALE];
        break;
    }
}

return rslt;
