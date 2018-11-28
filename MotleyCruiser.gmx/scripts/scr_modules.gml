/// Ship modules
// Baseline at 10dps / 10eps (energy per second).
// Energy regen speed is 4click per room_speed (sec)
// Base energy regen points are 2.5. So 10 points per second.

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
module[MODULE_ENERGY_MOD]=100;
module[MODULE_ENERGYREGENPOINTS_MOD]=2.5;
module[MODULE_CARGO_MOD]=1;
module[MODULE_BUNKS_MOD]=2;
module[MODULE_MASS_MOD]=200;
module[MODULE_COMMAND_MOD]=1;// Flags this as a command module
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Terran Command 2";
module[MODULE_DESCRIPTION]="A basic Terran command module. Provides life support plus limited  and energy.";
module[MODULE_TYPE]="command";// command, cargo, , gun
module[MODULE_SPRITE_INDEX] = spr_command_16_2;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_HULL_MOD]=15;
module[MODULE_ENERGY_MOD]=100;
module[MODULE_ENERGYREGENPOINTS_MOD]=2.5;
module[MODULE_CARGO_MOD]=1;
module[MODULE_BUNKS_MOD]=2;
module[MODULE_MASS_MOD]=200;
module[MODULE_COMMAND_MOD]=1;// Flags this as a command module
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Terran Command 3";
module[MODULE_DESCRIPTION]="A basic Terran command module. Provides life support plus limited  and energy.";
module[MODULE_TYPE]="command";// command, cargo, , gun
module[MODULE_SPRITE_INDEX] = spr_command_16_3;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_HULL_MOD]=10;
module[MODULE_ENERGY_MOD]=100;
module[MODULE_ENERGYREGENPOINTS_MOD]=2.5;
module[MODULE_CARGO_MOD]=1;
module[MODULE_BUNKS_MOD]=2;
module[MODULE_MASS_MOD]=200;
module[MODULE_COMMAND_MOD]=1;// Flags this as a command module
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Hab Module 1";
module[MODULE_DESCRIPTION]="Crew habitation module. Basic living quarters and bunks.";
module[MODULE_TYPE]="cargo";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_cargo_16_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_CARGO_MOD]=1;
module[MODULE_BUNKS_MOD]=2;
module[MODULE_MASS_MOD]=50;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Thruster 1";
module[MODULE_DESCRIPTION]="Large thruster.";
module[MODULE_TYPE]="thrust";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_thrust_16_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_THRUSTFWD_MOD]=300;
module[MODULE_THRUSTRVS_MOD]=300;
module[MODULE_ACCFWD_MOD]=.2;
module[MODULE_ACCBWD_MOD]=.2;
module[MODULE_MASS_MOD]=100;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Thruster 2";
module[MODULE_DESCRIPTION]="Medium thruster.";
module[MODULE_TYPE]="thrust";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_thrust_16_2;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_THRUSTFWD_MOD]=200;
module[MODULE_THRUSTRVS_MOD]=200;
module[MODULE_ACCFWD_MOD]=.1;
module[MODULE_ACCBWD_MOD]=.1;
module[MODULE_MASS_MOD]=75;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Thruster 3";
module[MODULE_DESCRIPTION]="Small thruster.";
module[MODULE_TYPE]="thrust";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_thrust_16_3;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_THRUSTFWD_MOD]=100;
module[MODULE_THRUSTRVS_MOD]=100;
module[MODULE_ACCFWD_MOD]=.1;
module[MODULE_ACCBWD_MOD]=.1;
module[MODULE_MASS_MOD]=50;
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
module[MODULE_NAME]="Mass Cannon 1";
module[MODULE_DESCRIPTION]="Slow mass projector.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_gun_16_32_2;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=2;// index in GUN library
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
module[MODULE_MASS_MOD]=10;
module[MODULE_TURN_MOD]=200;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Armor 1A";
module[MODULE_DESCRIPTION]="Basic armor.";
module[MODULE_TYPE]="armor";// command, cargo, thrust, lateral, gun
module[MODULE_SPRITE_INDEX] = spr_armor_16_16_1;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=25;
module[MODULE_HULL_MOD]=5;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Generator 1";
module[MODULE_DESCRIPTION]="Generates energy.";
module[MODULE_TYPE]="generator";// command, cargo, thrust, lateral, gun
module[MODULE_SPRITE_INDEX] = spr_generator_16_16_1;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=200;
module[MODULE_ENERGY_MOD]=100;
module[MODULE_ENERGYREGENPOINTS_MOD]=2.5;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Terran Command 4";
module[MODULE_DESCRIPTION]="A medium-grade Terran command module. Provides life support plus limited thrust and energy.";
module[MODULE_TYPE]="command";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_command_16_4;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_HULL_MOD]=10;
module[MODULE_ENERGY_MOD]=100;
module[MODULE_ENERGYREGENPOINTS_MOD]=2.5;
module[MODULE_CARGO_MOD]=1;
module[MODULE_BUNKS_MOD]=2;
module[MODULE_MASS_MOD]=225;
module[MODULE_COMMAND_MOD]=1;// Flags this as a command module
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Thruster 4";
module[MODULE_DESCRIPTION]="Medium Thruster. Higher acceleration and reverse thrust.";
module[MODULE_TYPE]="thrust";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_thrust_16_4;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_THRUSTFWD_MOD]=600;
module[MODULE_THRUSTRVS_MOD]=500;
module[MODULE_MASS_MOD]=6;
scr_push_array_1d(global.module_library, module);

