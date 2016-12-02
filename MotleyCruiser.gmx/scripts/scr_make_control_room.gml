/// NOT USED. Saving for reference
// Create ship control room
// A basic room with a ship component in the middle
if(global.room_type=="control"){
    
    
    texture_set_interpolation(false);
    
    // Resize
    room_width = 740;
    room_height = 740;
    
    var wall_bg = bg_walltiles;
    
    // Set the grid width and height
    var width = room_width div CELL_WIDTH;
    var height = room_height div CELL_HEIGHT;
    sizeModifier = .15;//.10 .25 .50, .75, 1, 1.25 ... do not exceed 2. This is for the overall size of the grid. Larger ships.
    
    // Create the DS grid
    grid = ds_grid_create(width, height);
    
    // Create the pathfinding grid
    grid_path = mp_grid_create(0,0,width,height,CELL_WIDTH,CELL_HEIGHT);
    
    // Fill the grid with VOID
    ds_grid_set_region(grid, 0, 0, width, height, VOID);
    
    // Build floor
    ds_grid_set_region(grid, width/4, height/4, width-(width/4), height-(height/4), FLOOR);
    
    // Void in the middle
    var boxX1 = (width/2) - 2;
    var boxX2 = (width/2) + 2;
    ds_grid_set_region(grid, boxX1, boxX1, boxX2, boxX2, WALL);
    
    
    // Place a master panel. Player will need to click this to beat the room.
    core = instance_create(room_width/2,(boxX2 * CELL_HEIGHT) + CELL_HEIGHT,obj_master_panel);
    
    var my_light1 = glr_light_create(spr_glr_light_mask_point, 0, room_width/2, (boxX2 * CELL_HEIGHT) + CELL_HEIGHT, c_white, 0);
    glr_light_set_static(my_light1, true)
    
    // Place a couple of big turrets.
    t1 = instance_create(room_width/2 - (CELL_WIDTH*2),(boxX2 * CELL_HEIGHT) + (CELL_HEIGHT*2),obj_turret);
    t2 = instance_create(room_width/2 + (CELL_WIDTH*2),(boxX2 * CELL_HEIGHT) + (CELL_HEIGHT*2),obj_turret);
    
    t1.depth = -1* t1.y;
    t2.depth = -1* t2.y;
    
        
    //Create the player
    instance_create(room_width/2, room_height/4 + (CELL_HEIGHT*2), obj_player);
    
    //Intantiate crew
    scr_instantiate_all_crew(room_width/2,room_height/4 + (CELL_HEIGHT*2));
    
    //Place a ship part
    instance_create(room_width/2, room_height/2, obj_room_reactor);   
    
    // Add the walls
    for(var yy = 1; yy < height-1; yy++){
        for(var xx=1; xx < width-1; xx++){
            if(grid[# xx,yy] == FLOOR){
                // Check for walls
                if(grid[# xx+1, yy] != FLOOR){
                    grid[# xx+1, yy] = WALL;
                }
                if(grid[# xx-1, yy] != FLOOR){
                    grid[# xx-1, yy] = WALL;
                }
                if(grid[# xx, yy+1] != FLOOR){
                    grid[# xx, yy+1] = WALL;
                }
                if(grid[# xx, yy-1] != FLOOR){
                    grid[# xx, yy-1] = WALL;
                }          
            }    
        }
    }
    
    // Draw the level
    for(var yy = 0; yy < height; yy++){
        for(var xx = 0; xx < width; xx++){
            if(grid[# xx, yy] == FLOOR){
                
                tile_add(bg_floor, 0, 0, CELL_WIDTH, CELL_HEIGHT, xx*CELL_WIDTH, yy*CELL_HEIGHT, 0);
                
                var ex = xx * CELL_WIDTH + CELL_WIDTH/2;
                var ey = yy * CELL_HEIGHT + CELL_HEIGHT/2;
                
                // Maybe put an enemy here
                var odds = 30;
            
                if(point_distance(ex,ey,obj_player.x,obj_player.y) > 80 && irandom(odds) == odds){
                    var newEnemy = instance_create(ex,ey,obj_enemy);
                    var set_mode = "hold";
                    
                    var oddsMode = 3;
                    var modRnm = irandom(oddsMode);
                    if(modRnm==0){
                        set_mode = "hunt";
                    }else if(modRnm==1){
                        set_mode = "defend";                
                    }else{
                        set_mode = "hold";           
                    }
                    newEnemy.mode = set_mode;
                    
                    var race_index = irandom(array_height_2d(global.races)-1);
                    newEnemy.sprite_index = global.races[race_index,RACE_SPR];
    
                }
                
            // Place light
            llods = 10;
            if(irandom(llods)==llods){
                var clr = choose(c_red,c_green,c_blue,c_yellow,c_orange,c_white,c_lime);
                var my_light = glr_light_create(spr_glr_light_mask_point, 0, ex, ey, clr, .05);
                glr_light_set_static(my_light, true);
            }
    
                          
            }else{
                //This is a wall or void. Add a solid cell to the pathfinding grid.
                mp_grid_add_cell(grid_path,xx,yy);
            }
        }
    }
    
    var tw = CELL_WIDTH/2;
    var th = CELL_HEIGHT/2;
    
    // Add the tiles
    for (var yy = 0; yy < height*2; yy++) {
        for (var xx = 0; xx < width*2; xx++) {
            if (grid[# xx div 2, yy div 2] == FLOOR) {
                // Get the tile's x and y
                var tx = xx*tw;
                var ty = yy*th;
                
                var right = grid[# (xx+1) div 2, yy div 2] != FLOOR;
                var left = grid[# (xx-1) div 2, yy div 2] != FLOOR;
                var top = grid[# xx div 2, (yy-1) div 2] != FLOOR;
                var bottom = grid[# xx div 2, (yy+1) div 2] != FLOOR;
                
                var top_right = grid[# (xx+1) div 2, (yy-1) div 2] != FLOOR;
                var top_left = grid[# (xx-1) div 2, (yy-1) div 2] != FLOOR;
                var bottom_right = grid[# (xx+1) div 2, (yy+1) div 2] != FLOOR;
                var bottom_left = grid[# (xx-1) div 2, (yy+1) div 2] != FLOOR;
                
                 // Maybe place some cover
                 var cOdds = 60;
                 if( !top && !bottom && !right && !left && irandom(cOdds) == cOdds){
                    var cover = instance_create(tx,ty,obj_crate);
                    cover.depth = -ty;         
                 }
                
                
                if (right) {
                    if (bottom) {
                        tile_add(wall_bg, tw*0, th*1, tw, th, tx+tw, ty, -ty);
                        if(bottom_right){
                            tile_add(wall_bg, tw*4, th*1, tw, th, tx+tw, ty+th, -ty);
                        }
                        
                    } else if (top) {
                        if (top_right) {
                            tile_add(wall_bg, tw*4, th*0, tw, th, tx+tw, ty-th, -ty);
                        } else {
                            tile_add(wall_bg, tw*3, th*0, tw, th, tx, ty-th, -ty);
                        }
                        tile_add(wall_bg, tw*0, th*1, tw, th, tx+tw, ty, -ty);
                    } else {
                        tile_add(wall_bg, tw*0, th*1, tw, th, tx+tw, ty, -ty);
                    }
                }
                
                if (left) {
                    if (bottom) {
                        tile_add(wall_bg, tw*2, th*1, tw, th, tx-tw, ty, -ty);
                        if(bottom_left){
                            tile_add(wall_bg, tw*3, th*1, tw, th, tx-tw, ty+th, -ty);
                        }
                        
                    } else if (top) {
                        if (top_left) {
                            tile_add(wall_bg, tw*3, th*0, tw, th, tx-tw, ty-th, -ty);
                        } else {
                            tile_add(wall_bg, tw*4, th*0, tw, th, tx, ty-th, -ty);
                        }
                        tile_add(wall_bg, tw*2, th*1, tw, th, tx-tw, ty, -ty);
                    } else {
                        tile_add(wall_bg, tw*2, th*1, tw, th, tx-tw, ty, -ty);
                    }
                }
                
                if (top) {
                    if (!top_right) {
                        tile_add(wall_bg, tw*2, th*2, tw, th, tx, ty-th, -ty);
                    } else if (!top_left) {
                        tile_add(wall_bg, tw*0, th*2, tw, th, tx, ty-th, -ty);
                    } else {
                        tile_add(wall_bg, tw*1, th*2, tw, th, tx, ty-th, -ty);
                    }
                }
                
                if (bottom) {
                
    
                    if (!bottom_right) {
                        tile_add(wall_bg, tw*2, th*0, tw, th, tx, ty+th, -ty-tw*2);
                    } else if (!bottom_left) {
                        tile_add(wall_bg, tw*0, th*0, tw, th, tx, ty+th, -ty-tw*2);
                    } else {
                        tile_add(wall_bg, tw*1, th*0, tw, th, tx, ty+th, -ty-tw);
                    }
                    
    
                }
                
    
    
            }
        }
    }
    
}//End room type check
