///scr_grievance_test(grievanceId)
// Add a grievance to the first crewmember
//var newGrv = argument0;
var newGrv = grievances.exhaustion;
var cIndex;
for(var i=0;i<array_length_1d(global.crew);i++){
        if( !is_array(global.crew[i]) ){
            continue;
        }
        thisCrew = global.crew[i];
        if( !thisCrew[NPC_ACTIVE] ){
            continue;
        }
        cIndex = thisCrew[NPC_CREW_INDEX];
        break;
}

M=thisCrew[NPC_MORALE];
show_debug_message("Morale for crewmember "+ string(cIndex) + " ("+thisCrew[NPC_NAME_FIRST]+")" + " is : " + string(M));
var G=ds_map_find_value(global.grievance_map,cIndex);// Find greivances by crew index value
if(!is_undefined(G)){
    Gc = ds_list_size(G);
}else{
    Gc = 0;
}
show_debug_message("Morale grievance count for crewmember "+ string(cIndex) +" ("+thisCrew[NPC_NAME_FIRST]+")" + " = " + string(Gc));
thisCrew[NPC_MORALE]= max(0,M-Gc);// REDUCE MORALE BY COUNT OF GRIEVANCES
show_debug_message("Morale for crewmember "+ string(cIndex) + " is now : " + string(thisCrew[NPC_MORALE]));

show_debug_message("Morale will create a new grievance for crewmember "+ string(cIndex) + " ("+thisCrew[NPC_NAME_FIRST]+")");     
var rslt = scr_grievance_add(cIndex,newGrv);               
if(rslt){
    show_debug_message("Morale crewmember "+ string(cIndex) + " ("+thisCrew[NPC_NAME_FIRST]+")" + " has a new grievance.");
    var barkTxt = thisCrew[NPC_NAME_FIRST] + " has aquired a new grievance: " + scr_grievance_to_text(newGrv);
    scr_crew_bark(barkTxt,cIndex);
}else{
    scr_crew_bark("AN ERROR OCCURRED. NO GRIEVANCE WAS ADDED.");
}
