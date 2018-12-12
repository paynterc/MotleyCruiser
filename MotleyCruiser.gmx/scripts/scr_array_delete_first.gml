/// Removes the value at a given index from array. Shortens the array
// scr_array_delete_first(array)
var thearray = argument0;
if(is_array(thearray) && array_length_1d(thearray)>0){
    return scr_array_delete_index(thearray,0);
}else{
    return noone;
}


