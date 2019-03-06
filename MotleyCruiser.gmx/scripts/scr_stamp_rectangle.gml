/// Stamps out a rectangular area of floor on the map.
// Height and width are in grid units, not pixels
// scr_stamp_rectangle(x_topleft,y_topleft,height,width,optional TILE)

var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var xx = args[0];
var yy = args[1];
var hh=args[2];
var ww=args[3];
var type = args[4];
if(type==noone){
    type = FLOOR;
}
var thing = 1;
for(var yc=yy; yc < yy+hh; yc++){
    for(var xc=xx; xc<xx+ww; xc++){
        global.grid[# xc,yc]=type;
    }
}
