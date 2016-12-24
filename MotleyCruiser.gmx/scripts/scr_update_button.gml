///scr_update_button(panel,btn_index,btn_attribute,value)
var panel = argument0;
var btn_index = argument1;
var btn_attribute = argument2;
var value = argument3;

var buttons = panel[8];
var btn = buttons[btn_index];
btn[@ btn_attribute] = value;


