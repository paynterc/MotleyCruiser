/****
Remove null or "noone" values from an array
****/
/// scr_push_array(array)
var a = argument0;
var b = noone;
if(is_array(a)){
    for(var i=0; i<array_length_1d(a);i++){
        if(a[i]!=noone){
            b = scr_push_array(b,a[i]);
        }
    }
}
return b;
