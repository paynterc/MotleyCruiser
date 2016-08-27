/// Create dialog for an npc so that player can interact. Provide missions, tips, items, etc.
var dmap = ds_map_create();
ds_map_add(dmap,"id", global.mission_id );
ds_map_add(dmap,"type", "job");// job, tip, hire, trade
ds_map_add(dmap,"subtype", "job-deliver");// job-acquire, job-escort, job-deliver, job-passenger, job-bounty
ds_map_add(dmap,"text","I need a thing delivered to a guy. I need a thing delivered to a guy. I need a thing delivered to a guy. I need a thing delivered to a guy. I need a thing delivered to a guy.");//accept, decline
ds_map_add(dmap,"reward","200c");
ds_map_add(dmap,"status","new");//new, offered, accepted
//maybe count the number of offers. cut player off rudely if they don't accept after a couple times.
ds_map_add(dmap,"count_offers",0);//integer
global.mission_id ++;

// Buttons
var buttons = noone;
buttons[0]=ds_map_create();
ds_map_add(buttons[0],"text","Ok");
ds_map_add(buttons[0],"step",2);

buttons[1]=ds_map_create();
ds_map_add(buttons[1],"text","Hells No!");
ds_map_add(buttons[1],"step",3);

buttons[2]=ds_map_create();
ds_map_add(buttons[2],"text","Do you have any work that needs doing?");
ds_map_add(buttons[2],"step",4);

ds_map_add(dmap,"buttons",buttons);//new, offered, accepted

return dmap;
