/// Buttons for Pause Menu
var headertext = "GAME PAUSED";
var width=640;
var height=480;
var buttons = noone;


var bwidth = width-32;
var bheight = (height / 6)-16;
var bpad = bheight+16;

var bb = scr_gui_entity_button();
bb[BTN_X]=noone;//x (center if noone)
bb[BTN_Y]=bpad;//y
bb[BTN_W]=bwidth;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="CONTINUE";//text
buttons=scr_push_array(buttons,bb);

bb =  scr_gui_entity_button();
bb[BTN_X]=noone;//x (from panel boarder+padding)
bb[BTN_Y]=bpad*2;//y
bb[BTN_W]=bwidth;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="HELP";//text
buttons=scr_push_array(buttons,bb);

bb =  scr_gui_entity_button();
bb[BTN_X]=noone;//x (from panel boarder+padding)
bb[BTN_Y]=bpad*3;//y
bb[BTN_W]=bwidth;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="SETTINGS";//text
buttons=scr_push_array(buttons,bb);

bb =  scr_gui_entity_button();
bb[BTN_X]=noone;//x (from panel boarder+padding)
bb[BTN_Y]=bpad*4;//y
bb[BTN_W]=bwidth;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="MAIN MENU";//text
buttons=scr_push_array(buttons,bb);


panel_pause = scr_gui_set_panel_data(headertext,width,height,buttons,5);
