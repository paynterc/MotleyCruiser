/// Default values for ship
var map = noone;

map[SHIP_TURN_SPEED]=0;
map[SHIP_MAX_SPEED]=0;
map[SHIP_MAX_FWD]=0;
map[SHIP_MAX_RVS]=0;
map[SHIP_ACC_FWD]=0;
map[SHIP_ACC_RVS]=0;
map[SHIP_SHIELDS]=0;
map[SHIP_SHIELDS_REGEN_SPD]=0;
map[SHIP_SHIELDS_REGEN_PTS]=0;
map[SHIP_HULL]=0;
map[SHIP_ENERGY]=0;
map[SHIP_ENERGY_REGEN_SPD]=0;
map[SHIP_ENERGY_REGEN_PTS]=0;
map[SHIP_X1]=0;
map[SHIP_Y1]=0;
map[SHIP_ANGLE]=0;
map[SHIP_WEAPON_SPD]=0;
map[SHIP_SPRITE_INDEX]=spr_default;
map[SHIP_IMAGE_INDEX]=0;
map[SHIP_SECTOR]=noone;
map[SHIP_NPCS] = noone;
map[SHIP_MODULES] = noone;
map[SHIP_SCAFFOLD_SIZE] = 3;
map[SHIP_SCAFFOLD_SIZE] = 3;

map[SHIP_NAME_PERSONAL] = "Ship";
map[SHIP_FACTION] = FACTION_NEUTRAL;
map[SHIP_FUNCTION] = 0;// enum ship_function
map[SHIP_CLASS] = 3;// enum ship_class
map[SHIP_TYPE] = 0;// enum ship_type
map[SHIP_NAME_MODEL] = "ship";

map[SHIP_THRUST_FWD] = 0;
map[SHIP_THRUST_RVS] = 0;


return map;
