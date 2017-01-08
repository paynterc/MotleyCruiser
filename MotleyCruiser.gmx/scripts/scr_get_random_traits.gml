/// Select three random traits from the library
var traits = noone;
var num_traits = 3;
var row;
var col;
for(var i=0; i<num_traits; i++){
    row = irandom( array_height_2d(global.npc_traits) - 1 );
    col = irandom(1);
    traits[i]=global.npc_traits[row,col];
}

return traits;
