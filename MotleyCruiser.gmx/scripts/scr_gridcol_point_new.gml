///gridcol_point(x,y)

//Determines if the given coordinates collide with a wall - much easier then the quadrant_rectangle!
var cell = CELL_WIDTH;
var tx = argument0;
var ty = argument1;
var result = obj_level.grid[# tx div cell, ty div cell];
var thing = 1; 
return result != FLOOR;
