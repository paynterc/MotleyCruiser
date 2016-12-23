/// Ship Library. Loaded from a file.
global.ship_library = noone;
var read_list = ds_list_create();
ini_open(DATA_FILE);
var str = ini_read_string("libraries", "ships", "");
ds_list_read(read_list,str);
global.ship_library = read_list[| 0];
ds_list_destroy(read_list);
ini_close();

