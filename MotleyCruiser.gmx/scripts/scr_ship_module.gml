/// Defaults for mounted ship module
/***
MODIFIERS
turn speed
max fwd speed
max rvs speed
acceleration fwd
acceleration rvs
shields
shield regen
shield regen points
max hull
max energy
energy regen speed
energy regen points
cargo
bunks
morale
mass!!

base price (modify this by percentage at each market)
***/

var module = noone;
module[MODULE_TYPE]=noone;// gun, thruster, turret, etc.
module[MODULE_TYPE_INDEX] = noone;// if I'm a gun, what is my index in the gun library?
module[MODULE_SPRITE_INDEX] = noone;
module[MODULE_XSCALE]=1;// Use these for flipping left or right, up or down.
module[MODULE_YSCALE]=1;
module[MODULE_COLOR]=c_white;
module[MODULE_DEPTH]=0;
module[MODULE_NAME]="default";
module[MODULE_DESCRIPTION]="";
module[MODULE_TURN_MOD]=0;
module[MODULE_THRUSTFWD_MOD]=0;
module[MODULE_THRUSTRVS_MOD]=0;
module[MODULE_ACCFWD_MOD]=0;
module[MODULE_ACCBWD_MOD]=0;
module[MODULE_SHIELD_MOD]=0;
module[MODULE_SHIELDREGEN_MOD]=0;
module[MODULE_SHIELDREGENPOINTS_MOD]=0;
module[MODULE_HULL_MOD]=5;
module[MODULE_ENERGY_MOD]=0;
module[MODULE_ENERGYREGEN_MOD]=0;
module[MODULE_ENERGYREGENPOINTS_MOD]=0;
module[MODULE_CARGO_MOD]=0;
module[MODULE_BUNKS_MOD]=0;
module[MODULE_MORALE_MOD]=0;
module[MODULE_MASS_MOD]=100;

return module;
