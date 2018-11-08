/// scr_get_array_1d(array,index)
// Get a single value for the submitted index. Check that index exists
var a = argument0;
var i = argument1;
if(!is_array(a)){
    return noone;
}
if(i<array_length_1d(a) && i>=0 ){
    return a[i];
}

return noone;
