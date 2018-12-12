/// Removes the value at a given index from array. Shortens the array
// scr_array_delete_index(array,value)
var thearray = argument0;
var theindex = argument1;
var new_array = noone;
for(var i=0;i<array_length_1d(thearray); i++){    
    if(i!=theindex){
        new_array = scr_push_array(new_array,thearray[i]);
    } 
}
return new_array;
