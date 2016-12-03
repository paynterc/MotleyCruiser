///gridcol_point(x,y)

//Determines if the given coordinates collide with a wall - much easier then the quadrant_rectangle!
var cell = CELL_WIDTH;
var tx = argument0;
var ty = argument1;
var result = global.grid[# tx div cell, ty div cell];
return result != FLOOR;
