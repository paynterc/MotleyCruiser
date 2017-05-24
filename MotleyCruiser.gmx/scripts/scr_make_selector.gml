/// Make left,right buttons and text
// scr_make_selector(x,y,text,target)

var xx = argument[0];
var yy = argument[1];
var text = argument[2];
var target = argument[3];

var btn_l;
var btn_r;
var lbl;
var pd = 8;// Padding

btn_l = instance_create(xx,yy,obj_change_button);
btn_l.mytext = "<";
btn_l.dir = -1;
btn_l.target = target;
xx += 32 + pd;       

lbl = instance_create(xx,yy,obj_button_text);
lbl.mytext = text;
xx += 72 + pd

btn_r = instance_create(xx,yy,obj_change_button);
btn_r.mytext = ">";
btn_r.dir = 1;
btn_r.mywidth = 32;
btn_r.myheight = 24;
btn_r.target = target;
