///scr_array(*args);
var arr = array_create(argument_count);
for (var i=0;i<argument_count;i+=1)
{
    arr[i] = argument[i];
}
return arr;

