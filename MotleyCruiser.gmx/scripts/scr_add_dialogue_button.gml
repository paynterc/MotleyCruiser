//scr_add_dialogue_button(Branch, Text, Action, LinkIndex);

var branch = argument0;
var buttons = branch[D_BRANCH_BUTTONS];

button = noone;

button[D_BUTTON_TEXT]=argument1;
button[D_BUTTON_ACTION]=argument2;
button[D_BUTTON_LINKINDEX]=argument3;

buttons[array_length_1d(buttons)] = button;

branch[@ D_BRANCH_BUTTONS] = buttons;
