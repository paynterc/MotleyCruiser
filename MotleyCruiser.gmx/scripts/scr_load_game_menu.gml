/// Buttons for Pause Menu
var headertext = "LOAD GAME";
var width=640;
var height=480;
var buttons = noone;

var bwidth = width-32;
var bheight = (height / 5)-16;
var bpad = bheight+16;

var bb = noone;
bb[0]=noone;//x (from panel boarder+padding)
bb[1]=bpad;//y
bb[2]=bwidth;//w
bb[3]=bheight;//h
bb[4]="NEW GAME";//text
buttons=scr_push_array(buttons,bb);

bb = noone;
bb[0]=noone;//x (from panel boarder+padding)
bb[1]=bpad*2;//y
bb[2]=bwidth;//w
bb[3]=bheight;//h
bb[4]="GAME 1";//text
buttons=scr_push_array(buttons,bb);

bb = noone;
bb[0]=noone;//x (from panel boarder+padding)
bb[1]=bpad*3;//y
bb[2]=bwidth;//w
bb[3]=bheight;//h
bb[4]="GAME 2";//text
buttons=scr_push_array(buttons,bb);

bb = noone;
bb[0]=noone;//x (from panel boarder+padding)
bb[1]=bpad*4;//y
bb[2]=bwidth;//w
bb[3]=bheight;//h
bb[4]="< BACK";//text
buttons=scr_push_array(buttons,bb);


panel_load_game = scr_gui_set_panel_data(headertext,width,height,buttons,5);
