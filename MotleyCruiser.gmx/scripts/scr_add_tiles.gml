/// scr_add_tiles(grid x, grid y, tile, W, H, D);
/****
A generic script for adding tiles to a room. 
gx and gy are GRID COORIDINATES, not room coordinates.
Translate them to room coords using CELL_WIDTH and CELL_HEIFGHT
****/

var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var gx = args[0];
var gy = args[1];
var T = args[2];
var W = args[3];
var H = args[4];
var D = args[5];// depth
if(W==noone){
    W=1;
}
if(H==noone){
    H=1;
}
if(D==noone){
    D = (gy * CELL_HEIGHT) * -1;
}

var xx = 0;
var yy = 0;
while(yy<H){
    xx=0;
    while(xx<W){
        tile_add(T, 0, 0, CELL_WIDTH, CELL_HEIGHT, (gx+xx)*CELL_WIDTH, (gy+yy)*CELL_HEIGHT, D);
        xx++;
    }
    yy++;
}







