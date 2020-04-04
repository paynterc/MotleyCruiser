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
sizeModifier = .50;//.10 .25 .50, .75, 1, 1.25 ... do not exceed 2. This is for the overall size of the global.grid. Larger ships.
if(global.ship_boarded != noone){
    if(global.ship_boarded[SHIP_SCAFFOLD_SIZE]<=3){   
        sizeModifier = .15;
    }
}
// Create the DS global.grid
global.grid = ds_grid_create(width, height);

// Create the pathfinding global.grid
global.grid_path = mp_grid_create(0,0,width,height,CELL_WIDTH,CELL_HEIGHT);

// Fill the global.grid with voids
ds_grid_set_region(global.grid, 0, 0, width-1, height-1, VOID);

// Load a room
// BE SURE TO CALL randomize() before this.

//if (show_question("Would you like to load a room")){
 
// var key = get_string("What is the name of the room?", "default");
// ini_open("Save.ini");
// var seed = ini_read_real("Rooms", key, 0);
// random_set_seed(seed);

//}else{
// Randomize the world
//    randomize();
//}
if(global.room_seed!=noone){
    random_set_seed(global.room_seed);
}else{
    randomize();
}
// Waves
waves = irandom(2)+1;


var centerCell = scr_shipboard_find_center(global.ship_boarded);
var xOff = centerCell[0];
var yOff = centerCell[1]

// Create the controller in the center of the global.grid
var cx = (width div 2) + (16*shipScale*xOff);
var cy = (height div 2) + (16*shipScale*yOff);

var cx2 = cx;
var cy2 = cy;

var px1 = cx;
var py1 = cy;

var ww = choose(5,7);
var hh = choose(5,7);
scr_stamp_center(cx,cy,ww,hh);

// Light

glr_set_ambient_color(c_blue);

//Mke a light over the door
var lspace = 3;
for(var lx = lspace; lx < ww; lx += lspace){
    for(ly = lspace; ly < hh; ly += lspace){
        var lxT = (cx - floor(ww/2)) + lx; // Translate lx to a room coordinate
        var lyT = (cy - floor(hh/2)) + ly;
        var my_light1 = glr_lightsimple_create(spr_glr_light_mask_point, 0, (lxT * CELL_WIDTH) - (CELL_WIDTH/2), (lyT * CELL_HEIGHT) - (CELL_HEIGHT/2), choose(c_white,c_green), 1, 1);
        //glr_lightsimple_set_scaling(my_light1,.35,.35);
    }
}


// Give the controller a random direction
var cdir = irandom(3);

// The odds variable for changing direction
var odds = 1;


// stamp out some random floor shapes
var stampSize = 3;

/// scr_shipboard_random()
// Stamp out rooms on a boarded ship
var numStamps = global.ship_boarded[SHIP_SCAFFOLD_SIZE] + 2; //TODO: Do someting to increase this based on ship size. See SHIP_SCAFFOLD_SIZE
repeat ( numStamps ){
    // Place a floor tile a the controller position
    //global.grid[# cx,cy]=FLOOR;
    scr_stamp_center(cx,cy,stampSize,stampSize);
    scr_stamp_center(cx,cy2,stampSize,stampSize);
    //ds_grid_set(global.grid, cx, cy, FLOOR); (alternative)

    
    // Mirror the above
    //global.grid[# cx2,cy]=FLOOR;
    scr_stamp_center(cx2,cy,stampSize,stampSize);
    scr_stamp_center(cx2,cy2,stampSize,stampSize);
    
   
    // Randomize the direction of the controller
    if(irandom(odds) == odds){
        cdir = irandom(3);
    }
    
    // Move the controller
    var nextMove = irandom_range(1,stampSize);
    var xdir = lengthdir_x(nextMove, cdir*90);
    var ydir = lengthdir_y(nextMove, cdir*90);
    cx += xdir;
    cx2 -= xdir;
    cy += ydir;
    cy2 -= ydir;
    
    // Clamp cx and cy so you don't go outside of the global.grid
    cx = clamp(cx, 1, width-stampSize);
    cx2 = clamp(cx2, 1, width-stampSize);
    cy = clamp(cy, 1, height-stampSize);
    cy2 = clamp(cy2, 1, height-stampSize);
}

// Player start coordinates
px_start = px1 * CELL_WIDTH + (CELL_WIDTH/2);
py_start = py1 * CELL_HEIGHT + (CELL_HEIGHT/2);


/**************************
DOOR TO NEXT DECK OR CONTROL ROOM
// Make a hallway and alcove
global.grid[# px1,py1-1]=FLOOR;
global.grid[# px1,py1-2]=FLOOR;
global.grid[# px1,py1-3]=FLOOR;
scr_stamp_rectangle(px1-1,py1-6,3,3);
***************************/


//Make an interactable to take the player to the next level

door = instance_create(px_start, (py1 * CELL_HEIGHT) + CELL_HEIGHT,obj_ladder);
// This part will depend on the number of decks.
// Sequence will be: deck, deck, deck, control
// See the Alarm 0 event in this object and the obj_door object for more detail on level progression.
door.room_to = room_get_name(room);
door.interact_active = false;
door.image_speed = 0;
door.image_alpha = 0;


// Stamp out a corridor for the beast
/***
cx = width div 2;
cy = height div 2;
repeat(3){
    cy+=stampSize;
    scr_stamp_center(cx,cy,stampSize,stampSize);   
}
***/


// Draw the level
scr_add_wall_tiles(height,width);



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

floors = noone; // An array to keep track of floor locations.
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

// Place enemies


// DEACTIVATE OBJECTS
/***
with(obj_npc){
    if(faction!=FACTION_PLAYER){
        instance_deactivate_object(id);
    }
}
***/


//instance_create((cx * CELL_WIDTH) + CELL_WIDTH/2, (cy * CELL_HEIGHT) + CELL_HEIGHT/2, obj_beast2);

with(obj_gun){
    if(type!=FACTION_PLAYER){
        instance_deactivate_object(id);
    }
}


