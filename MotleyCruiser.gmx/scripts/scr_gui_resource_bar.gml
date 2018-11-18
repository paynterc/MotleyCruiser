/// scr_gui_resource_bar(x,y,cargo count,supply,blinky,clr,txt,button,initial,drawdir)
var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var x1=args[0];
var y1=args[1];
var cc=args[2];// int. cargo count (obj_ship_data.cargo_food)
var supply = args[3];// current resource quantity. e.g., global.supply_food
var blinky=args[4];// boolean.
var clr=args[5];
var txt=args[6];
var btn=args[7];//array. button data
var init = args[8]// An initial resource quantity. Defaults to 100;
var drawDir = args[9];//draw box to left or right. Default 1 = right. -1 is left;

if(init==noone){
    init=100;
}
if(drawDir==noone){
    drawDir=1;
}
var len = 100;// Maxmimum length of the resource bar, in pixels
var lenAdj = (supply/init) * len * drawDir;// Adusted length of the bar.

draw_set_font(fnt_menus);
var strH=string_height("ABC");
if(drawDir==-1){
    draw_set_halign(fa_right);
}else{
    draw_set_halign(fa_left);
}

draw_set_valign(fa_top);
var padl = 4;// leftpad
var lspc = 2;// line spacing

if( cc > 0 || blinky ){            
    draw_set_color(clr);
    draw_text(x1,y1, txt + ": " + string(round(cc)));                 
    draw_rectangle_color(x1, y1+strH+lspc, x1+lenAdj, y1+lspc+( strH * 2), clr, clr, clr, clr, clr);
}
if(btn!=noone){
    btn[@ BTN_X]=x1;
    btn[@ BTN_Y]=y1;
    btn[@ BTN_H]=lspc+( strH * 2);
    if(cc<1 && supply<1){
        btn[@ BTN_SHOW]=true;
    }else{
        btn[@ BTN_SHOW]=false;
    }
    
    if(btn[BTN_SHOW] && blinky){
        draw_text( x1+padl,y1+strH+lspc,string(btn[BTN_TXT]) );
    }
    var bclr = c_white;
    if(btn[BTN_HOVER]){
        bclr=c_fuchsia;
    }
    //draw_rectangle_color(btn[BTN_X],btn[BTN_Y], btn[BTN_X]+btn[BTN_W], btn[BTN_Y]+btn[BTN_H], bclr, bclr, bclr, bclr, bclr);
}



return y1+lspc+( strH * 2);
