/// Data specific to a module installed on a ship.
// Includes reference to master module plus color and scaffold coordinates.
// This is what gets saved with the ship data

var module = noone;

module[I_MODULE_INDEX]=noone;
module[I_MODULE_COORDS] = noone;
module[I_MODULE_OFFSETS] = noone;
module[I_MODULE_XSCALE]=1;
module[I_MODULE_YSCALE]=1;
module[I_MODULE_COLOR]=c_white;
module[I_MODULE_DEPTH]=0;

return module;
