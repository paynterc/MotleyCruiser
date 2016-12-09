/// scr_write_array(array,section,key,file);

var temp_list = ds_list_create();
temp_list[| 0] = argument0;
ini_open(argument3);
save_str = ds_list_write(temp_list);
ini_write_string(argument1, argument2, save_str);
ds_list_destroy(temp_list);
ini_close();
