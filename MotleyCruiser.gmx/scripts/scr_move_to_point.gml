/// scr_move_to_point(x,y,spd,useMPgrid)
// Assumes object.x, object.y
// Moves to the specified point utilizing grid collisions. Not smart. Will not calcualte a path.
// Good for large sprites you want to contain to an open area.
var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var x2 = args[0];
var y2 = args[1];
var spd = args[2];
var useMPgrid = args[3];
if(useMPgrid==noone){
    useMPgrid=0;
}
var dir =  point_direction(x,y,x2,y2);

var hspd = lengthdir_x( spd, dir );
var vspd = lengthdir_y( spd, dir );

scr_move(hspd,vspd,useMPgrid);
