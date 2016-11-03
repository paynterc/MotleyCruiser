/// Remove button from a branch
// scr_delete_button(branch, button_index);

var branch = argument0;
var bindex = argument1;

var buttons = branch[D_BRANCH_BUTTONS];
var newbuttons = noone;
for(var i=0; i<array_length_1d(buttons); i++){
    if(i==bindex) continue;
    newbuttons = scr_push_array(newbuttons,buttons[i]);
}

branch[@ D_BRANCH_BUTTONS]=newbuttons;
