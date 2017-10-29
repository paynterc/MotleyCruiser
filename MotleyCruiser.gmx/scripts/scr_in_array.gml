/// scr_in_array(array,value)
var array = argument0;
var value = argument1;
var result = false;
for(var i=0; i<array_length_1d(array); i++){
    if(array[i]==value){
        result = true;
        break;
    }
}
return result;
