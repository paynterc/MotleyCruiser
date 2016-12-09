/// Ship modules
global.module_library = scr_new_array();
var module;

module = scr_ship_module();
module[MODULE_NAME]="Terran Command 1";
module[MODULE_DESCRIPTION]="A basic Terran command module. Provides life support plus limited thrust and energy.";
module[MODULE_TYPE]="command";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_command_16_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
scr_push_array_1d(global.module_library, module);


module = scr_ship_module();
module[MODULE_NAME]="Terran Command 2";
module[MODULE_DESCRIPTION]="A basic Terran command module. Provides life support plus limited thrust and energy.";
module[MODULE_TYPE]="command";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_command_16_2;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
scr_push_array_1d(global.module_library, module);


module = scr_ship_module();
module[MODULE_NAME]="Terran Command 3";
module[MODULE_DESCRIPTION]="A basic Terran command module. Provides life support plus limited thrust and energy.";
module[MODULE_TYPE]="command";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_command_16_3;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Terran Cargo Module 1";
module[MODULE_DESCRIPTION]="You're basic cargo module.";
module[MODULE_TYPE]="cargo";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_cargo_16_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Thruster 1";
module[MODULE_DESCRIPTION]="Medium thruster.";
module[MODULE_TYPE]="thrust";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_thrust_16_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Thruster 2";
module[MODULE_DESCRIPTION]="Small thruster.";
module[MODULE_TYPE]="thrust";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_thrust_16_2;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Thruster 3";
module[MODULE_DESCRIPTION]="Small thruster.";
module[MODULE_TYPE]="thrust";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_thrust_16_3;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Plasma Cannon1";
module[MODULE_DESCRIPTION]="Medium speed energy weapon.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_gun_16_48_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=0;// index in library
scr_push_array_1d(global.module_library, module);



module = scr_ship_module();
module[MODULE_NAME]="Pulse Repeater 1";
module[MODULE_DESCRIPTION]="Fast energy weapon.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_gun_16_32_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=1;// index in library
scr_push_array_1d(global.module_library, module);


module = scr_ship_module();
module[MODULE_NAME]="Pulse Repeater 2";
module[MODULE_DESCRIPTION]="Fast energy weapon.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_gun_16_32_2;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=1;// index in library
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Pulse Repeater 3";
module[MODULE_DESCRIPTION]="Fast energy weapon.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_gun_16_16_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=1;// index in library
scr_push_array_1d(global.module_library, module);
