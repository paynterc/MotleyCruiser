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
module[MODULE_HULL_MOD]=10;
module[MODULE_ENERGY_MOD]=200;
module[MODULE_ENERGYREGENPOINTS_MOD]=3;
module[MODULE_CARGO_MOD]=1;
module[MODULE_BUNKS_MOD]=3;
module[MODULE_MASS_MOD]=200;
scr_push_array_1d(global.module_library, module);


module = scr_ship_module();
module[MODULE_NAME]="Terran Command 2";
module[MODULE_DESCRIPTION]="A basic Terran command module. Provides life support plus limited thrust and energy.";
module[MODULE_TYPE]="command";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_command_16_2;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_HULL_MOD]=15;
module[MODULE_ENERGY_MOD]=200;
module[MODULE_ENERGYREGENPOINTS_MOD]=3;
module[MODULE_CARGO_MOD]=1;
module[MODULE_BUNKS_MOD]=3;
module[MODULE_MASS_MOD]=200;
scr_push_array_1d(global.module_library, module);


module = scr_ship_module();
module[MODULE_NAME]="Terran Command 3";
module[MODULE_DESCRIPTION]="A basic Terran command module. Provides life support plus limited thrust and energy.";
module[MODULE_TYPE]="command";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_command_256;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_HULL_MOD]=10;
module[MODULE_ENERGY_MOD]=250;
module[MODULE_ENERGYREGENPOINTS_MOD]=3;
module[MODULE_CARGO_MOD]=1;
module[MODULE_BUNKS_MOD]=3;
module[MODULE_MASS_MOD]=200;
scr_push_array_1d(global.module_library, module);


module = scr_ship_module();
module[MODULE_NAME]="Terran Cargo Module 1";
module[MODULE_DESCRIPTION]="You're basic cargo module.";
module[MODULE_TYPE]="cargo";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_cargo_16_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_CARGO_MOD]=2;
module[MODULE_MASS_MOD]=100;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Thruster 1";
module[MODULE_DESCRIPTION]="Medium thruster.";
module[MODULE_TYPE]="thrust";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_thrust_16_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_THRUSTFWD_MOD]=200;
module[MODULE_THRUSTRVS_MOD]=150;
module[MODULE_ACCFWD_MOD]=.2;
module[MODULE_ACCBWD_MOD]=.2;
module[MODULE_MASS_MOD]=200;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Thruster 2";
module[MODULE_DESCRIPTION]="Small thruster.";
module[MODULE_TYPE]="thrust";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_thrust_16_2;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_THRUSTFWD_MOD]=150;
module[MODULE_THRUSTRVS_MOD]=132;
module[MODULE_ACCFWD_MOD]=.1;
module[MODULE_ACCBWD_MOD]=.1;
module[MODULE_MASS_MOD]=150;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Thruster 3";
module[MODULE_DESCRIPTION]="Small thruster.";
module[MODULE_TYPE]="thrust";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_thrust_16_3;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_THRUSTFWD_MOD]=100;
module[MODULE_THRUSTRVS_MOD]=70;
module[MODULE_ACCFWD_MOD]=.1;
module[MODULE_ACCBWD_MOD]=.1;
module[MODULE_MASS_MOD]=120;
scr_push_array_1d(global.module_library, module);





module = scr_ship_module();
module[MODULE_NAME]="Plasma Cannon1";
module[MODULE_DESCRIPTION]="Medium speed energy weapon.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_gun_16_48_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=0;// index in library
module[MODULE_MASS_MOD]=200;
scr_push_array_1d(global.module_library, module);



module = scr_ship_module();
module[MODULE_NAME]="Pulse Repeater 1";
module[MODULE_DESCRIPTION]="Fast energy weapon.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_gun_16_32_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=1;// index in library
module[MODULE_MASS_MOD]=200;
scr_push_array_1d(global.module_library, module);


