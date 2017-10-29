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

var boxw, boxh, boxx1, boxy1, frame_bottom, boxw;
if(view_visible[0]){

    boxw = view_wview[0];
    boxh = view_hview[0]/2;
    boxx1 = view_xview[0];
    frame_bottom=view_yview[0] + view_hview[0];
    
    if(ytarget!=noone){
        boxy1 = view_yview[0] + ytarget;
    }else{
        boxy1 = frame_bottom - boxh - (sprite_get_height(spr_flyoption)/2);
    }


}else{

    boxw = room_width;
    boxh = 200;
    boxx1 = 0;
    if(ytarget!=noone){
        boxy1 = ytarget;
    }else{
        boxy1 = (room_height/2) - (boxh/2);
    }
    frame_bottom = room_height;
}





var tbox;
if(popup){
    tbox = instance_create(boxx1,frame_bottom,obj_flybox);
}else{
    tbox = instance_create(boxx1,boxy1,obj_flybox);
}

// text
tbox.text = args[0];

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

// popup
if(popup){

    tbox.desty=boxy1;
    tbox.yoffset_max = frame_bottom-tbox.boxy1;
    tbox.yoffset=tbox.yoffset_max;
    tbox.boxy1 = frame_bottom;
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
