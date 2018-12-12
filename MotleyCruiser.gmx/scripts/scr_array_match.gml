/// scr_array_match(arraysArray,matchArray)
// Compare find one array within an array of arrays
var arraysArray = argument0;
var matchArray = argument1;
var result = false;
if(!is_array(arraysArray)){
    return false;
}
if(!is_array(matchArray)){
    return false;
}
var matchL =array_length_1d(matchArray);
for(var i=0; i<array_length_1d(arraysArray); i++){
    var subArray = arraysArray[i];
    var subMatch = true;
    if(array_length_1d(subArray) != matchL){
        continue;
    }   
    for(var j=0; j<array_length_1d(subArray); j++){
        if(subArray[j]!=matchArray[j]){
            subMatch = false
        }
    }
    if(subMatch){
        result = true;
        break;
    }
}
return result;
