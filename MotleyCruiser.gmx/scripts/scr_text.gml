/// scr_text(Text, Speed, X, Y, ShowButton);
//txt = instance_create(argument2,argument3,obj_text);

with (obj_text)
{
    x = argument2;
    y = argument3;
    
    alpha = 0;
    print = "";
    time = 0;
    depth = depth - instance_number(obj_text);
    
    padding = 16;
    maxlength= view_wview[0]/2;
    text = argument0;
    spd = argument1;
    font = fnt;
    
    text_length = string_length(text);
    font_size = font_get_size(font);
    
    draw_set_font(font);
    
    text_width = string_width_ext(text,font_size+(font_size/2), maxlength);
    text_height = string_height_ext(text,font_size+(font_size/2), maxlength);
    
    boxwidth = text_width + (padding*2);
    boxheight = text_height + (padding*2);
    show = true;
    
}

if(argument4){
with (obj_button)
{
    display_x = argument2;
    display_y = argument3;
    show = true;
    depth = obj_text.depth-1;
    
    text = "Accept";
    text_length = string_length(text);    
    text_width = string_width_ext(text,font_size+(font_size/2), maxlength);
    text_height = string_height_ext(text,font_size+(font_size/2), maxlength);

}
}


