//scr_add_dialogue_button(Branch, Text, Action, LinkIndex);

var branch = argument0;
var buttons = branch[? "buttons"];

button = ds_map_create();
ds_map_add(button,"text",argument1);
ds_map_add(button,"action",argument2);
ds_map_add(button,"link_index",argument3);
buttons[array_length_1d(buttons)] = button;

branch[? "buttons"] = buttons;

return branch;
