/// Create dialog for an npc so that player can interact. Provide missions, tips, items, etc.
dmap = ds_map_create();

ds_map_add(dmap, "type", "job");// job, tip, hire, trade
ds_map_add(dmap, "subtype", "job-deliver");// job-acquire, job-escort, job-deliver, job-passenger, job-bounty
ds_map_add(dmap,"text","I need a thing delivered to a guy.");//accept, decline
ds_map_add(dmap,"reward","200c");

return dmap;
