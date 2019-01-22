/// scr_make_name_string(numNames);
var numNames = argument0;
var names = totro_plus(1,4,numNames,1,0);
var cmnName = "";
var nCount=irandom(3)+1;
for(var i=0;i<nCount;i++){
    cmnName += scr_array_random(names);
    if(i<nCount-1){
        cmnName += choose(" ","-","'");
    }
}
return cmnName;
