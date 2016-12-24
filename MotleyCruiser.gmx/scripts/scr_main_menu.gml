/// Panel for Main Menu
var headertext = "";
var width=960;
var height=720;
var buttons = noone;
var padding = 48;

var bwidth = (width/3)-128;
var bheight = 64;
var bpad = 32;
var btn_y = height - (bheight * 3);

var bb = scr_gui_entity_button();
bb[BTN_X]=0;//x (from panel boarder+padding)
bb[BTN_Y]=btn_y;//y
bb[BTN_W]=bwidth;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="PLAY";//text
buttons=scr_push_array(buttons,bb);

var bb = scr_gui_entity_button();
bb[BTN_X]=bwidth+bpad;//x (from panel boarder+padding)
bb[BTN_Y]=btn_y;//y
bb[BTN_W]=bwidth;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="HELP";//text
buttons=scr_push_array(buttons,bb);

var bb = scr_gui_entity_button();
bb[BTN_X]=(bwidth+bpad) * 2;//x (from panel boarder+padding)
bb[BTN_Y]=btn_y;//y
bb[BTN_W]=bwidth;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="SETTINGS";//text
buttons=scr_push_array(buttons,bb);


var bb = scr_gui_entity_button();
bb[BTN_X]=(bwidth+bpad) * 3;//x (from panel boarder+padding)
bb[BTN_Y]=btn_y;//y
bb[BTN_W]=bwidth;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="QUIT";//text
buttons=scr_push_array(buttons,bb);

panel_main_menu = scr_gui_set_panel_data(headertext,width,height,buttons,padding);
