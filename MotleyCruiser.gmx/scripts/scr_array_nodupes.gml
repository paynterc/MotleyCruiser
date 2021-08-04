/****
Remove duplicates from array
****/
/// scr_array_nodupes(array)
var a = argument0;

var b = noone;
if(is_array(a)){
    for(var i=0; i<array_length_1d(a);i++){
        if( !scr_in_array(b,a[i]) ){
            b = scr_push_array(b,a[i]);
        }
    }
}
return b;
