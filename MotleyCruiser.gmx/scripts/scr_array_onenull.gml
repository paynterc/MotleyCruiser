/****
Remove all noone values from an array, leave only one at the start.
****/
//scr_array_onenull(array);
var a = argument0;
var b = noone;
var c = noone;
c[0]=noone;
if(is_array(a)){
    for(var i=0; i<array_length_1d(a);i++){
        if( a[i]!=noone ){
            b = scr_push_array(b,a[i]);
        }
    }
}
if(is_array(b)){
    for(var n=0; n<array_length_1d(b);n++){
         c = scr_push_array(c,b[n]);
    }
}

return c;
