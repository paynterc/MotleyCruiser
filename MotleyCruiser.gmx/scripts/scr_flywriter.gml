/// scr_flywriter(text,portrait,popup,options,option_tgt,ytarget);

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
var popup = args[2];
var options = args[3];
var option_target = args[4];
var ytarget = args[5];


var boxw = room_width;
var boxh = 200;
var boxx1 = 0;
var boxy1;
if(ytarget!=noone){
    boxy1 = ytarget;
}else{
    boxy1 = (room_height/2) - (boxh/2);
}


var tbox;
if(popup){
    tbox = instance_create(boxx1,room_height,obj_flybox);
}else{
    tbox = instance_create(boxx1,boxy1,obj_flybox);
}
with(tbox){

    spd = .90;
    xpadding=16;
    ypadding=16;
    maxlength = room_width-xpadding;
    text = args[0];
    font = fnt_messagebox;      
    text_length = string_length(text);
    font_size = font_get_size(font);
    draw_set_font(font);
    text_width = string_width_ext(text,font_size+(font_size/2),maxlength);
    text_height = string_height_ext(text,font_size+(font_size/2),maxlength);
     
}
tbox.boxy1 = boxy1;
tbox.boxw = boxw;
tbox.boxh = boxh;
tbox.boxx2 = boxx1 + boxw;
tbox.boxy2 = boxy1+boxh;

// portrait
if(portrait){
    tbox.portrait = portrait;
    tbox.pwidth = round(boxw/6);
    tbox.pheight = round(boxw/6);
    tbox.maxlength = room_width - tbox.pwidth - tbox.xpadding;
    tbox.xpadding = tbox.xpadding + tbox.pwidth;
}

// popup
if(popup){

    tbox.desty=boxy1;
    tbox.y = room_height;
    tbox.boxy1 = room_height;
    tbox.boxy2 = tbox.boxy1 + tbox.boxh;

}

// options
if(options!="" && options!=noone){
    // Options should be in the format "option_index,string1,string2,string3". 
    // For example: "1,Yes,No,Maybe"
    
    var splitBy = ","; // string to split the first string by
    var slot = 0;
    var splits = noone; // array to hold all splits
    var str2 = ""; // var to hold the current split we're working on building

    var i;
    for (i = 1; i < (string_length(options)+1); i++) {
        var currStr = string_copy(options, i, 1);
        if (currStr == splitBy) {
            splits[slot] = str2; // add this split to the array of all splits
            slot++;
            str2 = "";
        } else {
            str2 = str2 + currStr;
            splits[slot] = str2;
        }
    }
    
    tbox.option_index = real(splits[0]); // The option index should be the first item in the list
    
    var ops = noone;// The remaining items should be the text options.
    for(var i=1; i<array_length_1d(splits);i++){
        ops[i-1]=splits[i];
    }
    tbox.options = ops;
    
    if(option_target!=noone){
        tbox.option_target = option_target;
    }else{
        tbox.option_target = self;// The object that called this script
    }

}

tbox.state = "parsing";
//return tbox;
