/// scr_get_array_1d(array,index)
// Get a single value for the submitted index. Check that index exists
var a = argument0;
var i = argument1;
if(is_undefined(a)){
    return noone;
}else if(is_array(a)){
    if(i<array_length_1d(a) && i>=0 ){
        return a[i];
    }else{
        return noone;
    }
}else if(ds_exists(a,ds_type_list)){
    var res = a[| i];
    if(!is_undefined(res)){
        return res;
    }else{
        return noone;
    }
}


return noone;
