/***
Return to the persisted room held in global variable.
***/
///scr_room_return()
if(global.hold_room!=noone){
    room_goto(global.hold_room);
}
