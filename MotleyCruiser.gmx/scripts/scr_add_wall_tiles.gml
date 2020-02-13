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
            if(global.grid[# xx+1, yy] != FLOOR && global.grid[# xx+1, yy] != BG_VACUUM && global.grid[# xx,yy+1]!= WALL){
                // WALL ON THE RIGHT
                if(global.grid[# xx+1, yy-1] == FLOOR){
                    // Corner piece
                    tile_add(shadow_tile, CELL_WIDTH, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT+(CELL_HEIGHT/2), -1);
                }else{
                    // Shadow to left of wall
                    tile_add(shadow_tile, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT+(CELL_HEIGHT), -1);
                }
                
            }

            if(global.grid[# xx, yy-1] != FLOOR && global.grid[# xx, yy-1] != BG_VACUUM){
                // WALL ABOVE
                if(global.grid[# xx+1, yy-1] == FLOOR){
                    
                    tile_add(shadow_tile, CELL_WIDTH, CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT+(CELL_HEIGHT/2), -1);
                }else{
                    tile_add(shadow_tile, 0, CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT+(CELL_HEIGHT/2), -1);
                }
                
            }
            
            
            if(
            ( 
            global.grid[# xx+1, yy-1] != FLOOR && global.grid[# xx+1, yy-1] != BG_VACUUM 
            && global.grid[# xx, yy-1] == FLOOR 
            && global.grid[# xx+1, yy] == FLOOR )
            ){
                // TOP RIGHT WALL SHADOW
                tile_add(shadow_tile, 0, 0, CELL_WIDTH, CELL_HEIGHT/2, xx*CELL_WIDTH, yy*CELL_HEIGHT+(CELL_HEIGHT/2), -1);
            }
                      
        }
    }
}

// Add special tiles
for(var yy = 0; yy < height; yy++){
    for(var xx = 0; xx < width; xx++){
        if(global.grid[# xx, yy] == BG_VACUUM){
        
            tile_layer_delete_at(-1, xx*CELL_WIDTH, yy*CELL_HEIGHT);
            tile_layer_delete_at(-1, xx*CELL_WIDTH, (yy+1)*CELL_HEIGHT);
            tile_layer_delete_at(0, xx*CELL_WIDTH, yy*CELL_HEIGHT);
            tile_layer_delete_at(1, xx*CELL_WIDTH, yy*CELL_HEIGHT);
            
        }if(global.grid[# xx, yy] == BG_BARTOP){
            tile_add(bg_bartop, 0, 0, CELL_WIDTH, CELL_HEIGHT*1.5, xx*CELL_WIDTH, yy*CELL_HEIGHT, -yy);
        }
    }
}
