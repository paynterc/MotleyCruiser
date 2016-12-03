/// Create custom level
// Draw the room using obj_floor objects. Be sure to add an obj_player object somewhere.

texture_set_interpolation(false);

// Resize
room_width = 740;
room_height = 740;

var wall_bg = bg_walltiles;

// Set the global.grid width and height
var width = room_width div CELL_WIDTH;
var height = room_height div CELL_HEIGHT;

// Create the DS global.grid
global.grid = ds_grid_create(width, height);

// Create the pathfinding global.grid
global.grid_path = mp_grid_create(0,0,width,height,CELL_WIDTH,CELL_HEIGHT);

// Fill the global.grid with VOID
ds_grid_set_region(global.grid, 0, 0, width, height, VOID);


// Find floor objects that were placed and update the global.grid with their location.
for(var i = 0; i < instance_number(obj_floor); i++) {
    var wall = instance_find(obj_floor,i);
    wx = wall.x / CELL_WIDTH;
    wy = wall.y / CELL_HEIGHT;
    global.grid[# wx, wy] = FLOOR;
}


if(instance_exists(obj_player)){
    //Intantiate crew
    scr_instantiate_all_crew(obj_player.x,obj_player.y);
}




// Draw the level
scr_add_wall_tiles(height,width);

