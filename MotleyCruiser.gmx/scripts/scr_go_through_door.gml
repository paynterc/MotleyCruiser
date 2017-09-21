// scr_go_through_door(door)

var rix = global.planet_room_index; // Current room index
var door = argument0; // door entered 1 top, 2 right, 3 bottom, 4 left

var nextdoor;
switch(door){

    case 1:
        nextdoor = 3;
        break;
        
    case 2:
        nextdoor = 4;
        break;
        
    case 3:
        nextdoor = 1;
        break;
        
    case 4:
        nextdoor = 2;
        break;
    default:
        nextdoor = 1;
}

global.planet_nextdoor = nextdoor;

if( global.planet_map[rix,door] != noone ){
    // We've geen to this room
    global.planet_room_index = global.planet_map[rix,door];
    var test = 2;
    room_restart();

}else{
    // Haven't been to this room. Make a new one.
    
    var nix = array_height_2d(global.planet_map);
    
    
    global.planet_map[nix,0] = noone;// no seed yet
    global.planet_map[nix,1] = noone;
    global.planet_map[nix,2] = noone;
    global.planet_map[nix,3] = noone;
    global.planet_map[nix,4] = noone;
    
    // Set the doors so we can get back here
    global.planet_map[rix,door] = nix;
    global.planet_map[nix,nextdoor] = rix;
    
    // Set the global index to the new room and restart the room
    global.planet_room_index = nix;
    var test = 1;
    room_restart();

}
