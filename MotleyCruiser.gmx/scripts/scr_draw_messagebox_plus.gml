///scr_draw_messagebox(string text, real text_length, real padding, real talking_object, color background_color, bool force_text_below_object, array buttons);

var text = argument0;       // Text for the box
var len = argument1;        // Text wrap width
var padding = argument2;    // Space between text and border
var obj = argument3;        // The object speaking. (message box points to them)
var bak_color = argument4;  // Color of the background
var force = argument5;      // Force box to draw below object
var buttons = argument6;
var font = fnt_messagebox;
var font_color = c_white;
var result = noone; //return array with coordinates of text box

if(!instance_exists(obj) /* talker died */ || string(text) == "" /* nothing to say */) return result;

draw_set_font(font);
draw_set_color(font_color);
 
var font_size = font_get_size(font);
var w = len+padding*2;

var height_text = round( string_height_ext(text, (font_size/2), len) * .3 );

// Make space for buttons
var text_plus = text + "#";
if(buttons != noone){
    for(var i = 0; i < array_length_1d(buttons); i++){
        thisbutton = buttons[i];
        text_plus = text_plus + "#" + thisbutton[? "text"];
    } 
}

var height = round( string_height_ext(text_plus, (font_size/2), len) * .3 );

var h2 = height+padding*2;
var xx = obj.x;
var yy = obj.y - padding*4 - obj.sprite_height - height;

xx -= max(0,(xx+len+padding*4)-(view_xview[0]+view_wview[0] /* change to view_xview[x]+view_wview[x] for game with views */)) + 10;

if(yy < view_yview[0] || force)
{
    yy = obj.y + obj.sprite_height + padding*2;
    draw_triangle(obj.x, obj.y+obj.sprite_height*.5+5, obj.x-padding,yy-padding+1,obj.x+padding,yy-padding+1,0);
}
else
{
    draw_triangle(obj.x, obj.y-obj.sprite_height*.5-5, obj.x+padding,yy+height+padding*2-1, obj.x-padding,yy+height+padding*2-1,0);
}


draw_roundrect(xx-padding,yy-padding,xx+len+padding*3,yy+height+padding*3,0);
draw_roundrect_colour(xx,yy,xx+w,yy+h2,bak_color,bak_color,0);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_ext_transformed(xx+padding,yy+padding,text,-1,len/0.30,0.30,0.30,0);


//return the bottom point of the bubble
result[0]=xx+padding;
result[1]=yy+height_text+padding;
return result;
