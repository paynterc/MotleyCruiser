/// grid_place_meeting(x,y)

var xx = argument[0];
var yy = argument[1];

// Remember our position
var xp = x;
var yp = y;

// Update the position for the bbox calculation
x = xx;
y = yy;
var x_meeting = false;
var y_meeting = false;
var center_meeting = false;

if(global.room_type=='wall'){
    x_meeting = place_meeting(xx,yy,obj_wall_invis);

}else{
    // Check for x meeting
    x_meeting = (obj_level.grid[# bbox_right div CELL_WIDTH, bbox_top div CELL_HEIGHT] != FLOOR) || 
                (obj_level.grid[# bbox_left div CELL_WIDTH, bbox_bottom div CELL_HEIGHT] != FLOOR);
                
    // Check for y meeting
    y_meeting = (obj_level.grid[# bbox_right div CELL_WIDTH, bbox_bottom div CELL_HEIGHT] != FLOOR) || 
                (obj_level.grid[# bbox_left div CELL_WIDTH, bbox_top div CELL_HEIGHT] != FLOOR);

    // Check for center meeting                
    center_meeting = (obj_level.grid[# xx div CELL_WIDTH, yy div CELL_HEIGHT] != FLOOR);

}

                
// Move back
x = xp;
y = yp;

// Return true or false
return x_meeting || y_meeting || center_meeting;
