/// scr_gx_findsister_path(array myPath,array allPaths)
// Compare find one array within an array of arrays
var myPath = argument0;
var allPaths = argument1;
var result = false;
if(!is_array(myPath)){
    return false;
}
if(!is_array(allPaths)){
    return false;
}
if(array_length_1d(myPath)<5){
    return false
}

// Reverse the coordinates for the path we're looking for. The return path would have these values.
var x1=myPath[2];
var y1=myPath[3];
var x2=myPath[0];
var y2=myPath[1];

for(var i=0; i<array_length_1d(allPaths); i++){
    var subArray = allPaths[i];
    if(array_length_1d(subArray) != 5){
        continue;
    }   
    if(subArray[0]==x1
    && subArray[1]==y1
    && subArray[2]==x2
    && subArray[3]==y2
    ){
        myPath[@4] = true;
        result=true;
        break;
    }
}
return result;