module = scr_ship_module();
module[MODULE_NAME]="Rail 1";
module[MODULE_DESCRIPTION]="Slow mass projector.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_gun_16_32_2;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=2;// index in library
module[MODULE_MASS_MOD]=200;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Pulse Repeater 3";
module[MODULE_DESCRIPTION]="Fast energy weapon.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_gun_16_16_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=1;// index in library
module[MODULE_MASS_MOD]=200;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Lateral Thruster 1";
module[MODULE_DESCRIPTION]="Turning thruster.";
module[MODULE_TYPE]="lateral";// command, cargo, thrust, lateral, gun
module[MODULE_SPRITE_INDEX] = spr_thrust_lat_16_16_1;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=100;
module[MODULE_TURN_MOD]=100;
scr_push_array_1d(global.module_library, module);



module = scr_ship_module();
module[MODULE_NAME]="Armor 1";
module[MODULE_DESCRIPTION]="Basic armor.";
module[MODULE_TYPE]="lateral";// command, cargo, thrust, lateral, gun
module[MODULE_SPRITE_INDEX] = spr_armor_16_16_1;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=10;
module[MODULE_HULL_MOD]=5;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Generator 1";
module[MODULE_DESCRIPTION]="Generates energy.";
module[MODULE_TYPE]="generator";// command, cargo, thrust, lateral, gun
module[MODULE_SPRITE_INDEX] = spr_generator_16_16_1;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=200;
module[MODULE_ENERGY_MOD]=200;
module[MODULE_ENERGYREGENPOINTS_MOD]=15;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Terran Command 4";
module[MODULE_DESCRIPTION]="A medium-grade Terran command module. Provides life support plus limited thrust and energy.";
module[MODULE_TYPE]="command";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_command_16_4;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_HULL_MOD]=10;
module[MODULE_ENERGY_MOD]=270;
module[MODULE_ENERGYREGENPOINTS_MOD]=4;
module[MODULE_CARGO_MOD]=1;
module[MODULE_BUNKS_MOD]=4;
module[MODULE_MASS_MOD]=230;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Thruster 4";
module[MODULE_DESCRIPTION]="Medium Thruster. Higher acceleration and reverse thrust.";
module[MODULE_TYPE]="thrust";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_thrust_16_4;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_THRUSTFWD_MOD]=200;
module[MODULE_THRUSTRVS_MOD]=200;
module[MODULE_ACCFWD_MOD]=.3;
module[MODULE_ACCBWD_MOD]=.3;
module[MODULE_MASS_MOD]=220;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Turret Pulse Repeater 1";
module[MODULE_DESCRIPTION]="Fast, turret-mounted energy weapon.";
module[MODULE_TYPE]="turret";// command, cargo, thrust, turret, gun
module[MODULE_SPRITE_INDEX] = spr_turret_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=0;
module[MODULE_MASS_MOD]=220;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Turret Proton Beam";
module[MODULE_DESCRIPTION]="Fast, turret-mounted energy weapon.";
module[MODULE_TYPE]="turret";// command, cargo, thrust, turret, gun
module[MODULE_SPRITE_INDEX] = spr_turret_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=2;
module[MODULE_MASS_MOD]=220;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Blue Proton Beam";
module[MODULE_DESCRIPTION]="Medium beam weapon.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, turret, gun
module[MODULE_SPRITE_INDEX] = spr_beam_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=5;
module[MODULE_MASS_MOD]=220;
scr_push_array_1d(global.module_library, module);


module = scr_ship_module();
module[MODULE_NAME]="Terran Cargo Module 2";
module[MODULE_DESCRIPTION]="You're basic cargo module.";
module[MODULE_TYPE]="cargo";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_cargo_16_2;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_CARGO_MOD]=2;
module[MODULE_MASS_MOD]=200;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Terran Cargo Module 3";
module[MODULE_DESCRIPTION]="You're basic cargo module.";
module[MODULE_TYPE]="cargo";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_cargo_16_3;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_CARGO_MOD]=3;
module[MODULE_MASS_MOD]=300;
scr_push_array_1d(global.module_library, module);

