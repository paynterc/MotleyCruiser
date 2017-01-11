/// Remove an npc from crew and re-index crew
// scr_remove_from_crew(global_index)
var global_index = argument0;
var new_crew = noone;
var crewmate = noone;
for(var i=0;i<array_length_1d(global.crew); i++){
    crewmate = global.crew[i];
    if(crewmate[NPC_GLOBAL_INDEX]!=global_index){
        new_crew = scr_push_array(new_crew,crewmate);
    } 
}

global.crew = new_crew;


