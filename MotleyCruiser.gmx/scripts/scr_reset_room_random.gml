/// Reset globals for random room
global.room_type="custom";//default. can be random, custom or control
global.room_seed=noone;
global.door_index = noone; // Which door to we place you at when returning to room
global.controls_total = 3; // Control rooms. Priority is Helm, Engine, Shields
global.controls_remaining = global.controls_total; // Control rooms remaining to capture
var da = noone;
da[0]=1;
da[1]=1;
da[2]=1;
global.doors_active = da;
