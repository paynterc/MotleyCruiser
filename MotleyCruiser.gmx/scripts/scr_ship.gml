/// Array map for ship

var ship = noone;

ship[SHIP_SCAFFOLD_INDEX]=0;


var modules = noone;

var mod_command = scr_ship_module();
mod_command[MODULE_TYPE]="command";
var anchors=noone;
anchors[0]=1;//scaffold row
anchors[1]=1;//scaffold column
mod_command[MODULE_COORDS] = anchors;
mod_command[MODULE_SPRITE_INDEX] = spr_command_16_40_1;



var mod_cargo = scr_ship_module();
mod_cargo[MODULE_TYPE] = "cargo";
anchors=noone;
anchors[0]=1;//scaffold row
anchors[1]=1;//scaffold column
mod_cargo[MODULE_COORDS]=anchors;
mod_cargo[MODULE_SPRITE_INDEX]=spr_cargo_16_1;
mod_cargo[MODULE_COLOR]=c_red;



var mod_thrust = scr_ship_module();
mod_thrust[MODULE_TYPE] = "thrust";
anchors=noone;
anchors[0]=1;//scaffold row
anchors[1]=0;//scaffold column
mod_thrust[MODULE_COORDS]=anchors;
mod_thrust[MODULE_SPRITE_INDEX]=spr_thrust_16_1;



var mod_gun = scr_ship_module();
mod_gun[MODULE_TYPE]="gun";
anchors = noone;
anchors[0]=0;//scaffold row
anchors[1]=1;//scaffold column
mod_gun[MODULE_COORDS]=anchors;
mod_gun[3]=spr_gun_16_48_1;
mod_gun[MODULE_COLOR]=c_red;

var mod_gun2 = scr_ship_module();
mod_gun2[MODULE_TYPE]="gun";
anchors = noone;
anchors[0]=2;//scaffold row
anchors[1]=1;//scaffold column
mod_gun2[MODULE_COORDS]=anchors;
mod_gun2[MODULE_SPRITE_INDEX]=spr_gun_16_48_1;
mod_gun2[MODULE_YSCALE]=-1;
mod_gun2 [MODULE_COLOR]=c_red;

modules[0]=mod_command;
modules[1]=mod_thrust;
modules[2]=mod_gun;
modules[3]=mod_gun2;
//modules[4]=mod_cargo;

ship[SHIP_MODULES]=modules;

return ship;

