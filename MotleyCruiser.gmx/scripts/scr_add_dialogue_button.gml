//scr_add_dialogue_button(Branch, Text, Action, LinkIndex, Script, Record);

var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}


var branch = args[0];
var buttons = branch[D_BRANCH_BUTTONS];

var button = scr_make_dialogue_button(args[1],args[2],args[3],args[4],args[5]);

buttons[array_length_1d(buttons)] = button;

branch[@ D_BRANCH_BUTTONS] = buttons;
