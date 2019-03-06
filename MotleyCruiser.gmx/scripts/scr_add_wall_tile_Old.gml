/// Add wall tiles to grid-based room
// scr_add_wall_tiles(roomheight,roomwidth);
var height = argument0;
var width = argument1;


/*****
for(var yy = 1; yy < height-1; yy++){
    for(var xx=1; xx < width-1; xx++){
        if(global.grid[# xx,yy] == FLOOR){
            // Check for walls
            if(global.grid[# xx+1, yy] != FLOOR){
                global.grid[# xx+1, yy] = WALL;
            }
            if(global.grid[# xx-1, yy] != FLOOR){
                global.grid[# xx-1, yy] = WALL;
            }
            if(global.grid[# xx, yy+1] != FLOOR){
                global.grid[# xx, yy+1] = WALL;
            }
            if(global.grid[# xx, yy-1] != FLOOR){
                global.grid[# xx, yy-1] = WALL;
            }          
        }    
    }
}
*****/

// Add tiles and path map

for(var yy = 0; yy < height; yy++){
    for(var xx = 0; xx < width; xx++){
        if(global.grid[# xx, yy] == FLOOR){
            
            tile_add(bg_floor, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT, 0);
            
            //var ex = xx * CELL_WIDTH + CELL_WIDTH/2;
            //var ey = yy * CELL_HEIGHT + CELL_HEIGHT/2;

                      
        }else{
            //This is a wall or void. Add a solid cell to the pathfinding global.grid.
            mp_grid_add_cell(global.grid_path,xx,yy);
        }
    }
}




var tw = CELL_WIDTH/2;
var th = CELL_HEIGHT/2;
for (var yy = 0; yy < height*2; yy++) {
    for (var xx = 0; xx < width*2; xx++) {
        if (global.grid[# xx div 2, yy div 2] == FLOOR) {
            // Get the tile's x and y
            var tx = xx*tw;
            var ty = yy*th;
            
            var right = global.grid[# (xx+1) div 2, yy div 2] != FLOOR;
            var left = global.grid[# (xx-1) div 2, yy div 2]  != FLOOR;
            var top = global.grid[# xx div 2, (yy-1) div 2]  != FLOOR;
            var bottom = global.grid[# xx div 2, (yy+1) div 2]  != FLOOR;
            
            var top_right = global.grid[# (xx+1) div 2, (yy-1) div 2] != FLOOR;
            var top_left = global.grid[# (xx-1) div 2, (yy-1) div 2]  != FLOOR;
            var bottom_right = global.grid[# (xx+1) div 2, (yy+1) div 2]  != FLOOR;
            var bottom_left = global.grid[# (xx-1) div 2, (yy+1) div 2]  != FLOOR;
                     
            if (right) {
                if (bottom) {
                    tile_add(bg_walltiles, tw*0, th*1, tw, th, tx+tw, ty, -ty);
                    if(bottom_right){
                        tile_add(bg_walltiles, tw*4, th*1, tw, th, tx+tw, ty+th, -ty);
                    }
                    
                } else if (top) {
                    if (top_right) {
                        tile_add(bg_walltiles, tw*4, th*0, tw, th, tx+tw, ty-th, -ty);
                    } else {
                        tile_add(bg_walltiles, tw*3, th*0, tw, th, tx, ty-th, -ty);
                    }
                    tile_add(bg_walltiles, tw*0, th*1, tw, th, tx+tw, ty, -ty);
                } else {
                    tile_add(bg_walltiles, tw*0, th*1, tw, th, tx+tw, ty, -ty);
                }
            }
            
            if (left) {
                if (bottom) {
                    tile_add(bg_walltiles, tw*2, th*1, tw, th, tx-tw, ty, -ty);
                    if(bottom_left){
                        tile_add(bg_walltiles, tw*3, th*1, tw, th, tx-tw, ty+th, -ty);
                    }
                    
                } else if (top) {
                    if (top_left) {
                        tile_add(bg_walltiles, tw*3, th*0, tw, th, tx-tw, ty-th, -ty);
                    } else {
                        tile_add(bg_walltiles, tw*4, th*0, tw, th, tx, ty-th, -ty);
                    }
                    tile_add(bg_walltiles, tw*2, th*1, tw, th, tx-tw, ty, -ty);
                } else {
                    tile_add(bg_walltiles, tw*2, th*1, tw, th, tx-tw, ty, -ty);
                }
            }
            
            if (top) {
                if (!top_right) {
                    tile_add(bg_walltiles, tw*2, th*2, tw, th, tx, ty-th, -ty);
                } else if (!top_left) {
                    tile_add(bg_walltiles, tw*0, th*2, tw, th, tx, ty-th, -ty);
                } else {
                    tile_add(bg_walltiles, tw*1, th*2, tw, th, tx, ty-th, -ty);
                }
            }
            
            if (bottom) {
            

                if (!bottom_right) {
                    tile_add(bg_walltiles, tw*2, th*0, tw, th, tx, ty+th, -ty-tw*2);
                } else if (!bottom_left) {
                    tile_add(bg_walltiles, tw*0, th*0, tw, th, tx, ty+th, -ty-tw*2);
                } else {
                    tile_add(bg_walltiles, tw*1, th*0, tw, th, tx, ty+th, -ty-tw);
                }
                

            }
            


        }
    }
}

// Add special tiles
for(var yy = 0; yy < height; yy++){
    for(var xx = 0; xx < width; xx++){
        if(global.grid[# xx, yy] == BARBACK){           
            tile_add(bg_barshelf, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT, -10000);                                 
        }else if(global.grid[# xx, yy] == BG_BARTOP){
            tile_add(bg_bartop, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT, -yy*CELL_HEIGHT);
        }
    }
}
