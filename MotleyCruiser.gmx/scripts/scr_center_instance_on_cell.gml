/// scr_center_obj_on_cell(gx,gy,object)
// Center an object on a grid cell
var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}
var gx = args[0];
var gy = args[1];
var inst = args[2];

inst.x = (gx * CELL_WIDTH) + (CELL_WIDTH/2);
inst.y = (gy * CELL_HEIGHT) +  (CELL_HEIGHT/2);

