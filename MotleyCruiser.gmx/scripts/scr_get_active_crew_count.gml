/// Return count of active crew
var c = 0;
for(var i=0; i<array_length_1d(global.crew); i++){
    var cmate=global.crew[i];
    if(cmate[NPC_ACTIVE]){
        c++;
    }
}
return c;
