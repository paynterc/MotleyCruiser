/// See if an npc is already in your crew. Used when populating cantinas, etc.
// scr_npc_in_crew(global_index)
var global_index = argument0;
for(var i=0;i<array_length_1d(global.crew);i++){
    var crewMem = global.crew[i];
    if(crewMem[NPC_GLOBAL_INDEX]==global_index){
        return true;
    }
}

return false;
