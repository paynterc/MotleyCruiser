/// Daily morale update
show_debug_message("M daily morale update");

// get all crew members
if !is_array(global.crew) exit;
    show_debug_message("M has crew");
// for each crew, decrement morale by 1 for each unresolved grievance
var thisCrew;
var cIndex = noone;

var Gc=0;// grievance count
var M; // morale
for(var i=0;i<array_length_1d(global.crew);i++){

        if( !is_array(global.crew[i]) ){
            continue;
        }
        thisCrew = global.crew[i];
        if( !thisCrew[NPC_ACTIVE] ){
            continue;
        }

        cIndex = thisCrew[NPC_CREW_INDEX];
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
        
        // increase morale for each perk (coffee maker, game console, pay bonus, etc)

        // roll for consequences (leave crew, steal money, attack crewmate, mutiny)
        
        // roll for new grievances on remaining crew. Modify with any outstanding resentments and applicable character traits.
        var baseChanceG = 10;
        if(baseChanceG == irandom(baseChanceG)){
            show_debug_message("Morale will create a new grievance for crewmember "+ string(cIndex) + " ("+thisCrew[NPC_NAME_FIRST]+")");
            var newGrv = irandom(grievances.LENGTH -1);         
            var rslt = scr_grievance_add(cIndex,newGrv);               
            if(rslt){
                show_debug_message("Morale crewmember "+ string(cIndex) + " ("+thisCrew[NPC_NAME_FIRST]+")" + " has a new grievance.");
                var barkTxt = thisCrew[NPC_NAME_FIRST] + " has aquired a new grievance: " + scr_grievance_to_text(newGrv);
                scr_crew_bark(barkTxt,cIndex);
            }  
        }

        global.crew[i]=thisCrew;
                 
}
    

