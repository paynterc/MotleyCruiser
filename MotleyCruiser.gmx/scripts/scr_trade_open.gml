/*** 
Go to the trade interface
***/
/// scr_trade_open()

// Persist the current room
room_persistent = true;
global.hold_room = room;

// Go to the trade room and open the interface
room_goto(rm_trade);
