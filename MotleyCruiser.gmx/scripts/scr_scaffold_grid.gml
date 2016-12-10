/// Save scaffold offsets in a 2d array
// scr_scaffold_grid(scale, magnitude);
var grid = noone;
var s = argument0;// Scale. This is the size of each cell in pixels.  16, 32, 48, etc.
var mag = argument1;// Magnitude
var center = round( (mag-1)/2 );//center of grid. if mag 5 then 2

for(r=0; r<mag; r++){
    for(c=0; c<mag; c++){
 
        var xd = (c-center) * s; // distance on x plane
        var yd = (r-center) * s; // distance on y plane
        var dis = sqrt(sqr(xd)+sqr(yd)); // Pythagorean
        var ang = point_direction(x,y,x+xd,y+yd); // Angle to point
        var offsets = noone;
        offsets[0]=dis;
        offsets[1]=ang;
        grid[r,c]=offsets;
     
    }
}

return grid;
