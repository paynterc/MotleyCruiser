///scr_rm_persistence()
// Set default peristence of rooms. Use this before loading a new game
if(room==rm_space){
    room_persistent=false;
}else{
    room_set_persistent(rm_space,false);
}
