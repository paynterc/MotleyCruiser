/// Return a full button array
// scr_make_dialogue_button(text,action,linkindex,script,record)
var button = scr_dialogue_button();

button[D_BUTTON_TEXT]=argument0;
button[D_BUTTON_ACTION]=argument1;
button[D_BUTTON_LINKINDEX]=argument2;
button[D_BUTTON_SCRIPT]=argument3;
button[D_BUTTON_RECORD]=argument4;
return button;
