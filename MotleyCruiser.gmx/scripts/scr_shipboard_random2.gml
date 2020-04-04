/// Create the random level
texture_set_interpolation(false);


// Resize
room_width=(CELL_WIDTH/16)*720;
room_height = (CELL_HEIGHT/16)*720;

view_xview[0]= (room_width/2) - (view_wview[0]/2);
view_yview[0]= (room_height/2) - (view_hview[0]/2);

// Set the global.grid width and height
var width = room_width div CELL_WIDTH;
var height = room_height div CELL_HEIGHT;

// Create the DS global.grid
global.grid = ds_grid_create(width, height);

// Create the pathfinding global.grid
global.grid_path = mp_grid_create(0,0,width,height,CELL_WIDTH,CELL_HEIGHT);

// Fill the global.grid with voids
ds_grid_set_region(global.grid, 0, 0, width-1, height-1, VOID);


if(global.room_seed!=noone){
    random_set_seed(global.room_seed);
}else{
    randomize();
}

var roomCenters = noone;// An array of room center cooridinates

var moduleData = scr_get_array_1d(global.ship_boarded,SHIP_MODULES);
var scaffoldSize = scr_get_array_1d(global.ship_boarded,SHIP_SCAFFOLD_SIZE);
var startCell = scr_shipboard_find_startcell(global.ship_boarded);
var allCells = scr_shipboard_find_allcells(global.ship_boarded);// returns a ds_grid. destroy it!

// Create the controller in the center of the global.grid
var cx = width div 2;
var cy = height div 2;
var cx2 = cx;
var cy2 = cy;


var stepSz = 16*shipScale;// Distance between center of each module in pixels
var moduleSize = 9;// Distance between center of each module in grid units
var roomSize = 5;// room size in grid units
var hallSize = 3;// grid units
var numStamps = 2;
if(global.ship_boarded != noone){
    if(global.ship_boarded[SHIP_SCAFFOLD_SIZE]>5){   
        numStamps = 3;
    }
}
var centerCell = floor(scaffoldSize/2);
var curCellX1=startCell[0];
var curCellY1=startCell[1];
var curCellX2=startCell[0];
var curCellY2=startCell[1];
var xdirR,xdirL,ydirR,ydirL;

// Adjust controller location to the first available module

cx = cx + (moduleSize * (curCellX1 - centerCell) );
cy = cy + (moduleSize * (curCellY1 - centerCell) );
cx2 = cx;
cy2 = cy;
var px1 = cx;// Player start
var py1 = cy;
scr_stamp_center(cx ,cy, roomSize, roomSize);
roomCenters = scr_push_array( roomCenters, scr_array(scr_grid_to_point(cx),scr_grid_to_point(cy) ) );
var makeStamp;
repeat ( numStamps ){
    makeStamp = false;
    // Randomize the direction of the controller
    var cdir = irandom(1);
    
    xdirR=0;
    xdirL=0;
    ydirR=0;
    ydirL=0;
    // Move the controller
    if(cdir==0){
        // xmove
        if(ds_grid_get(allCells,curCellX1+1,curCellY1)==true){
            xdirR=1;
            curCellX1 = curCellX1+1;
            scr_stamp_center(cx + floor(moduleSize/2),cy,hallSize,roomSize);
            makeStamp = true;
        }
        if(ds_grid_get(allCells,curCellX2-1,curCellY2)==true){
            xdirL=1;
            curCellX2 = curCellX2-1;
            scr_stamp_center(cx2 - floor(moduleSize/2),cy2,hallSize,roomSize);
            makeStamp = true;
        }
        
    }else{
        // ymove
        var upDn = choose(1,-1);
        if(ds_grid_get(allCells,curCellX1,curCellY1 + upDn)==true){
            ydirR = upDn;
            curCellY1 = curCellY1 + upDn;
            scr_stamp_center(cx,cy + floor(moduleSize/2) * upDn,roomSize,hallSize);
            makeStamp = true;
        }
        if(ds_grid_get(allCells,curCellX2,curCellY2 + upDn)==true){
            ydirL = upDn;
            curCellY2 = curCellY2 + upDn;
            scr_stamp_center(cx2,cy2 + floor(moduleSize/2) * upDn,roomSize,hallSize);
            makeStamp = true;
        }
        
    }

    cx += xdirR * moduleSize;
    cx2 -= xdirL * moduleSize;
    cy += ydirR * moduleSize;
    cy2 += ydirL * moduleSize;
    
    scr_stamp_center(cx,cy,roomSize,roomSize);
    scr_stamp_center(cx2,cy2,roomSize,roomSize);
    if(makeStamp){
        roomCenters = scr_push_array( roomCenters, scr_array(scr_grid_to_point(cx),scr_grid_to_point(cy) ) );
    }

    
}

