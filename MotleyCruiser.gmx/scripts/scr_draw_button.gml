/// scr_draw_button(text, x-left, y-top, hover);

var myAlpha = .5;
var text = argument0;
var xx = argument1;
var yy = argument2;
var hover = argument3;

if(hover){
    //draw_set_alpha(1);
    myAlpha = 1;
}else{
    //draw_set_alpha(.5);
    myAlpha = .5;
}

//draw_set_color(c_gray);
//draw_rectangle(display_x - width/2, display_y - height/2, display_x + width/2, display_y + height/2, false);
//draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
//draw_text_color(xx, yy, text, c_white, c_white, c_white, c_white, myAlpha);
draw_text_transformed_colour(xx,yy,text,0.30,0.30,0,c_white,c_white,c_white,c_white,myAlpha);
