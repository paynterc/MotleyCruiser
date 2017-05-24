//scr_draw_selection(set,selection)
var set = argument[0];
var selection = argument[1];

if(!is_array(set)) return false;
if( selection >= array_length_1d(set) ) return false;
if( set[selection] == noone ) return false;

draw_sprite(set[ selection ],0,room_width/2,y_model);