// Turret
module = scr_ship_module();
module[MODULE_NAME]="Turret Pulse Repeater 1";
module[MODULE_DESCRIPTION]="Fast, turret-mounted energy weapon.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_turret_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=10;
module[MODULE_MASS_MOD]=220;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Turret Proton Beam";
module[MODULE_DESCRIPTION]="Fast, turret-mounted energy weapon.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, turret, gun
module[MODULE_SPRITE_INDEX] = spr_turret_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=11;
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
module[MODULE_MASS_MOD]=50;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Terran Cargo Module 3";
module[MODULE_DESCRIPTION]="You're basic cargo module.";
module[MODULE_TYPE]="cargo";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_cargo_16_3;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_CARGO_MOD]=3;
module[MODULE_MASS_MOD]=75;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Terran Platform Command 1";
module[MODULE_DESCRIPTION]="A basic Terran platform module. Provides life support plus limited thrust and energy.";
module[MODULE_TYPE]="command";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_platform;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=noone;
module[MODULE_HULL_MOD]=10;
module[MODULE_ENERGY_MOD]=100;
module[MODULE_ENERGYREGENPOINTS_MOD]=2.5;
module[MODULE_CARGO_MOD]=1;
module[MODULE_BUNKS_MOD]=2;
module[MODULE_MASS_MOD]=200;
module[MODULE_COMMAND_MOD]=1;// Flags this as a command module
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Platform Cannon 1";
module[MODULE_DESCRIPTION]="Slow turret-mounted weapon with a 3-bullet spread.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, turret, gun
module[MODULE_SPRITE_INDEX] = spr_turret_2;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=12;// Index from gun library, turret library, etc.
module[MODULE_MASS_MOD]=220;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Armor 1B";
module[MODULE_DESCRIPTION]="Basic armor.";
module[MODULE_TYPE]="armor";// command, cargo, thrust, lateral, gun
module[MODULE_SPRITE_INDEX] = spr_armor_16_16_2;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=BASE_ARMOR_MASS;
module[MODULE_HULL_MOD]=BASE_ARMOR_MOD;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Armor 1C";
module[MODULE_DESCRIPTION]="Basic armor.";
module[MODULE_TYPE]="armor";// command, cargo, thrust, lateral, gun
module[MODULE_SPRITE_INDEX] = spr_armor_16_32_1;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=BASE_ARMOR_MASS;
module[MODULE_HULL_MOD]=BASE_ARMOR_MOD;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Armor 1D";
module[MODULE_DESCRIPTION]="Basic armor.";
module[MODULE_TYPE]="armor";// command, cargo, thrust, lateral, gun
module[MODULE_SPRITE_INDEX] = spr_armor_16_16_3;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=BASE_ARMOR_MASS;
module[MODULE_HULL_MOD]=BASE_ARMOR_MOD;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Hellfury Cannon 1";
module[MODULE_DESCRIPTION]="Unleashes a barage of energy bolts.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_hellfury;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=7;// index in gun library (or turret library)
module[MODULE_MASS_MOD]=200;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Shield Generator 1";
module[MODULE_DESCRIPTION]="Generates and stores shield energy.";
module[MODULE_TYPE]="generator";// command, cargo, thrust, lateral, gun
module[MODULE_SPRITE_INDEX] = spr_shield_gen_16_16_1;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=200;
module[MODULE_SHIELD_MOD]=25;//shield max is 200. testing was done at 100 for all
module[MODULE_SHIELDREGENPOINTS_MOD]=1;// testing default was 5
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Missile Launcher 1";
module[MODULE_DESCRIPTION]="Fires guided missiles.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_missile_launcher_16_48_1;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=8;// index in gun library (or turret library)
module[MODULE_MASS_MOD]=200;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Railgun 1";
module[MODULE_DESCRIPTION]="A slow but powerful weapon.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_railgun;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=9;// index in gun library (or turret library)
module[MODULE_MASS_MOD]=200;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Booster Module 1";
module[MODULE_DESCRIPTION]="Rapidly accelertates your ship and increases its max speed.";
module[MODULE_TYPE]="booster";// command, cargo, thrust, gun
module[MODULE_SPRITE_INDEX] = spr_booster_16_1;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=100;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Armor 1E";
module[MODULE_DESCRIPTION]="Basic armor.";
module[MODULE_TYPE]="armor";// command, cargo, thrust, lateral, gun
module[MODULE_SPRITE_INDEX] = spr_armor_16_16_3;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=BASE_ARMOR_MASS;
module[MODULE_HULL_MOD]=BASE_ARMOR_MOD;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Armor 1F";
module[MODULE_DESCRIPTION]="Basic armor.";
module[MODULE_TYPE]="armor";// command, cargo, thrust, lateral, gun
module[MODULE_SPRITE_INDEX] = spr_armor_16_16_8;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=BASE_ARMOR_MASS;
module[MODULE_HULL_MOD]=BASE_ARMOR_MOD;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Armor 1G";
module[MODULE_DESCRIPTION]="Basic armor.";
module[MODULE_TYPE]="armor";// command, cargo, thrust, lateral, gun
module[MODULE_SPRITE_INDEX] = spr_armor_16_16_9;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=BASE_ARMOR_MASS;
module[MODULE_HULL_MOD]=BASE_ARMOR_MOD;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Armor 1H";
module[MODULE_DESCRIPTION]="Basic armor.";
module[MODULE_TYPE]="armor";// command, cargo, thrust, lateral, gun
module[MODULE_SPRITE_INDEX] = spr_armor_16_16_13;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=BASE_ARMOR_MASS;
module[MODULE_HULL_MOD]=BASE_ARMOR_MOD;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Armor 1I";
module[MODULE_DESCRIPTION]="Basic armor.";
module[MODULE_TYPE]="armor";// command, cargo, thrust, lateral, gun
module[MODULE_SPRITE_INDEX] = spr_armor_16_16_11;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=BASE_ARMOR_MASS;
module[MODULE_HULL_MOD]=BASE_ARMOR_MOD;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Armor 1J";
module[MODULE_DESCRIPTION]="Basic armor.";
module[MODULE_TYPE]="armor";// command, cargo, thrust, lateral, gun
module[MODULE_SPRITE_INDEX] = spr_armor_16_16_12;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=BASE_ARMOR_MASS;
module[MODULE_HULL_MOD]=BASE_ARMOR_MOD;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Lateral Thruster 2";
module[MODULE_DESCRIPTION]="Turning thruster.";
module[MODULE_TYPE]="lateral";// command, cargo, thrust, lateral, gun
module[MODULE_SPRITE_INDEX] = spr_thrust_lat_16_16_2;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=5;
module[MODULE_TURN_MOD]=100;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Flak Turret 1";
module[MODULE_DESCRIPTION]="Short range urret-mounted weapon with a 8-bullet spread.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, turret, gun
module[MODULE_SPRITE_INDEX] = spr_turret_2;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=13;// Index from gun library, turret library, etc.
module[MODULE_MASS_MOD]=220;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Plama Turret 2";
module[MODULE_DESCRIPTION]="Medium range energy weapon.";
module[MODULE_TYPE]="gun";// command, cargo, thrust, turret, gun
module[MODULE_SPRITE_INDEX] = spr_turret_2;
module[MODULE_COLOR]=c_white;
module[MODULE_TYPE_INDEX]=14;// Index from gun library, turret library, etc.
module[MODULE_MASS_MOD]=220;
scr_push_array_1d(global.module_library, module);

module = scr_ship_module();
module[MODULE_NAME]="Armor 1K";
module[MODULE_DESCRIPTION]="Basic armor.";
module[MODULE_TYPE]="armor";
module[MODULE_SPRITE_INDEX] = spr_armor_16_32_2;
module[MODULE_COLOR]=c_white;
module[MODULE_MASS_MOD]=BASE_ARMOR_MASS;
module[MODULE_HULL_MOD]=BASE_ARMOR_MOD;
scr_push_array_1d(global.module_library, module);
