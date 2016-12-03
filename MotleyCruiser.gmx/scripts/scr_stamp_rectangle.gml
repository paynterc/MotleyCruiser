/// Stamps out a rectangular area of floor on the map.
// Height and width are in grid units, not pixels
// scr_stamp_rectangle(x_topleft,y_topleft,height,width)
var xx = argument0;
var yy = argument1;
var hh=argument2;
var ww=argument3;
var thing = 1;
for(var yc=yy; yc < yy+hh; yc++){
    for(var xc=xx; xc<xx+ww; xc++){
        global.grid[# xc,yc]=FLOOR;
    }
}
