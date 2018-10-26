/// Pick a random value from an array
// scr_array_random(array)
if(!is_array(argument0) || argument0==noone || array_height_2d(argument0)<1) return noone;

return argument0[irandom( array_height_2d(argument0)-1 )];
