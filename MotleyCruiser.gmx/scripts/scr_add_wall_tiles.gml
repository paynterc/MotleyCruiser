/// Add wall tiles to grid-based room
// scr_add_wall_tiles(roomheight,roomwidth);
var height = argument0;
var width = argument1;
var wall_tile = bg_wall_simple;
var wall_tile2 = bg_wall_simple2;
var floor_tile = bg_floor;
var shadow_tile = bg_wall_shadow2;

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
            
            var bottom = global.grid[# xx, yy+1] == FLOOR || global.grid[# xx, yy+1] == VOID;
            
            if(bottom){
                tile_add(wall_tile, 0, CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT, -1);
            }else{
                tile_add(wall_tile, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT, -1);
            }
            
            // Room bg. A separate tile layer bellow the wall tile that provides a border around the entire room
            var bgOffset=3;
            if(global.grid[# xx, yy+1] == VOID){
                tile_add(wall_tile2, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, bgOffset+yy*CELL_HEIGHT, 1);
            }
            if(global.grid[# xx, yy-1] == VOID){
                tile_add(wall_tile2, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, (yy*CELL_HEIGHT)-bgOffset, 1);
            }
            if(global.grid[# xx+1, yy] == VOID){
                tile_add(wall_tile2, 0, 0, CELL_WIDTH, CELL_HEIGHT, (xx*CELL_WIDTH)+bgOffset, yy*CELL_HEIGHT, 1);
            }
            if(global.grid[# xx-1, yy] == VOID){
                tile_add(wall_tile2, 0, 0, CELL_WIDTH, CELL_HEIGHT, (xx*CELL_WIDTH)-bgOffset, yy*CELL_HEIGHT, 1);
            }
            if(global.grid[# xx+1, yy-1] == VOID){
                // TOP RIGHT
                tile_add(wall_tile2, 0, 0, CELL_WIDTH, CELL_HEIGHT, (xx*CELL_WIDTH)+bgOffset, (yy*CELL_HEIGHT)-bgOffset, 1);
            }
            if(global.grid[# xx-1, yy-1] == VOID){
                // TOP LEFT
                tile_add(wall_tile2, 0, 0, CELL_WIDTH, CELL_HEIGHT, (xx*CELL_WIDTH)-bgOffset, (yy*CELL_HEIGHT)-bgOffset, 1);
            }
            if(global.grid[# xx+1, yy+1] == VOID){
                // BOTTOM RIGHT
                tile_add(wall_tile2, 0, 0, CELL_WIDTH, CELL_HEIGHT, (xx*CELL_WIDTH)+bgOffset, (yy*CELL_HEIGHT)+bgOffset, 1);
            }
            if(global.grid[# xx-1, yy+1] == VOID){
                // BOTTOM LEFT
                tile_add(wall_tile2, 0, 0, CELL_WIDTH, CELL_HEIGHT, (xx*CELL_WIDTH)-bgOffset, (yy*CELL_HEIGHT)+bgOffset, 1);
            }
                                            
        }
    }
}

// SHADOWS
for(var yy = 0; yy < height; yy++){
    for(var xx = 0; xx < width; xx++){
        if(global.grid[# xx, yy] == FLOOR){
                      
            // Check for walls
            if(global.grid[# xx+1, yy] != FLOOR){
                // RIGHT

                if(global.grid[# xx+1, yy-1] == FLOOR){
                    tile_add(shadow_tile, CELL_WIDTH, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT, -1);
                }else{
                    tile_add(shadow_tile, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT, -1);
                }
                
            }

            if(global.grid[# xx, yy-1] != FLOOR){
                // TOP

                if(global.grid[# xx+1, yy-1] == FLOOR){
                    tile_add(shadow_tile, CELL_WIDTH, CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT, -1);
                }else{
                    tile_add(shadow_tile, 0, CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT, -1);
                }
                
            }
            
            
            if(global.grid[# xx+1, yy-1] != FLOOR && global.grid[# xx, yy-1] == FLOOR && global.grid[# xx+1, yy] == FLOOR){
                // TOP RIGHT WALL SHADOW
                tile_add(shadow_tile, 0, 0, CELL_WIDTH, CELL_HEIGHT/2, xx*CELL_WIDTH, yy*CELL_HEIGHT, -1);
            }
                      
        }
    }
}

// Add special tiles
for(var yy = 0; yy < height; yy++){
    for(var xx = 0; xx < width; xx++){
        if(global.grid[# xx, yy] == BARBACK){           
            tile_add(bg_barshelf, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT, -2);                                 
        }else if(global.grid[# xx, yy] == BG_BARTOP){
            tile_add(bg_bartop, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT, -yy*CELL_HEIGHT);
        }
    }
}
