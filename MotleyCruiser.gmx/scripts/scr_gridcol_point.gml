///scr_gridcol_point(x,y,useMPgrid)
//Determines if the given coordinates collide with a wall
var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}
var tx = args[0];
var ty = args[1]
var useMPgrid = args[2];
if(useMPgrid==noone){
    useMPgrid=1;// Default to mp grid
}
var cell = CELL_WIDTH;

if(useMPgrid==1){
    var result = mp_grid_get_cell(global.grid_path, tx div cell, ty div cell);
    return result == -1;// that's a wall
}else{
    var result = global.grid[# tx div cell, ty div cell];
    return result != FLOOR;// that's a wall
}

