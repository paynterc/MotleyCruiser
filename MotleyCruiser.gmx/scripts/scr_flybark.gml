/// scr_flybark(text,portrait,time,drawgui);

var args = noone;
for (var i=0; i<16; i++)
{
    if (i < argument_count)
        args[i] = argument[i];
    else
        args[i] = noone;
}

if(instance_exists(obj_flybox)){
    with(obj_flybox){

        destroy = true;
    }
}
if(instance_exists(obj_flyoption)){
    with(obj_flyoption){
        destroy=true;
    }
}

var portrait = args[1];
var time = args[2];
var drawgui = args[3];

drawgui = true;

var boxw, boxh, boxx1, boxy1, frame_bottom, boxw;
if(drawgui){

    boxw = display_get_gui_width() / 2;
    boxh = display_get_gui_height()/3;
    boxx1 = 0;
    frame_bottom=display_get_gui_height();   
    boxy1 = frame_bottom - boxh;
    
}else if(view_visible[0]){

    boxw = view_wview[0] / 2;
    boxh = view_hview[0]/3;
    boxx1 = view_xview[0];
    frame_bottom=view_yview[0] + view_hview[0];   
    boxy1 = frame_bottom - boxh;

}else{

    boxw = room_width / 3;
    boxh = room_height / 3;
    boxx1 = 0;
    boxy1 = (room_height/2) - (boxh/2);
    frame_bottom = room_height;
}



var tbox = instance_create(boxx1,frame_bottom,obj_flybox);

// text
tbox.text = args[0];
tbox.font = fnt_messagebox_lg;
tbox.boxy1 = boxy1;
tbox.boxw = boxw;
tbox.boxh = boxh;
tbox.boxx2 = boxx1 + boxw;
tbox.boxy2 = boxy1+boxh;
tbox.yoffset_max = frame_bottom-tbox.boxy1;

// portrait
if(portrait){
    tbox.portrait = portrait;
}

var timer=2;
if(time > 2){
    timer = time;
}

// popup

tbox.desty=boxy1;
tbox.yoffset_max = frame_bottom-tbox.boxy1;
tbox.yoffset=tbox.yoffset_max;
tbox.boxy1 = frame_bottom;
tbox.boxy2 = tbox.boxy1 + tbox.boxh;


with(tbox){
    event_user(0);// Execute
    alarm[0]=room_speed * timer;
}