ds_grid_destroy(allCells);

// Draw the level
scr_add_wall_tiles(height,width);


// Player start coordinates
px_start = px1 * CELL_WIDTH + (CELL_WIDTH/2);
py_start = py1 * CELL_HEIGHT + (CELL_HEIGHT/2);

//Make an interactable to take the player to the next level
door = instance_create(px_start, (py1 * CELL_HEIGHT) + CELL_HEIGHT,obj_ladder);

// This part will depend on the number of decks.
// Sequence will be: deck, deck, deck, control
// See the Alarm 0 event in this object and the obj_door object for more detail on level progression.
door.room_to = room_get_name(room);
door.interact_active = false;
door.image_speed = 0;
door.image_alpha = 0;


// Light
glr_set_ambient_color(c_blue);

//Make lights over each module
/***
var lspace = 3;
for(var lx = lspace; lx < roomSize; lx += lspace){
    for(ly = lspace; ly < roomSize; ly += lspace){
        var lxT = (cx - floor(roomSize/2)) + lx; // Translate lx to a room coordinate
        var lyT = (cy - floor(roomSize/2)) + ly;
        var my_light1 = glr_lightsimple_create(spr_glr_light_mask_point, 0, (lxT * CELL_WIDTH) - (CELL_WIDTH/2), (lyT * CELL_HEIGHT) - (CELL_HEIGHT/2), choose(c_white,c_green), 1, 1);
        //glr_lightsimple_set_scaling(my_light1,.35,.35);
    }
}
***/
for(var i=0; i<array_length_1d(roomCenters); i++){
    var rPnt = roomCenters[i];
    if(is_array(rPnt)){
        var my_light1 = glr_lightsimple_create(spr_glr_light_mask_point, 0, rPnt[0], rPnt[1], choose(c_white,c_green), 1, 1);
    }
    
}


//Create the player
instance_create(px_start, py_start, obj_player);
with(obj_player){
    //event_user(0);// Weapon out;
    _state=0;
}


//Create crew
scr_instantiate_team(px_start,py_start);
for(var i = 0; i < instance_number(obj_npc); i++) {
    this_obj = instance_find(obj_npc,i);
    if(this_obj.crew_index != noone){
        with(this_obj){
            //event_user(0);// draw weapon
            mode="defend";
            targetMtype = obj_player;// move to this object
            _state=0;
        }
    }
}

// Place a core
instance_create(px_start,py_start,obj_core);

floors = noone; // An array to keep track of floor locations. IMPORTANT. This is use in other areas of the object.
var fIndex = 0; // Current index of floor array
for(var yy = 0; yy < height; yy++){
    for(var xx = 0; xx < width; xx++){
        var ex = xx * CELL_WIDTH + CELL_WIDTH/2;
        var ey = yy * CELL_HEIGHT + CELL_HEIGHT/2;
        if(global.grid[# xx, yy] == FLOOR){
        
            var fc=noone;
            fc[0]=xx;
            fc[1]=yy;    
            floors[fIndex]=fc;
            fIndex++;
                      
             // Maybe place some cover
             var cOdds = 20;
             if(irandom(cOdds) == cOdds){
                var cover = instance_create(ex,ey,choose(obj_crate_sm,obj_crate_md1,obj_crate_md2,obj_crate_lg));
                with(cover){
                    depth = -y;
                }
                     
             }

            // Place light
            llods = 10;
            if(irandom(llods)==llods){
                var clr = choose(c_red,c_green,c_blue,c_yellow,c_orange,c_white,c_lime);
                glr_lightsimple_create(spr_glr_light_mask_point, 0, ex, ey, clr, 1,1);
            }
        }
    }
}



// Add the crates to the grid path so enemies will walk around them.
//mp_grid_add_instances(global.grid_path,obj_crate,0);


//instance_create((cx * CELL_WIDTH) + CELL_WIDTH/2, (cy * CELL_HEIGHT) + CELL_HEIGHT/2, obj_beast2);

with(obj_gun){
    if(type!=FACTION_PLAYER){
        instance_deactivate_object(id);
    }
}


