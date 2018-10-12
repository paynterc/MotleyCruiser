/// Create scaffold grids
//grid_xstart = view_xview[0] + (view_wview[0]/16);

// room_width - ((cell size * max scaffold size +1) * 3 grids)
var grid_xstart = room_width - ((SCAFF_CELL_SIZE * 16) * 3);
var grid_x = grid_xstart;
//grid_y= view_yview[0] + ((view_hview[0]/6));
var grid_ystart = 64;
var grid_y = grid_ystart;

for(var r=0;r<scaffold_size;r++){
    for(var c=0;c<scaffold_size;c++){
        var coords=noone;
        coords[0] = grid_x;
        coords[1] = grid_y;
        grid_centers2[r,c]=coords;
        grid_x += SCAFF_CELL_SIZE;
    }
    grid_y += SCAFF_CELL_SIZE;
    grid_x = grid_xstart;
}

//grid_x = grid_xstart;
//grid_y += SCAFF_CELL_SIZE;

grid_xstart = grid_x + (SCAFF_CELL_SIZE * (scaffold_size + 1) );
grid_x = grid_xstart;
grid_y = grid_ystart;

for(var r=0;r<scaffold_size;r++){
    for(var c=0;c<scaffold_size;c++){
        var coords=noone;
        coords[0] = grid_x;
        coords[1] = grid_y;
        grid_centers1[r,c]=coords;
        grid_x += SCAFF_CELL_SIZE;
    }
    grid_y += SCAFF_CELL_SIZE;
    grid_x = grid_xstart;
}

grid_xstart = grid_x + (SCAFF_CELL_SIZE * (scaffold_size + 1) );
grid_x = grid_xstart;
grid_y = grid_ystart;

for(var r=0;r<scaffold_size;r++){
    for(var c=0;c<scaffold_size;c++){
        var coords=noone;
        coords[0] = grid_x;
        coords[1] = grid_y;
        grid_centers0[r,c]=coords;
        grid_x += SCAFF_CELL_SIZE;
    }
    grid_y += SCAFF_CELL_SIZE;
    grid_x = grid_xstart;
}

grid_centers[0]=grid_centers0;
grid_centers[1]=grid_centers1;
grid_centers[2]=grid_centers2;
