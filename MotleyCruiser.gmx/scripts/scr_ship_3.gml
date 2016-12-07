/// Array map for ship

var ship = noone;

ship[SHIP_SCAFFOLD_SIZE]=3;


var modules = noone;

var mod_command = scr_ship_module();
mod_command[MODULE_TYPE]="command";
var anchors=noone;
anchors[0]=2;//scaffold row
anchors[1]=2;//scaffold column
mod_command[MODULE_COORDS] = anchors;
mod_command[MODULE_SPRITE_INDEX] = spr_command_16_40_1;

var mod_cargo1 = scr_ship_module();
mod_cargo1[MODULE_TYPE]="cargo";
var anchors=noone;
anchors[0]=2;//scaffold row
anchors[1]=2;//scaffold column
mod_cargo1[MODULE_COORDS] = anchors;
mod_cargo1[MODULE_SPRITE_INDEX] = spr_cargo_16_1;
mod_cargo1[MODULE_COLOR]=c_white;


var mod_cargo2 = scr_ship_module();
mod_cargo2[MODULE_TYPE]="cargo";
var anchors=noone;
anchors[0]=2;//scaffold row
anchors[1]=1;//scaffold column
mod_cargo2[MODULE_COORDS] = anchors;
mod_cargo2[MODULE_SPRITE_INDEX] = spr_cargo_16_1;
mod_cargo2[MODULE_COLOR]=c_white;

var mod_thrust1 = scr_ship_module();
mod_thrust1[MODULE_TYPE] = "thrust";
anchors=noone;
anchors[0]=2;//scaffold row
anchors[1]=0;//scaffold column
mod_thrust1[MODULE_COORDS]=anchors;
mod_thrust1[MODULE_SPRITE_INDEX]=spr_thrust_16_1;
mod_thrust1[MODULE_COLOR]=c_lime;

var mod_thrust2 = mod_thrust1;
anchors=noone;
anchors[0]=1;//scaffold row
anchors[1]=1;//scaffold column
mod_thrust2[MODULE_COORDS]=anchors;
mod_thrust2[MODULE_DEPTH]=3;

var mod_thrust3 = mod_thrust1;
anchors=noone;
anchors[0]=3;//scaffold row
anchors[1]=1;//scaffold column
mod_thrust3[MODULE_COORDS]=anchors;
mod_thrust3[MODULE_DEPTH]=3;


var gdata = global.guns[1];
var mod_gun1 = scr_ship_module();
mod_gun1[MODULE_TYPE]="gun";
anchors = noone;
anchors[0]=1;//scaffold row
anchors[1]=2;//scaffold column
mod_gun1[MODULE_COORDS]=anchors;
mod_gun1[MODULE_SPRITE_INDEX]=spr_gun_16_32_2;
mod_gun1[MODULE_COLOR]=c_red;
mod_gun1[MODULE_TYPE_DATA]=gdata;
mod_gun1[MODULE_COLOR]=c_white;


var mod_gun2 = mod_gun1;
anchors = noone;
anchors[0]=3;//scaffold row
anchors[1]=2;//scaffold column
mod_gun2[MODULE_COORDS]=anchors;


var mod_gun3 = mod_gun1;
anchors = noone;
anchors[0]=1;//scaffold row
anchors[1]=2;//scaffold column
mod_gun3[MODULE_COORDS]=anchors;
mod_gun3[MODULE_SPRITE_INDEX]=spr_gun_16_16_1;
mod_gun3[MODULE_DEPTH]=2;

var mod_gun4 = mod_gun1;
anchors = noone;
anchors[0]=3;//scaffold row
anchors[1]=2;//scaffold column
mod_gun4[MODULE_COORDS]=anchors;
mod_gun4[MODULE_SPRITE_INDEX]=spr_gun_16_16_1;
mod_gun4[MODULE_DEPTH]=2;

modules[0]=mod_command;
modules[1]=mod_cargo1;
modules[2]=mod_cargo2;
modules[3]=mod_gun1;
modules[4]=mod_gun2;
modules[5]=mod_gun3;
modules[6]=mod_gun4;
modules[7]=mod_thrust1;
modules[8]=mod_thrust2;
modules[9]=mod_thrust3;
ship[SHIP_MODULES]=modules;

return ship;

