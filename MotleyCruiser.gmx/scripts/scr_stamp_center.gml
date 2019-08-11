/// Stamps out a rectangular area on the map. Provide coordinates of the CENTER of the rectangle, and the script will translate upper left and upper right.
// Height and width are in grid units, not pixels
// scr_stamp_center(x_topleft,y_topleft,height,width,optional TILE)

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
var x_topleft = xx - floor(ww/2);
var y_topleft = yy - floor(hh/2);

scr_stamp_rectangle(x_topleft,y_topleft,hh,ww,type);
