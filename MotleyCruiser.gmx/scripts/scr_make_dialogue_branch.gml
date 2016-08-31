/// Create a single node or branch of the dialogue tree with text, buttons and branches
// scr_make_dialogue_branch(Text, Type);

var branch = ds_map_create();

ds_map_add(branch,"text", argument0);
ds_map_add(branch,"type", argument1);//intro, job, tip, hire, trade, exposition
ds_map_add(branch,"buttons", noone);
ds_map_add(branch,"branches", noone);

return branch;
