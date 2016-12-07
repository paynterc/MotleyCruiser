/// Array map for ship

var ship = noone;

ship[SHIP_SCAFFOLD_SIZE]=3;


var modules = noone;

var mod_command = scr_ship_module();
mod_command[MODULE_TYPE]="command";
var anchors=noone;
anchors[0]=1;//scaffold row
anchors[1]=1;//scaffold column
mod_command[MODULE_COORDS] = anchors;
mod_command[MODULE_SPRITE_INDEX] = spr_command_16_3;


var mod_thrust1 = scr_ship_module();
mod_thrust1[MODULE_TYPE] = "thrust";
anchors=noone;
anchors[0]=0;//scaffold row
anchors[1]=0;//scaffold column
mod_thrust1[MODULE_COORDS]=anchors;
mod_thrust1[MODULE_SPRITE_INDEX]=spr_thrust_16_3;


var mod_thrust2 = scr_ship_module();
mod_thrust2[MODULE_TYPE] = "thrust";
anchors=noone;
anchors[0]=2;//scaffold row
anchors[1]=0;//scaffold column
mod_thrust2[MODULE_COORDS]=anchors;
mod_thrust2[MODULE_SPRITE_INDEX]=spr_thrust_16_3;


var gdata = global.guns[1];

var mod_gun = scr_ship_module();
mod_gun[MODULE_TYPE]="gun";
anchors = noone;
anchors[0]=0;//scaffold row
anchors[1]=1;//scaffold column
mod_gun[MODULE_COORDS]=anchors;
mod_gun[MODULE_SPRITE_INDEX]=gdata[GUN_SPRITE];
mod_gun[MODULE_COLOR]=c_red;
mod_gun[MODULE_TYPE_DATA]=gdata;

var mod_gun2 = scr_ship_module();
mod_gun2[MODULE_TYPE]="gun";
anchors = noone;
anchors[0]=2;//scaffold row
anchors[1]=1;//scaffold column
mod_gun2[MODULE_COORDS]=anchors;
mod_gun2[MODULE_SPRITE_INDEX]=gdata[GUN_SPRITE];
mod_gun2[MODULE_YSCALE]=-1;
mod_gun2[MODULE_COLOR]=c_red;
mod_gun2[MODULE_TYPE_DATA]=gdata;

modules[0]=mod_command;
modules[1]=mod_thrust1;
modules[2]=mod_thrust2;
modules[3]=mod_gun;
modules[4]=mod_gun2;


ship[SHIP_MODULES]=modules;

return ship;

