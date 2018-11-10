/// scr_gui_resource_bar(x,y,cargo count,supply,blinky,clr,txt,button)
var x1=argument0;
var y1=argument1;
var cc=argument2;// int. cargo count (obj_ship_data.cargo_food)
var supply = argument3;//global.supply_food
var blinky=argument4;// boolean.
var clr=argument5;
var txt=argument6;
var btn=argument7;//array. button data

draw_set_font(fnt_menus);
var strH=string_height("ABC");
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var padl = 4;// leftpad
var lspc = 2;// line spacing

if( cc > 0 || blinky ){            
    draw_set_color(clr);
    draw_text(x1,y1, txt + ": " + string(cc));                 
    draw_rectangle_color(x1, y1+strH+lspc, x1+supply, y1+lspc+( strH * 2), clr, clr, clr, clr, clr);
}
btn[@ BTN_X]=x1;
btn[@ BTN_Y]=y1;
btn[@ BTN_H]=lspc+( strH * 2);
if(cc<1 && supply<1){
    btn[@ BTN_SHOW]=true;
}else{
    btn[@ BTN_SHOW]=false;
}
btn[@ BTN_SHOW]=true;// TODO: TESTING ONLY
if(btn[BTN_SHOW] && blinky){
    draw_text( x1+padl,y1+strH+lspc,string(btn[BTN_TXT]) );
}
var bclr = c_white;
if(btn[BTN_HOVER]){
    bclr=c_fuchsia;
}
draw_rectangle_color(btn[BTN_X],btn[BTN_Y], btn[BTN_X]+btn[BTN_W], btn[BTN_Y]+btn[BTN_H], bclr, bclr, bclr, bclr, bclr);

return y1+lspc+( strH * 2);
