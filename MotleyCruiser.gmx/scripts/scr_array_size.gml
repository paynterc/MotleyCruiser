///scr_array_size(size);
var size = argument0;
var array = noone;
var resize = size -1;// You asked for array size 3, so we start at 2 and count down.
if(resize<1){
    resize = 1;
}
for(var i=resize; i>=0; i--){
    array[i]=noone;
}
return array;

