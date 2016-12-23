/// Panel for Main Menu
var headertext = "";
var width=960;
var height=720;
var buttons = noone;
var padding = 64;

var bwidth = (width/3)-128;
var bheight = 64;
var bpad = 64;
var btn_y = height - (bheight * 3);

var bb = noone;
bb[0]=0;//x (from panel boarder+padding)
bb[1]=btn_y;//y
bb[2]=bwidth;//w
bb[3]=bheight;//h
bb[4]="PLAY";//text
buttons=scr_push_array(buttons,bb);

var bb = noone;
bb[0]=noone;//x (from panel boarder+padding)
bb[1]=btn_y;//y
bb[2]=bwidth;//w
bb[3]=bheight;//h
bb[4]="HELP";//text
buttons=scr_push_array(buttons,bb);

var bb = noone;
bb[0]=width-bwidth-(bpad*2);//x (from panel boarder+padding)
bb[1]=btn_y;//y
bb[2]=bwidth;//w
bb[3]=bheight;//h
bb[4]="SETTINGS";//text
buttons=scr_push_array(buttons,bb);


panel_main_menu = scr_gui_set_panel_data(headertext,width,height,buttons,padding);
