/// scr_draw_text(text,x,y,font,color,alpha,haligh,valign);

var args = noone;
for (var i=0; i<8; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

var theText = args[0];
var xx = args[1];
var yy = args[2];
var theFont = args[3];
var theColor = args[4];
var theAlpha = args[5];
var theHalign = args[6];
var theValign = args[7];

if(theText==noone){
    return false;
}
if(theFont==noone){
    theFont =  fnt_menus;
}
if(theColor==noone){
    theColor =  c_lime;
}
if(theAlpha==noone){
    theAlpha =  1;
}
if(theHalign==noone){
    theHalign =  fa_center;
}
if(theValign==noone){
    theValign =  fa_middle;
}
draw_set_font(theFont);
draw_set_color(theColor);
draw_set_alpha(theAlpha);
draw_set_halign(theHalign);
draw_set_valign(theValign);
draw_text(xx,yy,theText);

draw_set_alpha(1);
