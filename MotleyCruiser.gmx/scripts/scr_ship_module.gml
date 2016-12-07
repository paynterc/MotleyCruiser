/// Defaults for mounted ship module
var module = noone;

module[MODULE_TYPE]=noone;
var coords=noone;
coords[0]=0;//scaffold row
coords[1]=0;//scaffold column
module[MODULE_COORDS] = coords;
module[MODULE_OFFSETS] = noone;
module[MODULE_SPRITE_INDEX] = noone;
module[MODULE_XSCALE]=1;
module[MODULE_YSCALE]=1;
module[MODULE_COLOR]=c_white;
module[MODULE_GUN_OFFSETS]=noone;
module[MODULE_TYPE_DATA]=noone;
module[MODULE_DEPTH]=0;
return module;
