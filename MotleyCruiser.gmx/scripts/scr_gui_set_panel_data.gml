/// Calculate center panel in view based on width and height
// scr_gui_set_panel_data(headertext,width, height, buttons)
var data = noone;
var header = argument0;
var pwidth = argument1;
var pheight = argument2;
var buttons = argument3;
var padding = 5;

var top_x = ( display_get_gui_width() / 2 ) - (pwidth/2);
var top_y = ( display_get_gui_height() / 2 ) - (pheight/2);
data[0] = top_x;
data[1] = top_y;
data[2] = pwidth; //width
data[3] = pheight; //height
data[4] = false;//show or hide
data[5] = padding; //padding

//cancel button
cancel_button = noone;
cancel_button[0] = top_x + pwidth - 20 - padding;
cancel_button[1] = top_y + padding;
cancel_button[2] = 20;
cancel_button[3] = 20;
cancel_button[4] = false;//hover
cancel_button[5] = "x";

data[6] = cancel_button;
data[7] = header;

var bn;
var bs;
var buttons_formatted = noone;
if(buttons!=noone){
    for(var i=0;i<array_length_1d(buttons);i++){
        bs = buttons[i];
        bn=noone;//formatted button
        bn[0] = ( display_get_gui_width() / 2 ) - (bs[2]/2);//topx
        bn[1] = top_y + padding + bs[1];//topy
        bn[2] = bs[2];//width
        bn[3] = bs[3];//height
        bn[4] = false;//hover
        bn[5] = bs[4];//text
        buttons_formatted = scr_push_array(buttons_formatted,bn);
    }
}
data[8]=buttons_formatted;

return data;
