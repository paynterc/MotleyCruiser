// scr_go_through_door(door)

var rix = global.planet_room_index_x; // Current room x index
var riy = global.planet_room_index_y; // Current room y index
var door = argument0; // door entered 1 top, 2 right, 3 bottom, 4 left

var nextdoor;
var next_x;
var next_y;

switch(door){

    case 1:
        //top
        nextdoor = 3;
        next_x = rix;
        next_y = riy-1;
        break;
        
    case 2:
        // right
        nextdoor = 4;
        next_x = rix + 1;
        next_y = riy;
        break;
        
    case 3:
        // bottom
        nextdoor = 1;
        next_x = rix;
        next_y = riy+1;
        break;
        
    case 4:
        // left
        nextdoor = 2;
        next_x = rix-1;
        next_y = riy;
        break;
    default:
        nextdoor = 1;
}

// Can't have negative indexes. Guess we'll start in the top left corner and fan out.
if(next_x<0){
    next_x=0;
}
if(next_y<0){
    next_y=0;
}

global.planet_nextdoor = nextdoor;

if( next_x >= array_height_2d(global.planet_map) || next_y >= array_length_2d(global.planet_map,next_x) ){
    // Haven't been to this room. Make a new one.
    global.planet_map[next_x,next_y] = noone;
}

global.planet_room_index_x = next_x;
global.planet_room_index_y = next_y;
room_restart();
