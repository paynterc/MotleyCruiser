/// Calculate offset for drawing image on a grid. Used for modular ships.
// scr_scaffold_offsets( magnitude, row, column, scale);
var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var mag = args[0]; // Magnitude of grid (5 rows)
var r = args[1]; // Row
var c = args[2]; // Cell
var scale = args[3];// Scale of grid (16px cells)
if(scale==noone){
    scale=1;
}
var s = 16 * scale;
var offsets = noone;
var center = round( (mag-1)/2 );//center of grid. if mag 5 then 2 (0,1,*2*,3,4)
var xd = (c-center) * s; // distance on x plane
var yd = (r-center) * s; // distance on y plane
var dis = sqrt(sqr(xd)+sqr(yd)); // Pythagorean
var ang = point_direction(x,y,x+xd,y+yd); // Angle to point

offsets[0]=dis;
offsets[1]=ang;

return offsets;
