/// Subtract daily expenses from credits
if(global.day<1) return false;
for(var i=0; i<array_length_1d(global.crew);i++){
    var crewmate = global.crew[i];
    global.credits -= crewmate[NPC_HIRE_PRICE];
}
