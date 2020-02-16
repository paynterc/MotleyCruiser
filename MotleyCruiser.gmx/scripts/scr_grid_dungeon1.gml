/// scr_grid_dungeon1(w,h)
show_debug_message("Start scr_grid_dungeon1");
var width = argument0;
var height = argument1;


// Fill the global.grid with voids
ds_grid_set_region(global.grid, 0, 0, width-1, height-1, VOID);
show_debug_message("VOIDS SET");


randomize();
// Create the controller in the center of the global.grid
var cx = width div 2;
var cy = height div 2;
var x1,y1,x2,y2;
var x1r, y1r, x2r, y2r;

var V=true;
// Repeat this 5 times

// Make a vertical line of random length


x1 = cx;
y1 = max(2,irandom_range(2,cy-1)) * V;
x2 = cx;
y2 = min(height-2,irandom_range(cy+1,height-2));

show_debug_message("x1 set to" + string(x1));
show_debug_message("y1 set to" + string(y1));
show_debug_message("x2 set to" + string(x2));
show_debug_message("y2 set to" + string(y2));

for(var i=0; i<5; i++){

    ds_grid_set_region(global.grid, x1, y1, x2, y2, FLOOR);
    show_debug_message("HALL CREATED");
    
    
    // Draw rooms at either end.
    var rmSize = 5;
    x1r = max(2,x1-irandom(rmSize));
    y1r = max(2,y1-irandom(rmSize));
    x2r = min(width-2,x1+irandom(rmSize));
    y2r = min(height-2,y1+irandom(rmSize));
    ds_grid_set_region(global.grid, x1r, y1r, x2r, y2r, FLOOR);
    
    x1r = max(1,x1-irandom(rmSize));
    y1r = max(1,y2-irandom(rmSize));
    x2r = min(width-1,x1+irandom(rmSize));
    y2r = min(height-1,y2+irandom(rmSize));
    ds_grid_set_region(global.grid, x1r, y1r, x2r, y2r, FLOOR);
    
    V=!V;
    
    if(V){
        cx = irandom_range(x1,x2);
        x1 = cx;
        y1 = max(2,irandom_range(2,cy-1));
        x2 = cx;
        y2 = min(height-2,irandom_range(cy+1,height-2));
        
    }else{
        cy = irandom_range(y1,y2);
        x1 = max(2,irandom_range(2,cx-1));
        y1 = cy;
        x2 = min(width-2,irandom_range(cx+1,width-2));
        y2 = cy;
        
    }

}







show_debug_message("ROOM CREATED");
// Toggle horizontal and repeat



//scr_add_wall_tiles(width,height);
for(var yy = 1; yy < height-1; yy++){
    for(var xx=1; xx < width-1; xx++){
        if(global.grid[# xx, yy] == FLOOR){
        
            if(global.grid[# xx+1, yy] == VOID){
                global.grid[# xx+1, yy] = WALL;
            }
            if(global.grid[# xx-1, yy] == VOID){
                global.grid[# xx-1, yy] = WALL;
            }
            if(global.grid[# xx, yy+1] == VOID){
                global.grid[# xx, yy+1] = WALL;
            }
            if(global.grid[# xx, yy-1] == VOID){
                global.grid[# xx, yy-1] = WALL;
            }
            
            if(global.grid[# xx+1, yy-1] == VOID){
                // TOP RIGHT
                global.grid[# xx+1, yy-1] = WALL;
            }
            if(global.grid[# xx-1, yy-1] == VOID){
                // TOP LEFT
                global.grid[# xx-1, yy-1] = WALL;
            }
            if(global.grid[# xx+1, yy+1] == VOID){
                // BOTTOM RIGHT
                global.grid[# xx+1, yy+1] = WALL;
            }
            if(global.grid[# xx-1, yy+1] == VOID){
                // BOTTOM LEFT
                global.grid[# xx-1, yy+1] = WALL;
            }
                       
        }  
    }
}

var wall_tile = bg_wall_simple;
var wall_tile2 = bg_wall_simple2;
var floor_tile = bg_floor2;
var shadow_tile = bg_wall_shadow2;

// Add tiles and path map

for(var yy = 0; yy < height; yy++){
    for(var xx = 0; xx < width; xx++){
        if(global.grid[# xx, yy] == FLOOR){
            
            tile_add(floor_tile, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT, 0);          
          
        }else{
            //This is a wall or void. Add a solid cell to the pathfinding global.grid.
            mp_grid_add_cell(global.grid_path,xx,yy);
            
        }
    }
}

// WALLS
for(var yy = 0; yy < height; yy++){
    for(var xx = 0; xx < width; xx++){
        if(global.grid[# xx, yy] == WALL){
            
            
            var voidAbove = global.grid[# xx, yy-1] == VOID;
            var voidBelow = global.grid[# xx, yy+1] == VOID;
            var floorAbove = global.grid[# xx, yy-1] == FLOOR;
            var floorBelow = global.grid[# xx, yy+1] == FLOOR;
            
            if(voidBelow){
                tile_add(wall_tile, CELL_WIDTH,0, CELL_WIDTH, CELL_HEIGHT*2, xx*CELL_WIDTH, yy*CELL_HEIGHT - (CELL_HEIGHT/2), -1);
            
            }else if(floorBelow){
                // Draw a room wall tile
                tile_add(wall_tile, 0,0, CELL_WIDTH, CELL_HEIGHT*2, xx*CELL_WIDTH, yy*CELL_HEIGHT - (CELL_HEIGHT/2), -1);
                
            }else{
                // draw a ceiling tile
                tile_add(wall_tile, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT, -1);
            }
            
            
            if(floorAbove){
                //If floor above, make sure the ceiling is high enough depth to hide the player and shadow partially as it walks by
                tile_add(wall_tile, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT - (CELL_HEIGHT/2), depths.ceilingBottom);
            }

            if(voidAbove){

                tile_add(wall_tile, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT - (CELL_HEIGHT/2), -1);
            }
                                            
        }
    }
}


