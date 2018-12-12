/// Removes the value at a given index from array. Shortens the array
// scr_array_delete_last(array)
var thearray = argument0;
if(is_array(thearray) && array_length_1d(thearray)>0){
    return scr_array_delete_index(thearray,array_length_1d(thearray)-1);
}else{
    return noone;
}


