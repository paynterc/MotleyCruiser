/***
Persist the current room, hold it in a global, then go to a new room
***/
///scr_room_switch(room index)
if(!room_exists(argument0)) return false;
room_persistent = true;
global.hold_room = room;
room_goto(argument0);
