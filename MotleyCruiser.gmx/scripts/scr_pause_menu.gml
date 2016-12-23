/// Buttons for Pause Menu
var headertext = "GAME PAUSED";
var width=640;
var height=480;
var buttons = noone;


var bwidth = width-32;
var bheight = (height / 6)-16;
var bpad = bheight+16;

var bb = noone;
bb[0]=noone;//x (center if noone)
bb[1]=bpad;//y
bb[2]=bwidth;//w
bb[3]=bheight;//h
bb[4]="CONTINUE";//text
buttons=scr_push_array(buttons,bb);

bb = noone;
bb[0]=noone;//x (from panel boarder+padding)
bb[1]=bpad*2;//y
bb[2]=bwidth;//w
bb[3]=bheight;//h
bb[4]="LOAD GAME";//text
buttons=scr_push_array(buttons,bb);

bb = noone;
bb[0]=noone;//x (from panel boarder+padding)
bb[1]=bpad*3;//y
bb[2]=bwidth;//w
bb[3]=bheight;//h
bb[4]="HELP";//text
buttons=scr_push_array(buttons,bb);

bb = noone;
bb[0]=noone;//x (from panel boarder+padding)
bb[1]=bpad*4;//y
bb[2]=bwidth;//w
bb[3]=bheight;//h
bb[4]="SETTINGS";//text
buttons=scr_push_array(buttons,bb);

bb = noone;
bb[0]=noone;//x (from panel boarder+padding)
bb[1]=bpad*5;//y
bb[2]=bwidth;//w
bb[3]=bheight;//h
bb[4]="QUIT";//text
buttons=scr_push_array(buttons,bb);

panel_pause = scr_gui_set_panel_data(headertext,width,height,buttons,5);
