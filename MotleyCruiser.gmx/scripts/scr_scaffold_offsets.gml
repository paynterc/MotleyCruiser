/// Calculate offset for drawing image on a grid. Used for modular ships.
// scr_scaffold_offsets(scale, magnitude, row, column, modifier);
var offsets = noone;

var s = argument0; // Scale of grid (16px cells)
var mag = argument1; // Magnitude of grid (5 rows)
var r = argument2; // Row
var c = argument3; // Cell
var x_modifier = argument4 //for gun offsets

var center = round( (mag-1)/2 );//center of grid. if mag 5 then 2

var xd = ((c-center) * s) + x_modifier; // distance on x plane
var yd = (r-center) * s; // distance on y plane
var dis = sqrt(sqr(xd)+sqr(yd)); // Pythagorean
var ang = point_direction(x,y,x+xd,y+yd); // Angle to point

offsets[0]=dis;
offsets[1]=ang;

return offsets;
