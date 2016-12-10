/// Coords need to be rotated 90 degrees when instantiated in game
// Assumes a square grid of 3x3, 5x5, 7x7
//scr_rotate_coords(coords,magnitude)

var editor_coords = argument0;
var mag = argument1;
var new_coords = noone;
var r1 = editor_coords[0];
var c1 = editor_coords[1];

var r2 = c1; // New row is always equal to old column
var c2 = (mag-1)-r1;// Size of array minus 1 minus orignal row

new_coords[0]=r2;
new_coords[1]=c2;

return new_coords;

