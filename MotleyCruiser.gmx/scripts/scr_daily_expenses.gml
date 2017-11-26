/// Subtract daily expenses from credits
if(global.day<1) return false;
for(var i=0; i<array_length_1d(global.crew);i++){
    var test=1;
    var crewmate = global.crew[i];
    if(is_array(crewmate)){
        global.credits -= crewmate[NPC_HIRE_PRICE];
    }
}
