/// scr_array_get_last(array)
// Get a single value for the submitted index. Check that index exists
var a = argument0;
if(!is_array(a)){
    return noone;
}else if(array_length_1d(a)<1){
    return noone;
}else{
    return a[array_length_1d(a)-1];
}
