/// Pick a random value from an array
// scr_array_random(array)
if(argument0==noone || array_length_1d(argument0)<1) return noone;

return argument0[irandom( array_length_1d(argument0)-1 )];
