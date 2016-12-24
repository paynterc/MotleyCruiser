/// Buttons for Pause Menu
s_games = scr_get_saved_games();

var headertext = "LOAD GAME";
var width=640;
var height=480;
var buttons = noone;

var bwidth = width-32;
var bheight = (height / 5)-16;
var bpad = bheight+16;

//0
var bb = scr_gui_entity_button();
bb[BTN_X]=noone;//x (from panel boarder+padding)
bb[BTN_Y]=bpad;//y
bb[BTN_W]=bwidth;//w
bb[BTN_H]=bheight;//h
if(s_games[0]==1){
    bb[BTN_X]=11;//topx
    bb[BTN_W]=bb[BTN_W]-72;//w
    bb[BTN_TXT]="GAME 1";//text
}else{
    bb[BTN_TXT]="NEW GAME";//text
}
buttons=scr_push_array(buttons,bb);

//1
bb = scr_gui_entity_button();
bb[BTN_X]=noone;//x (from panel boarder+padding)
bb[BTN_Y]=bpad*2;//y
bb[BTN_W]=bwidth;//w
bb[BTN_H]=bheight;//h
if(s_games[1]==1){
    bb[BTN_X]=11;//topx
    bb[BTN_W]=bb[BTN_W]-72;//w
    bb[BTN_TXT]="GAME 2";//text
}else{
    bb[BTN_TXT]="NEW GAME";//text
}
buttons=scr_push_array(buttons,bb);

//2
bb = scr_gui_entity_button();
bb[BTN_X]=noone;//x (from panel boarder+padding)
bb[BTN_Y]=bpad*3;//y
bb[BTN_W]=bwidth;//w
bb[BTN_H]=bheight;//h
if(s_games[2]==1){
    bb[BTN_X]=11;//topx
    bb[BTN_W]=bb[BTN_W]-72;//w
    bb[BTN_TXT]="GAME 3";//text
}else{
    bb[BTN_TXT]="NEW GAME";//text
}
buttons=scr_push_array(buttons,bb);

//3
bb = scr_gui_entity_button();
bb[BTN_X]=noone;//x (from panel boarder+padding)
bb[BTN_Y]=bpad*4;//y
bb[BTN_W]=bwidth;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="< BACK";//text
buttons=scr_push_array(buttons,bb);

// Delete  buttons
var btn;

//4
bb = scr_gui_entity_button();
btn = buttons[0];
bb[BTN_X]=btn[BTN_X]+btn[BTN_W]+8;//x (from panel boarder+padding)
bb[BTN_Y]=btn[BTN_Y];//y
bb[BTN_W]=64;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="X";//text
bb[BTN_SHOW]=s_games[0]==1;
buttons=scr_push_array(buttons,bb);

//5
bb = scr_gui_entity_button();
btn = buttons[1];
bb[BTN_X]=btn[BTN_X]+btn[BTN_W]+8;//x (from panel boarder+padding)
bb[BTN_Y]=btn[BTN_Y];//y
bb[BTN_W]=64;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="X";//text
bb[BTN_SHOW]=s_games[1]==1;
buttons=scr_push_array(buttons,bb);

//6
bb = scr_gui_entity_button();
btn = buttons[2];
bb[BTN_X]=btn[BTN_X]+btn[BTN_W]+8;//x (from panel boarder+padding)
bb[BTN_Y]=btn[BTN_Y];//y
bb[BTN_W]=64;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="X";//text
bb[BTN_SHOW]=s_games[2]==1;
buttons=scr_push_array(buttons,bb);

// Confirmation buttons

// Confirm [0]
//7
bb = scr_gui_entity_button();
btn = buttons[0];
bb[BTN_X]=11;//x (from panel boarder+padding)
bb[BTN_Y]=btn[BTN_Y];//y
bb[BTN_W]=346;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="ARE YOU SURE?";//text
bb[BTN_SHOW]=false;
buttons=scr_push_array(buttons,bb);

//8
bb = scr_gui_entity_button();
btn = buttons[0];
bb[BTN_X]=367;//x (from panel boarder+padding)
bb[BTN_Y]=btn[BTN_Y];//y
bb[BTN_W]=124;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="YUP";//text
bb[BTN_SHOW]=false;
buttons=scr_push_array(buttons,bb);

//9
bb = scr_gui_entity_button();
btn = buttons[0];
bb[BTN_X]=499;//x (from panel boarder+padding)
bb[BTN_Y]=btn[BTN_Y];//y
bb[BTN_W]=121;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="NO!";//text
bb[BTN_SHOW]=false;
buttons=scr_push_array(buttons,bb);


// Confirm [1]
//10
bb = scr_gui_entity_button();
btn = buttons[1];
bb[BTN_X]=11;//x (from panel boarder+padding)
bb[BTN_Y]=btn[BTN_Y];//y
bb[BTN_W]=346;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="ARE YOU SURE?";//text
bb[BTN_SHOW]=false;
buttons=scr_push_array(buttons,bb);

//11
bb = scr_gui_entity_button();
btn = buttons[1];
bb[BTN_X]=367;//x (from panel boarder+padding)
bb[BTN_Y]=btn[BTN_Y];//y
bb[BTN_W]=124;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="YUP";//text
bb[BTN_SHOW]=false;
buttons=scr_push_array(buttons,bb);

//12
bb = scr_gui_entity_button();
btn = buttons[1];
bb[BTN_X]=499;//x (from panel boarder+padding)
bb[BTN_Y]=btn[BTN_Y];//y
bb[BTN_W]=121;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="NO!";//text
bb[BTN_SHOW]=false;
buttons=scr_push_array(buttons,bb);

// Confirm [2]
//13
bb = scr_gui_entity_button();
btn = buttons[2];
bb[BTN_X]=11;//x (from panel boarder+padding)
bb[BTN_Y]=btn[BTN_Y];//y
bb[BTN_W]=346;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="ARE YOU SURE?";//text
bb[BTN_SHOW]=false;
buttons=scr_push_array(buttons,bb);

//14
bb = scr_gui_entity_button();
btn = buttons[2];
bb[BTN_X]=367;//x (from panel boarder+padding)
bb[BTN_Y]=btn[BTN_Y];//y
bb[BTN_W]=124;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="YUP";//text
bb[BTN_SHOW]=false;
buttons=scr_push_array(buttons,bb);

//15
bb = scr_gui_entity_button();
btn = buttons[2];
bb[BTN_X]=499;//x (from panel boarder+padding)
bb[BTN_Y]=btn[BTN_Y];//y
bb[BTN_W]=121;//w
bb[BTN_H]=bheight;//h
bb[BTN_TXT]="NO!";//text
bb[BTN_SHOW]=false;
buttons=scr_push_array(buttons,bb);



panel_load_game = scr_gui_set_panel_data(headertext,width,height,buttons,5);
