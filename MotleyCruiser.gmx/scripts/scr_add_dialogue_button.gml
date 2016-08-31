//scr_add_dialogue_button(Branch, Text, Action);

var branch = argument0;
var buttons = branch[? "buttons"];

button = ds_map_create();
ds_map_add(button,"text",argument1);
ds_map_add(button,"action",argument2);
buttons[array_length_1d(buttons)] = button;

branch[? "buttons"] = buttons;

return branch;
