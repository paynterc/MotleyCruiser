/// scr_loc_make_starport()
/*****
Create a random, modular starport. This script sets up the grid and then adds modules

Run this in the create step of a child of obj_room. That way the grids should be automatically cleaned up at room end.
*****/
view_visible[0] = true;
view_enabled = true;
view_wview[0]=640;
view_hview[0]=360;
view_hborder[0]=160;
view_vborder[0]=90;
view_hspeed[0]=-1;
view_vspeed[0]=-1;


// Resize
room_width=(CELL_WIDTH/16)*720;
room_height = (CELL_HEIGHT/16)*720;
var width = room_width div CELL_WIDTH;
var height = room_height div CELL_HEIGHT;
var cx = width div 2;
var cy = height div 2;

// Create the DS global.grid
global.grid = ds_grid_create(width, height);

// Create the pathfinding global.grid
global.grid_path = mp_grid_create(0,0,width,height,CELL_WIDTH,CELL_HEIGHT);

// Fill the global.grid with voids
ds_grid_set_region(global.grid, 0, 0, width-1, height-1, VOID);

// Make the cantina in the center
//scr_loc_cantina(cx,cy);
scr_loc_dock(cx,cy);

scr_add_wall_tiles(height,width);



