/// scr_array_remove(array,value)
// Remove a value from array. Sets index to null, array stays the same. Returns the cleared index

var thearray = argument0;
var thevalue = argument1;
var found = false;
for(var i=0;i<array_length_1d(thearray); i++){    
    if(thearray[i]!=thevalue){
        thearray[@ i]=noone;
        found = true;
        break;
    } 
}
if(found){
    return i;
}else{
    return noone;
}
