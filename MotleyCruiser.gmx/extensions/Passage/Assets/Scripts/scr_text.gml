
var str = argument0;
var type = argument1;
var xx = argument2;
var yy = argument3;
var sprite_id = argument4;
var image_id = argument5;
//Additional Strings
var str2 = argument6;
var str3 = argument7;
var str4 = argument8;
var str5 = argument9;

var str6 = argument10;
var str7 = argument11;
var str8 = argument12;
var str9 = argument13;
//var str10 = argument14;
var creating_inst = argument14;

//
if instance_exists(o_text_conditionals) {o_text_conditionals.destroy = true;}
var message_count = 1; 
if string_length(str2) > 0 {message_count = 2;}
if string_length(str3) > 0 {message_count = 3;}
if string_length(str4) > 0 {message_count = 4;}
if string_length(str5) > 0 {message_count = 5;}

if string_length(str6) > 0 {message_count = 6;}
if string_length(str7) > 0 {message_count = 7;}
if string_length(str8) > 0 {message_count = 8;}
if string_length(str9) > 0 {message_count = 9;}
//if string_length(str10) > 0 {message_count = 10;}

//xx = camera_get_view_x(view_camera[0])+ 672/2 - (sprite_get_width(s_text_box)/2);
//yy = camera_get_view_y(view_camera[0])+ 378 - 78 - (sprite_get_height(s_text_box)/2);
xx = room_width/2 - sprite_get_width(s_text_box)/2;
yy = room_height - 300;
if instance_exists(o_text_box) {o_text_box.destroy = true;}
var inst = instance_create(xx,yy,o_text_box);

inst.type = type;
inst.str = str;
inst.str2 = str2;
inst.str3 = str3;
inst.str4 = str4;
inst.str5 = str5;
inst.str6 = str6;
inst.str7 = str7;
inst.str8 = str8;
inst.str9 = str9;


o_text_control.creating_inst_store = creating_inst;
o_text_control.message_count_store = message_count;
o_text_control.current_count_store = 1;
o_text_control.portrait_index_store = sprite_id;
o_text_control.portrait_id_store = image_id;

